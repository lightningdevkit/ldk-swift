import os
import re
import java_type_mapper
import swift_constants
import type_mapping_generator
from generators.opaque_struct_generator import OpaqueStructGenerator



def get_file() -> str:
    # header_path = f'{os.path.dirname(__file__)}/../input/lightning.h'
    header_path = f'{os.path.dirname(__file__)}/../input/minimal.h'
    with open(header_path, 'r') as lightning_header_handle:
        lightning_header = lightning_header_handle.read()
        return lightning_header

def parse_header_file(header_file: str):
    unitary_enums = set()
    complex_enums = set()
    opaque_structs = set()
    trait_structs = set()
    result_types = set()
    tuple_types = {}

    var_is_arr_regex = re.compile("\(\*([A-za-z0-9_]*)\)\[([a-z0-9]*)\]")
    var_ty_regex = re.compile("([A-za-z_0-9]*)(.*)")

    java_c_types_none_allowed = True

    fn_ptr_regex = re.compile("^extern const ([A-Za-z_0-9\* ]*) \(\*(.*)\)\((.*)\);$")
    fn_ret_arr_regex = re.compile("(.*) \(\*(.*)\((.*)\)\)\[([0-9]*)\];$")
    reg_fn_regex = re.compile("([A-Za-z_0-9\* ]* \*?)([a-zA-Z_0-9]*)\((.*)\);$")

    # clone_fns = set("ThirtyTwoBytes_clone")
    clone_fns = set()
    constructor_fns = {}

    language_constants = swift_constants.Consts(False, swift_constants.Target.ANDROID)

    # FIRST PASS
    for line in header_file.splitlines():
        reg_fn = reg_fn_regex.match(line)
        if reg_fn is not None:
            if reg_fn.group(2).endswith("_clone"):
                clone_fns.add(reg_fn.group(2))
            else:
                java_c_type_arguments = {
                    "tuple_types": tuple_types,
                    "var_is_arr_regex": var_is_arr_regex,
                    "java_c_types_none_allowed": java_c_types_none_allowed,
                    "var_ty_regex": var_ty_regex,
                    "unitary_enums": unitary_enums,
                    "language_constants": language_constants
                }
                rty = java_type_mapper.java_c_types(reg_fn.group(1), None, **java_c_type_arguments)
                if rty is not None and not rty.is_native_primitive and reg_fn.group(2) == rty.java_hu_ty + "_new":
                    constructor_fns[rty.rust_obj] = reg_fn.group(3)
            continue
        arr_fn = fn_ret_arr_regex.match(line)
        if arr_fn is not None:
            if arr_fn.group(2).endswith("_clone"):
                clone_fns.add(arr_fn.group(2))
            # No object constructors return arrays, as then they wouldn't be an object constructor
            continue

    # after the top pass, we now disallow none
    java_c_types_none_allowed = False
    clone_fns.add("ThirtyTwoBytes_clone") # add a function manually


    # SECOND PASS PREP

    in_block_comment = False
    cur_block_obj = None
    mapping_generator_arguments = {
        # 'java_c_types': java_type_mapper.java_c_types, # callback method
        "consts": language_constants,
        'opaque_structs': opaque_structs,
        'clone_fns': clone_fns,
        "unitary_enums": unitary_enums,
        'trait_structs': trait_structs,
        'complex_enums': complex_enums,
        'result_types': result_types,
        "tuple_types": tuple_types,

        'var_is_arr_regex': var_is_arr_regex,
        'var_ty_regex': var_ty_regex
    }
    type_mapper = type_mapping_generator.TypeMappingGenerator(**mapping_generator_arguments)

    const_val_regex = re.compile("^extern const ([A-Za-z_0-9]*) ([A-Za-z_0-9]*);$")

    line_indicates_result_regex = re.compile("^   union (LDKCResult_[A-Za-z_0-9]*Ptr) contents;$")
    line_indicates_vec_regex = re.compile("^   (struct |enum |union )?([A-Za-z_0-9]*) \*data;$")
    line_indicates_opaque_regex = re.compile("^   bool is_owned;$")
    line_indicates_trait_regex = re.compile("^   (struct |enum |union )?([A-Za-z_0-9]* \*?)\(\*([A-Za-z_0-9]*)\)\((const )?void \*this_arg(.*)\);$")
    assert(line_indicates_trait_regex.match("   uintptr_t (*send_data)(void *this_arg, LDKu8slice data, bool resume_read);"))
    assert(line_indicates_trait_regex.match("   struct LDKCVec_MessageSendEventZ (*get_and_clear_pending_msg_events)(const void *this_arg);"))
    assert(line_indicates_trait_regex.match("   void *(*clone)(const void *this_arg);"))
    assert(line_indicates_trait_regex.match("   struct LDKCVec_u8Z (*write)(const void *this_arg);"))
    line_field_var_regex = re.compile("^   struct ([A-Za-z_0-9]*) ([A-Za-z_0-9]*);$")
    assert(line_field_var_regex.match("   struct LDKMessageSendEventsProvider MessageSendEventsProvider;"))
    assert(line_field_var_regex.match("   struct LDKChannelPublicKeys pubkeys;"))
    struct_name_regex = re.compile("^typedef (struct|enum|union) (MUST_USE_STRUCT )?(LDK[A-Za-z_0-9]*) {$")
    assert(struct_name_regex.match("typedef struct LDKCVec_u8Z {"))
    assert(struct_name_regex.match("typedef enum LDKNetwork {"))

    union_enum_items = {}
    result_ptr_struct_items = {}

    # SECOND PASS
    for line in header_file.splitlines():
        if in_block_comment:
            if line.endswith("*/\n") or line.endswith("*/"):
                in_block_comment = False
        elif cur_block_obj is not None:
            cur_block_obj += line + "\n"
            if line.startswith("} "):
                field_lines = []
                struct_name = None
                vec_ty = None
                obj_lines = cur_block_obj.split("\n")
                is_opaque = False
                result_contents = None
                is_unitary_enum = False
                is_union_enum = False
                is_union = False
                is_tuple = False
                trait_fn_lines = []
                field_var_lines = []

                for idx, struct_line in enumerate(obj_lines):
                    if struct_line.strip().startswith("/*"):
                        in_block_comment = True
                    if in_block_comment:
                        if struct_line.endswith("*/"):
                            in_block_comment = False
                    else:
                        struct_name_match = struct_name_regex.match(struct_line)
                        if struct_name_match is not None:
                            struct_name = struct_name_match.group(3)
                            if struct_name_match.group(1) == "enum":
                                if not struct_name.endswith("_Tag"):
                                    is_unitary_enum = True
                                else:
                                    is_union_enum = True
                            elif struct_name_match.group(1) == "union":
                                is_union = True
                        if line_indicates_opaque_regex.match(struct_line):
                            is_opaque = True
                        result_match = line_indicates_result_regex.match(struct_line)
                        if result_match is not None:
                            result_contents = result_match.group(1)
                        vec_ty_match = line_indicates_vec_regex.match(struct_line)
                        if vec_ty_match is not None and struct_name.startswith("LDKCVec_"):
                            vec_ty = vec_ty_match.group(2)
                        elif struct_name.startswith("LDKC2Tuple_") or struct_name.startswith("LDKC3Tuple_"):
                            is_tuple = True
                        trait_fn_match = line_indicates_trait_regex.match(struct_line)
                        if trait_fn_match is not None:
                            trait_fn_lines.append(trait_fn_match)
                        field_var_match = line_field_var_regex.match(struct_line)
                        if field_var_match is not None:
                            field_var_lines.append(field_var_match)
                        field_lines.append(struct_line)

                assert(struct_name is not None)
                assert(len(trait_fn_lines) == 0 or not (is_opaque or is_unitary_enum or is_union_enum or is_union or result_contents is not None or vec_ty is not None))
                assert(not is_opaque or not (len(trait_fn_lines) != 0 or is_unitary_enum or is_union_enum or is_union or result_contents is not None or vec_ty is not None))
                assert(not is_unitary_enum or not (len(trait_fn_lines) != 0 or is_opaque or is_union_enum or is_union or result_contents is not None or vec_ty is not None))
                assert(not is_union_enum or not (len(trait_fn_lines) != 0 or is_unitary_enum or is_opaque or is_union or result_contents is not None or vec_ty is not None))
                assert(not is_union or not (len(trait_fn_lines) != 0 or is_unitary_enum or is_union_enum or is_opaque or result_contents is not None or vec_ty is not None))
                assert(result_contents is None or not (len(trait_fn_lines) != 0 or is_unitary_enum or is_union_enum or is_opaque or is_union or vec_ty is not None))
                assert(vec_ty is None or not (len(trait_fn_lines) != 0 or is_unitary_enum or is_union_enum or is_opaque or is_union or result_contents is not None))

                if is_opaque:
                    opaque_structs.add(struct_name)
                    # with open(f"{sys.argv[3]}/structs/{struct_name.replace('LDK', '')}{consts.file_ext}", "w") as out_java_struct:
                    #     out_opaque_struct_human = consts.map_opaque_struct(struct_name)
                    #     out_java_struct.write(out_opaque_struct_human)
                elif result_contents is not None:
                    assert result_contents in result_ptr_struct_items
                    res_ty, err_ty = result_ptr_struct_items[result_contents]
                    # map_result(struct_name, res_ty, err_ty)
                elif struct_name.startswith("LDKCResult_") and struct_name.endswith("ZPtr"):
                    for line in field_lines:
                        if line.endswith("*result;"):
                            res_ty = line[:-8].strip()
                        elif line.endswith("*err;"):
                            err_ty = line[:-5].strip()
                    result_ptr_struct_items[struct_name] = (res_ty, err_ty)
                    result_types.add(struct_name[:-3])
                elif is_tuple:
                    # map_tuple(struct_name, field_lines)
                    pass
                elif vec_ty is not None:
                    ty_info = type_mapper.map_type(vec_ty + " arr_elem", False, None, False, False)
                    # if len(ty_info.java_fn_ty_arg) == 1: # ie we're a primitive of some form
                    #     out_java.write("\tpublic static native long " + struct_name + "_new(" + ty_info.java_ty + "[] elems);\n")
                    #     write_c(consts.c_fn_ty_pfx + consts.ptr_c_ty + " " + consts.c_fn_name_define_pfx(struct_name + "_new", True) + ty_info.c_ty + "Array elems) {\n")
                    #     write_c("\t" + struct_name + " *ret = MALLOC(sizeof(" + struct_name + "), \"" + struct_name + "\");\n")
                    #     write_c("\tret->datalen = " + consts.get_native_arr_len_call[0] + "elems" + consts.get_native_arr_len_call[1] + ";\n")
                    #     write_c("\tif (ret->datalen == 0) {\n")
                    #     write_c("\t\tret->data = NULL;\n")
                    #     write_c("\t} else {\n")
                    #     write_c("\t\tret->data = MALLOC(sizeof(" + vec_ty + ") * ret->datalen, \"" + struct_name + " Data\");\n")
                    #     native_arr_ptr_call = consts.get_native_arr_ptr_call(ty_info.ty_info)
                    #     write_c("\t\t" + ty_info.c_ty + " *java_elems = " + native_arr_ptr_call[0] + "elems" + native_arr_ptr_call[1] + ";\n")
                    #     write_c("\t\tfor (size_t i = 0; i < ret->datalen; i++) {\n")
                    #     if ty_info.arg_conv is not None:
                    #         write_c("\t\t\t" + ty_info.c_ty + " arr_elem = java_elems[i];\n")
                    #         write_c("\t\t\t" + ty_info.arg_conv.replace("\n", "\n\t\t\t") + "\n")
                    #         write_c("\t\t\tret->data[i] = " + ty_info.arg_conv_name + ";\n")
                    #         assert ty_info.arg_conv_cleanup is None
                    #     else:
                    #         write_c("\t\t\tret->data[i] = java_elems[i];\n")
                    #     write_c("\t\t}\n")
                    #     cleanup = consts.release_native_arr_ptr_call(ty_info.ty_info, "elems", "java_elems")
                    #     if cleanup is not None:
                    #         write_c("\t\t" + cleanup + ";\n")
                    #     write_c("\t}\n")
                    #     write_c("\treturn (long)ret;\n")
                    #     write_c("}\n")
                    #
                    # if ty_info.is_native_primitive:
                    #     clone_fns.add(struct_name.replace("LDK", "") + "_clone")
                    #     write_c("static inline " + struct_name + " " + struct_name.replace("LDK", "") + "_clone(const " + struct_name + " *orig) {\n")
                    #     write_c("\t" + struct_name + " ret = { .data = MALLOC(sizeof(" + ty_info.c_ty + ") * orig->datalen, \"" + struct_name + " clone bytes\"), .datalen = orig->datalen };\n")
                    #     write_c("\tmemcpy(ret.data, orig->data, sizeof(" + ty_info.c_ty + ") * ret.datalen);\n")
                    #     write_c("\treturn ret;\n}\n")
                    # elif (ty_info.rust_obj.replace("LDK", "") + "_clone") in clone_fns:
                    #     ty_name = "CVec_" + ty_info.rust_obj.replace("LDK", "") + "Z";
                    #     clone_fns.add(ty_name + "_clone")
                    #     write_c("static inline " + struct_name + " " + ty_name + "_clone(const " + struct_name + " *orig) {\n")
                    #     write_c("\t" + struct_name + " ret = { .data = MALLOC(sizeof(" + ty_info.rust_obj + ") * orig->datalen, \"" + struct_name + " clone bytes\"), .datalen = orig->datalen };\n")
                    #     write_c("\tfor (size_t i = 0; i < ret.datalen; i++) {\n")
                    #     write_c("\t\tret.data[i] = " + ty_info.rust_obj.replace("LDK", "") + "_clone(&orig->data[i]);\n")
                    #     write_c("\t}\n\treturn ret;\n}\n")
                elif is_union_enum:
                    assert(struct_name.endswith("_Tag"))
                    struct_name = struct_name[:-4]
                    union_enum_items[struct_name] = {"field_lines": field_lines}
                elif struct_name.endswith("_Body") and struct_name.split("_")[0] in union_enum_items:
                    enum_var_name = struct_name.split("_")
                    union_enum_items[enum_var_name[0]][enum_var_name[1]] = field_lines
                elif struct_name in union_enum_items:
                    # map_complex_enum(struct_name, union_enum_items[struct_name])
                    pass
                elif is_unitary_enum:
                    # map_unitary_enum(struct_name, field_lines)
                    pass
                elif len(trait_fn_lines) > 0:
                    trait_structs.add(struct_name)
                    # map_trait(struct_name, field_var_lines, trait_fn_lines)
                elif struct_name == "LDKTxOut":
                    # with open(f"{sys.argv[3]}/structs/TxOut{consts.file_ext}", "w") as out_java_struct:
                    #     out_java_struct.write(consts.hu_struct_file_prefix)
                    #     out_java_struct.write("public class TxOut extends CommonBase{\n")
                    #     out_java_struct.write("\tTxOut(java.lang.Object _dummy, long ptr) { super(ptr); }\n")
                    #     out_java_struct.write("\tlong to_c_ptr() { return 0; }\n")
                    #     out_java_struct.write("\t@Override @SuppressWarnings(\"deprecation\")\n")
                    #     out_java_struct.write("\tprotected void finalize() throws Throwable {\n")
                    #     out_java_struct.write("\t\tsuper.finalize();\n")
                    #     out_java_struct.write("\t\tif (ptr != 0) { bindings.TxOut_free(ptr); }\n")
                    #     out_java_struct.write("\t}\n")
                    #     # TODO: TxOut body
                    #     out_java_struct.write("}")
                    pass
                else:
                    pass # Everything remaining is a byte[] or some form
                cur_block_obj = None
        else:
            fn_ptr = fn_ptr_regex.match(line)
            fn_ret_arr = fn_ret_arr_regex.match(line)
            reg_fn = reg_fn_regex.match(line)
            const_val = const_val_regex.match(line)

            if line.startswith("#include <"):
                pass
            elif line.startswith("/*"):
                #out_java.write("\t" + line)
                if not line.endswith("*/\n"):
                    in_block_comment = True
            elif line.startswith("typedef enum "):
                cur_block_obj = line + "\n"
            elif line.startswith("typedef struct "):
                cur_block_obj = line + "\n"
            elif line.startswith("typedef union "):
                cur_block_obj = line + "\n"
            elif fn_ptr is not None:
                # map_fn(line, fn_ptr, None, None)
                pass
            elif fn_ret_arr is not None:
                # map_fn(line, fn_ret_arr, fn_ret_arr.group(4), None)
                pass
            elif reg_fn is not None:
                # map_fn(line, reg_fn, None, None)
                pass
            elif const_val_regex is not None:
                # TODO Map const variables
                pass
            else:
                assert(line == "\n")

    return {
        'tuple_types': tuple_types,
        'unitary_enums': unitary_enums,
        'opaque_structs': opaque_structs
    }

header_file = get_file()
parsed_types = parse_header_file(header_file)

opaque_struct_generator = OpaqueStructGenerator()
opaque_struct_generator.generate_opaque_struct()

