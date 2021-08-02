import enum
import os
import re
from src.config import Config
from src import java_type_mapper
from src import swift_constants
from src import type_mapping_generator
from src import swift_type_mapper
import src.conversion_helper


class CTypes(enum.Enum):
	OPAQUE_STRUCT = 1,
	TUPLE = 2,
	UNITARY_ENUM = 3,
	VECTOR = 4,
	BYTE_ARRAY = 5,
	OPTION = 6,
	RESULT = 7


class TypeDetails:

	def __init__(self) -> None:
		super().__init__()
		self.name = ''
		self.type = CTypes.OPAQUE_STRUCT
		self.fields = []
		self.methods = []
		self.lambdas = []
		self.constructor_method = None
		self.free_method = None
		self.is_primitive = False
		self.is_ownable = False
		self.primitive_swift_counterpart = None
		self.iteratee = None
		self.option_tuple_variants = None
		self.option_tag_field_lines = None
		self.option_tag_type = None
		self.option_value_type = None
		self.result_wrapper_type = None
		self.result_value_type = None
		self.result_error_type = None


class ComplexEnumVariantInfo:
	def __init__(self, var_name, fields, tuple_variant, container_type_name='', tag_value=''):
		self.var_name = var_name
		self.fields = fields
		self.tuple_variant = tuple_variant
		self.container_type_name = container_type_name
		self.tag_value = tag_value


class LightningHeaderParser():

	@classmethod
	def get_file(cls) -> str:
		header_path = Config.HEADER_FILE_PATH
		with open(header_path, 'r', encoding='utf-8') as lightning_header_handle:
			lightning_header = lightning_header_handle.read()
			return lightning_header

	def parse_header_file(self, header_file: str):

		self.header_file = header_file
		self.language_constants = swift_constants.Consts(False, swift_constants.Target.ANDROID)

		self.gather_types()
		self.populate_type_details()

		# sanity check of cloneable types
		print('\n\nCloneable types:\n', '\n '.join(sorted(list(dict.fromkeys(self.cloneable_types)))), '\n\n')

	def gather_types(self):
		self.unitary_enums = set()
		self.opaque_structs = set()
		self.tuple_types = {}
		self.global_methods = set()

		var_is_arr_regex = re.compile("\(\*([A-za-z0-9_]*)\)\[([a-z0-9]*)\]")
		var_ty_regex = re.compile("([A-za-z_0-9]*)(.*)")

		java_c_types_none_allowed = True

		fn_ptr_regex = re.compile("^extern const ([A-Za-z_0-9\* ]*) \(\*(.*)\)\((.*)\);$")
		fn_ret_arr_regex = re.compile("(.*) \(\*(.*)\((.*)\)\)\[([0-9]*)\];$")
		reg_fn_regex = re.compile("([A-Za-z_0-9\* ]* \*?)([a-zA-Z_0-9]*)\((.*)\);$")

		# clone_fns = set("ThirtyTwoBytes_clone")
		self.clone_fns = set()
		self.constructor_fns = {}

		# FIRST PASS
		for current_line in self.header_file.splitlines():
			reg_fn = reg_fn_regex.match(current_line)
			if reg_fn is not None:
				if reg_fn.group(2).endswith("_clone"):
					self.clone_fns.add(reg_fn.group(2))
				else:
					java_c_type_arguments = {"tuple_types": self.tuple_types, # "var_is_arr_regex": var_is_arr_regex,
						"java_c_types_none_allowed": java_c_types_none_allowed, # "var_ty_regex": var_ty_regex,
						"unitary_enums": self.unitary_enums, "language_constants": self.language_constants}
					# rty = java_type_mapper.java_c_types(reg_fn.group(1), None, **java_c_type_arguments)
					rty = swift_type_mapper.map_types_to_swift(reg_fn.group(1), None, **java_c_type_arguments)
					if rty is not None and not rty.is_native_primitive and reg_fn.group(2) == rty.swift_type + "_new":
						self.constructor_fns[rty.rust_obj] = reg_fn.group(3)
				continue
			arr_fn = fn_ret_arr_regex.match(current_line)
			if arr_fn is not None:
				if arr_fn.group(2).endswith("_clone"):
					self.clone_fns.add(arr_fn.group(2))
				# No object constructors return arrays, as then they wouldn't be an object constructor
				continue

		# after the top pass, we now disallow none
		java_c_types_none_allowed = False
		self.clone_fns.add("ThirtyTwoBytes_clone")  # add a function manually

	def populate_type_details(self):
		self.type_details = {}

		self.trait_structs = set()
		self.result_types = set()
		self.option_types = set()
		self.vec_types = set()
		self.byte_arrays = set()
		self.cloneable_types = set()
		self.union_enum_items = {}
		self.result_ptr_struct_items = {}
		self.static_methods = []

		fn_ptr_regex = re.compile("^extern const ([A-Za-z_0-9\* ]*) \(\*(.*)\)\((.*)\);$")
		fn_ret_arr_regex = re.compile("(.*) \(\*(.*)\((.*)\)\)\[([0-9]*)\];$")
		reg_fn_regex = re.compile("([A-Za-z_0-9\* ]* \*?)([a-zA-Z_0-9]*)\((.*)\);$")

		# SECOND PASS PREP

		in_block_comment = False
		block_object_being_parsed = None

		const_val_regex = re.compile("^extern const ([A-Za-z_0-9]*) ([A-Za-z_0-9]*);$")

		line_indicates_result_regex = re.compile("^union (LDKCResult_[A-Za-z_0-9]*Ptr) contents;$")
		line_indicates_vec_regex = re.compile("^(struct |enum |union )?([A-Za-z_0-9]*) \*data;$")
		line_indicates_opaque_regex = re.compile("^bool is_owned;$")
		line_indicates_trait_regex = re.compile("^(struct |enum |union )?([A-Za-z_0-9]* \*?)\(\*([A-Za-z_0-9]*)\)\((const )?void \*this_arg(.*)\);$")

		# for the oddball cases that aren't real trait lambdas, but ones without the this_arg
		line_indicates_nullable_trait_method_regex = re.compile("^(struct |enum |union )?([A-Za-z_0-9]* \*?)\(\*([A-Za-z_0-9]*)\)\((const )?(.*)\);$")
		assert (line_indicates_nullable_trait_method_regex.match('void (*set_pubkeys)(const struct LDKBaseSign*NONNULL_PTR );'))
		assert (line_indicates_nullable_trait_method_regex.match('struct LDKBaseSign (*BaseSign_clone)(const struct LDKBaseSign *NONNULL_PTR orig_BaseSign);'))

		assert (line_indicates_trait_regex.match("uintptr_t (*send_data)(void *this_arg, LDKu8slice data, bool resume_read);"))
		assert (line_indicates_trait_regex.match("struct LDKCVec_MessageSendEventZ (*get_and_clear_pending_msg_events)(const void *this_arg);"))
		assert (line_indicates_trait_regex.match("void *(*clone)(const void *this_arg);"))
		assert (line_indicates_trait_regex.match("struct LDKCVec_u8Z (*write)(const void *this_arg);"))
		line_field_var_regex = re.compile("^struct ([A-Za-z_0-9]*) ([A-Za-z_0-9]*);$")
		assert (line_field_var_regex.match("struct LDKMessageSendEventsProvider MessageSendEventsProvider;"))
		assert (line_field_var_regex.match("struct LDKChannelPublicKeys pubkeys;"))
		struct_name_regex = re.compile("^typedef (struct|enum|union) (MUST_USE_STRUCT )?(LDK[A-Za-z_0-9]*) {$")
		assert (struct_name_regex.match("typedef struct LDKCVec_u8Z {"))
		assert (struct_name_regex.match("typedef enum LDKNetwork {"))

		# SECOND PASS
		for line in self.header_file.splitlines():
			current_line = line.strip()

			# discard block comments
			if current_line.startswith('/*'):
				in_block_comment = True
			if in_block_comment:
				if current_line.endswith("*/"):
					in_block_comment = False
				continue

			if block_object_being_parsed is not None:
				block_object_being_parsed += current_line + "\n"
				if current_line.startswith("} "):
					current_block_object = block_object_being_parsed
					block_object_being_parsed = None

					field_lines = []
					struct_name = None
					vec_ty = None  # contains data field
					obj_lines = current_block_object.splitlines()
					is_opaque = False  # has is_owned property?
					result_contents = None  # is union of result pointers with contents fields
					is_unitary_enum = False
					is_union_enum = False
					is_union = False
					is_tuple = False
					trait_fn_lines = []
					field_var_lines = []
					is_ownable = False

					ordered_interpreted_lines = []

					for idx, struct_line in enumerate(obj_lines):
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
							# this check should only be run once, it can be moved out of the loop
							is_tuple = True
						trait_fn_match = line_indicates_trait_regex.match(struct_line)
						if trait_fn_match is not None:
							trait_fn_lines.append(trait_fn_match)
							ordered_interpreted_lines.append({"type": "lambda", "value": trait_fn_match})
						field_var_match = line_field_var_regex.match(struct_line)
						if field_var_match is not None:
							field_var_lines.append(field_var_match)
							ordered_interpreted_lines.append({"type": "field", "value": field_var_match})
						if trait_fn_match is None and field_var_match is None:
							nullable_trait_fn_match = line_indicates_nullable_trait_method_regex.match(struct_line)
							if nullable_trait_fn_match:
								ordered_interpreted_lines.append({"type": "nullable_lambda", "value": nullable_trait_fn_match})
								print(f'\nNullable trait property line: \n{struct_line}\n')
						if struct_line == 'bool is_owned;':
							is_ownable = True
						field_lines.append(struct_line)

					assert (struct_name is not None)
					assert (len(trait_fn_lines) == 0 or not (is_opaque or is_unitary_enum or is_union_enum or is_union or result_contents is not None or vec_ty is not None))
					assert (not is_opaque or not (len(trait_fn_lines) != 0 or is_unitary_enum or is_union_enum or is_union or result_contents is not None or vec_ty is not None))
					assert (not is_unitary_enum or not (len(trait_fn_lines) != 0 or is_opaque or is_union_enum or is_union or result_contents is not None or vec_ty is not None))
					assert (not is_union_enum or not (len(trait_fn_lines) != 0 or is_unitary_enum or is_opaque or is_union or result_contents is not None or vec_ty is not None))
					assert (not is_union or not (len(trait_fn_lines) != 0 or is_unitary_enum or is_union_enum or is_opaque or result_contents is not None or vec_ty is not None))
					assert (result_contents is None or not (len(trait_fn_lines) != 0 or is_unitary_enum or is_union_enum or is_opaque or is_union or vec_ty is not None))
					assert (vec_ty is None or not (len(trait_fn_lines) != 0 or is_unitary_enum or is_union_enum or is_opaque or is_union or result_contents is not None))

					current_type_detail = TypeDetails()
					current_type_detail.name = struct_name
					current_type_detail.is_ownable = is_ownable
					self.type_details[struct_name] = current_type_detail

					if is_opaque:
						self.type_details[struct_name].type = CTypes.OPAQUE_STRUCT
						self.opaque_structs.add(struct_name)
					# with open(f"{sys.argv[3]}/structs/{struct_name.replace('LDK', '')}{consts.file_ext}", "w") as out_java_struct:
					#     out_opaque_struct_human = consts.map_opaque_struct(struct_name)
					#     out_java_struct.write(out_opaque_struct_human)
					elif result_contents is not None:
						assert result_contents in self.result_ptr_struct_items
						self.type_details[struct_name].type = CTypes.RESULT
						res_ty, err_ty, wrapper_type = self.result_ptr_struct_items[result_contents]
						result_type_details = swift_type_mapper.map_types_to_swift(res_ty, None, False, self.tuple_types, self.unitary_enums, self.language_constants)
						error_type_details = swift_type_mapper.map_types_to_swift(err_ty, None, False, self.tuple_types, self.unitary_enums, self.language_constants)
						self.type_details[struct_name].result_wrapper_type = wrapper_type
						self.type_details[struct_name].result_value_type = result_type_details
						self.type_details[struct_name].result_error_type = error_type_details

					# map_result(struct_name, res_ty, err_ty)
					elif struct_name.startswith("LDKCResult_") and struct_name.endswith("ZPtr"):
						for current_line in field_lines:
							if current_line.endswith("*result;"):
								res_ty = current_line[:-8].strip()
							elif current_line.endswith("*err;"):
								err_ty = current_line[:-5].strip()
						self.result_ptr_struct_items[struct_name] = (res_ty, err_ty, struct_name)
						related_result_type = struct_name[:-3]
						self.result_types.add(
							related_result_type)  # self.type_details[related_result_type].result_value_type = res_ty  # self.type_details[related_result_type].result_error_type = err_ty
					elif is_tuple:
						self.type_details[struct_name].type = CTypes.TUPLE

						ty_list = []
						for idx, current_tuple_line in enumerate(field_lines):
							if idx != 0 and idx < len(field_lines) - 2:
								# ty_info = java_c_types(line.strip(';'), None)
								trimmed_tuple_line = current_tuple_line.strip(';')
								ty_info = swift_type_mapper.map_types_to_swift(trimmed_tuple_line, None, True, self.tuple_types, self.unitary_enums, self.language_constants)
								ty_list.append(ty_info)

						self.tuple_types[struct_name] = (ty_list, struct_name)
						# map_tuple(struct_name, field_lines)
						pass
					elif vec_ty is not None:
						# TODO: vector type (each one needs to be mapped)
						self.vec_types.add(struct_name)
						# vector_type_details = None
						vector_type_details = TypeDetails()  # iterator type
						vector_type_details.type = CTypes.VECTOR
						vector_type_details.name = struct_name

						# if 'LDKTransaction' not in self.type_details:
						if vec_ty in ['LDKTransaction', 'LDKSignature', 'LDKu8slice', 'LDKPublicKey']:
							vectored_type_details = TypeDetails()
							vectored_type_details.type = CTypes.VECTOR
							vectored_type_details.name = vec_ty
							vectored_type_details.is_primitive = True
							vectored_type_details.primitive_swift_counterpart = 'UInt8'
							vector_type_details.iteratee = vectored_type_details
						elif vec_ty in self.type_details:
							vectored_type_details = self.type_details[vec_ty]
							# vector_type_details.name = struct_name
							vector_type_details.is_primitive = False
							vector_type_details.iteratee = vectored_type_details
						else:
							# it's a primitive
							vector_type_details.is_primitive = True
							vector_type_details.primitive_swift_counterpart = self.language_constants.c_type_map[vec_ty]
						self.type_details[struct_name] = vector_type_details
					# pass
					elif is_union_enum:
						assert (struct_name.endswith("_Tag"))
						tag_name = struct_name
						struct_name = struct_name[:-4]
						self.union_enum_items[struct_name] = {"tag_name": tag_name, "field_lines": field_lines}
					elif struct_name.endswith("_Body") and struct_name.split("_")[0] in self.union_enum_items:
						enum_var_name = struct_name.split("_")
						self.union_enum_items[enum_var_name[0]][enum_var_name[1]] = field_lines
					elif struct_name in self.union_enum_items:
						self.type_details[struct_name].type = CTypes.OPTION

						tag_name = self.union_enum_items[struct_name]['tag_name']
						tag_field_lines = self.union_enum_items[struct_name]['field_lines']
						option_field_lines = field_lines
						option_details = self.parse_option_details(struct_name, option_field_lines, tag_field_lines)

						self.type_details[struct_name].option_tag_type = tag_name
						self.type_details[struct_name].option_value_type = option_details
						self.type_details[struct_name].option_tag_field_lines = tag_field_lines

						self.option_types.add(struct_name)
					elif is_unitary_enum:
						self.type_details[struct_name].type = CTypes.UNITARY_ENUM
						self.unitary_enums.add(struct_name)
						pass
					elif len(trait_fn_lines) > 0:
						self.trait_structs.add(struct_name)
						lambdas = self.parse_lambda_details(ordered_interpreted_lines)
						current_type_detail.lambdas = lambdas
					elif struct_name == "LDKTxOut":
						# TODO: why is this even a special case? It's Swift, we dgaf
						pass
					elif struct_name == 'LDKu5':
						# TODO: add LDKu5 conversion
						pass
					else:
						if len(field_lines) != 3:
							print('irregular byte array struct type:', struct_name)
							continue

						# print('byte array struct:', struct_name)
						self.byte_arrays.add(struct_name)
						self.type_details[struct_name].type = CTypes.BYTE_ARRAY

						assert len(field_lines) == 3
						byte_array_line = field_lines[1].strip(';')
						custom_line = 'uint8_t[32] data'
						byte_array_info = swift_type_mapper.map_types_to_swift(byte_array_line, None, True, self.tuple_types, self.unitary_enums, self.language_constants)

						self.type_details[struct_name].fields.append(byte_array_info)
			else:
				# there is no block-scoped object currently being parsed
				fn_ptr = fn_ptr_regex.match(current_line)
				fn_ret_arr = fn_ret_arr_regex.match(current_line)
				reg_fn = reg_fn_regex.match(current_line)
				const_val = const_val_regex.match(current_line)

				method_details = None

				if current_line.startswith("#include <"):
					pass
				elif current_line.startswith("typedef enum "):
					block_object_being_parsed = current_line + "\n"
				elif current_line.startswith("typedef struct "):
					block_object_being_parsed = current_line + "\n"
				elif current_line.startswith("typedef union "):
					block_object_being_parsed = current_line + "\n"
				elif fn_ptr is not None:
					method_details = self.parse_function_details(line, fn_ptr, None, None)
				elif fn_ret_arr is not None:
					method_details = self.parse_function_details(line, fn_ret_arr, fn_ret_arr.group(4), None)
				elif reg_fn is not None:
					method_details = self.parse_function_details(line, reg_fn, None, None)
				elif const_val_regex is not None:
					# TODO Map const variables
					pass
				else:
					assert (current_line == "\n")

				if method_details is not None:
					if method_details['belongs_to_struct'] or method_details['belongs_to_tuple']:
						associated_type_name = method_details['associated_type_name']['native']
						if method_details['is_free']:
							self.type_details[associated_type_name].free_method = method_details
						elif method_details['is_constructor']:
							# TODO: handle case for multiple constructors
							self.type_details[associated_type_name].constructor_method = method_details
						else:
							self.type_details[associated_type_name].methods.append(method_details)
					elif method_details['associated_type_name'] is not None:
						associated_type_name = method_details['associated_type_name']['native']
						self.type_details[associated_type_name].methods.append(method_details)
					else:
						is_independent = method_details['is_independent']
						native_method_name = method_details['name']['native']
						if is_independent or native_method_name in ['C2Tuple_BlockHashChannelManagerZ_read', 'C2Tuple_BlockHashChannelMonitorZ_read', 'FilesystemPersister_persist_manager']:
							print('native method:', native_method_name)
							if native_method_name not in self.global_methods:
								self.global_methods.add(native_method_name)
								self.static_methods.append(method_details)

	def parse_option_details(self, struct_name, option_field_lines, tag_field_lines):
		tuple_variants = {}
		complex_tuple_variant_list = []
		complex_tuple_variants = {}
		is_complex = False
		elem_items = -1
		relevant_union_enum_items = self.union_enum_items[struct_name]
		for current_option_line in option_field_lines:
			if current_option_line == "struct {":
				elem_items = 0
			elif current_option_line == "};":
				elem_items = -1
			elif elem_items > -1:
				current_option_line = current_option_line.strip()
				if current_option_line.startswith("struct "):
					current_option_line = current_option_line[7:]
				elif current_option_line.startswith("enum "):
					current_option_line = current_option_line[5:]
				split = current_option_line.split(" ")
				assert len(split) == 2
				tuple_variants[split[1].strip(";")] = split[0]
				elem_items += 1
				if elem_items > 1:
					# We don't currently support tuple variant with more than one element
					assert False

		enum_variants = []
		if not bool(tuple_variants):
			is_in_union = False
			for current_option_line in option_field_lines:
				if not is_in_union and current_option_line == 'union {':
					is_in_union = True
				elif is_in_union and current_option_line == '};':
					is_in_union = False
					break
				elif is_in_union:
					union_field_details = current_option_line.split(' ')
					union_field_type = union_field_details[0]
					union_field_name = union_field_details[1][:-1]
					complex_tuple_variant_list.append({"type": union_field_type, "name": union_field_name})
					complex_tuple_variants[union_field_name] = union_field_type
					is_complex = True

		inline_enum_variants = tuple_variants
		for idx, struct_line in enumerate(tag_field_lines):
			if idx == 0:
				assert (struct_line == "typedef enum %s_Tag {" % struct_name)
			elif idx == len(tag_field_lines) - 2:
				assert (struct_line.endswith("_Sentinel,"))
			elif idx == len(tag_field_lines) - 1:
				assert (struct_line == "} %s_Tag;" % struct_name)
			elif idx == len(tag_field_lines) - 0:  # unreachable
				assert (struct_line == "")
			else:
				raw_variant_name = struct_line.strip(' ,')
				variant_name = raw_variant_name[len(struct_name) + 1:]
				snaked_case_variant_name = self.camel_to_snake(variant_name)
				fields = []
				if "LDK" + variant_name in relevant_union_enum_items:
					current_type_name = struct_name + '_LDK' + variant_name + '_Body'
					enum_var_lines = relevant_union_enum_items["LDK" + variant_name]
					# print("option union enum item:", struct_name, variant_name, "is complex?", is_complex)

					# print('here')

					# for idx, field in enumerate(enum_var_lines):
					# 	if idx != 0 and idx < len(enum_var_lines) - 2 and field.strip() != "":
					# 		fields.append(swift_type_mapper.map_types_to_swift(field.strip(' ;'), None, False, self.tuple_types, self.unitary_enums,
					# 														   self.language_constants))

					for current_body_line in enum_var_lines:
						if current_body_line.startswith('typedef'):
							continue
						if current_body_line.startswith('}'):
							break
						if not current_body_line.endswith(';'):
							continue
						current_type_details = swift_type_mapper.map_types_to_swift(current_body_line.strip(';'), None, False, self.tuple_types, self.unitary_enums, self.language_constants)
						fields.append(current_type_details)

					# enum_variants.append(ComplexEnumVariantInfo(raw_variant_name, fields, False))
					enum_variants.append(ComplexEnumVariantInfo(snaked_case_variant_name, fields, False, current_type_name, raw_variant_name))
				elif snaked_case_variant_name in inline_enum_variants:
					current_type_name = inline_enum_variants[snaked_case_variant_name]
					current_variable_simulation = current_type_name + " " + snaked_case_variant_name
					fields.append(swift_type_mapper.map_types_to_swift(current_variable_simulation, None, False, self.tuple_types, self.unitary_enums, self.language_constants))
					# enum_variants.append(ComplexEnumVariantInfo(raw_variant_name, fields, True))
					enum_variants.append(ComplexEnumVariantInfo(snaked_case_variant_name, fields, True, current_type_name, raw_variant_name))
				elif is_complex and snaked_case_variant_name in complex_tuple_variants:
					print('ENTERING COMPLEX-ONLY PROCESSING')
					current_type_name = complex_tuple_variants[snaked_case_variant_name]
					body_field_lines = relevant_union_enum_items['LDK' + variant_name]
					for current_body_line in body_field_lines:
						if current_body_line.startswith('typedef'):
							continue
						if current_body_line.startswith('}'):
							break
						if not current_body_line.endswith(';'):
							continue
						current_type_details = swift_type_mapper.map_types_to_swift(current_body_line.strip(';'), None, False, self.tuple_types, self.unitary_enums, self.language_constants)
						fields.append(current_type_details)
					# current_variable_simulation = current_type_name + " " + snaked_case_variant_name
					# current_type_details = swift_type_mapper.map_types_to_swift(current_variable_simulation, None, False, self.tuple_types, self.unitary_enums, self.language_constants)
					# fields.append(current_type_details)
					enum_variants.append(ComplexEnumVariantInfo(snaked_case_variant_name, fields, True, current_type_name, raw_variant_name))
				else:
					enum_variants.append(ComplexEnumVariantInfo(raw_variant_name, fields, True))
		return enum_variants

	def parse_lambda_details(self, ordered_interpreted_lines):
		field_var_convs = []
		flattened_field_var_convs = []

		lambdas = []

		for current_interpreted_line in ordered_interpreted_lines:
			if current_interpreted_line['type'] == 'field':
				var_line = current_interpreted_line['value']
				current_field_type = var_line.group(1)
				current_field_name = var_line.group(2)
				if False and current_field_type in self.trait_structs:
					lambdas.append({'name': current_field_name, 'field_details': self.type_details[current_field_type], 'is_lambda': False})
				# flattened_field_var_convs.extend(self.type_details[current_field_type])
				else:
					mapped = swift_type_mapper.map_types_to_swift(current_field_type + " " + current_field_name, None, False, self.tuple_types, self.unitary_enums, self.language_constants)
					lambdas.append({'name': current_field_name, 'field_details': mapped, 'is_lambda': False})
			elif False and current_interpreted_line['type'] == 'nullable_lambda':
				fn_line = current_interpreted_line['value']
				lambdas.append({'name': fn_line.group(3), 'is_lambda': True, 'is_nullable': True})
			elif current_interpreted_line['type'] == 'lambda' or current_interpreted_line['type'] == 'nullable_lambda':
				fn_line = current_interpreted_line['value']
				ret_ty_info = swift_type_mapper.map_types_to_swift(fn_line.group(2).strip() + " ret", None, False, self.tuple_types, self.unitary_enums, self.language_constants)
				is_const = fn_line.group(4) is not None

				# if it's nullable, the type signature is collected incorrectly
				is_nullable = (current_interpreted_line['type'] == 'nullable_lambda')

				arg_tys = []
				for idx, arg in enumerate(fn_line.group(5).split(',')):
					if arg == "":
						continue
					arg_conv_info = swift_type_mapper.map_types_to_swift(arg, None, False, self.tuple_types, self.unitary_enums, self.language_constants)
					arg_tys.append(arg_conv_info)

				lambdas.append({'name': fn_line.group(3), 'is_lambda': True, 'is_nullable': is_nullable, 'is_constant': is_const, 'return_type': ret_ty_info, 'argument_types': arg_tys})

		return lambdas

	def parse_function_details(self, line, re_match, ret_arr_len, c_call_string):
		method_return_type = re_match.group(1)
		method_name = re_match.group(2)
		method_comma_separated_arguments = re_match.group(3)
		method_arguments = method_comma_separated_arguments.split(',')

		is_constructor = False
		is_free = method_name.endswith("_free")
		# is_clone = False
		is_clone = method_name.endswith('_clone')
		inferred_struct_name = method_name.split("_")[0]
		inferred_tuple_name = '_'.join(method_name.split('_')[:-1])
		belongs_to_struct = False
		belongs_to_tuple = False
		is_independent = False

		# return_type_info = type_mapping_generator.map_type(method_return_type, True, ret_arr_len, False, False)
		return_type_info = swift_type_mapper.map_types_to_swift(method_return_type, ret_arr_len, True, self.tuple_types, self.unitary_enums, self.language_constants)

		argument_types = []
		default_constructor_args = {}
		takes_self = False
		args_known = True

		for argument_index, argument in enumerate(method_arguments):
			# argument_conversion_info = type_mapping_generator.map_type(argument, False, None, is_free, True)
			argument_conversion_info = swift_type_mapper.map_types_to_swift(argument, None, False, self.tuple_types, self.unitary_enums, self.language_constants)
			if argument_index == 0 and argument_conversion_info.swift_type == inferred_struct_name:
				takes_self = True

			# TODO: deal with implied move semantics later
			# if argument_conversion_info.arg_conv is not None and "Warning" in argument_conversion_info.arg_conv:
			#     if argument_conversion_info.rust_obj in self.constructor_fns:
			#         assert not is_free
			#         for explode_arg in self.constructor_fns[argument_conversion_info.rust_obj].split(','):
			#             # explode_arg_conv = type_mapping_generator.map_type(explode_arg, False, None, False, True)
			#             explode_arg_conv = swift_type_mapper.map_types_to_swift(explode_arg, ret_arr_len, False,
			#                                                                     self.tuple_types,
			#                                                                     self.unitary_enums,
			#                                                                     self.language_constants)
			#             if explode_arg_conv.c_ty == "void":
			#                 # We actually want to handle this case, but for now its only used in NetGraphMsgHandler::new()
			#                 # which ends up resulting in a redundant constructor - both without arguments for the NetworkGraph.
			#                 args_known = False
			#                 pass
			#             if not argument_conversion_info.arg_name in default_constructor_args:
			#                 default_constructor_args[argument_conversion_info.arg_name] = []
			#             default_constructor_args[argument_conversion_info.arg_name].append(explode_arg_conv)
			argument_types.append(argument_conversion_info)
			pass

		if return_type_info.swift_type == inferred_struct_name:
			if takes_self:
				is_clone = True
			else:
				is_constructor = True

		if is_free:
			assert len(argument_types) == 1
			assert return_type_info.c_ty == "void"
		# assert len(method_arguments) == 1
		# assert method_return_type.strip() == 'void'

		out_java_struct = None
		associated_type_name = None
		native_struct_name = "LDK" + inferred_struct_name
		native_tuple_name = "LDK" + inferred_tuple_name
		# if (native_struct_name in self.opaque_structs or native_struct_name in self.trait_structs) and not is_free:
		if (native_struct_name not in self.type_details) and (native_tuple_name not in self.type_details):
			is_independent = True
		elif (native_struct_name in self.opaque_structs) or (native_struct_name in self.trait_structs):  # don't care if it's a free
			# belongs to struct
			belongs_to_struct = True
			associated_type_name = inferred_struct_name
		elif native_struct_name in self.option_types or native_struct_name in self.result_types:
			associated_type_name = inferred_struct_name
		elif native_tuple_name in self.option_types or native_tuple_name in self.result_types:
			associated_type_name = inferred_tuple_name
		elif method_name.startswith("C2Tuple_") and method_name.endswith("_read"):
			# belongs in utility methods
			inferred_struct_name = method_name.rsplit("_", 1)[0]
		# elif (native_tuple_name in self.tuple_types) and not is_free:
		elif native_tuple_name in self.tuple_types:  # don't care if it's a free
			associated_type_name = inferred_tuple_name
			belongs_to_tuple = True
		if out_java_struct is not None:
			pass

		clean_method_name = method_name
		if associated_type_name is not None and method_name.startswith(associated_type_name):
			clean_method_name = method_name[len(associated_type_name) + 1:]
			if clean_method_name != method_name:
				# print(f'Method cleaning: "{method_name}" -> "{clean_method_name}"')
				pass

		if is_clone:
			if inferred_struct_name != inferred_tuple_name:
				# print(f'unequal struct/tuple inference: "{inferred_struct_name}" vs. "{inferred_tuple_name}"')
				src.conversion_helper.cloneable_types.add(inferred_tuple_name)
				self.cloneable_types.add(inferred_tuple_name)
			else:
				self.cloneable_types.add(inferred_struct_name)
				src.conversion_helper.cloneable_types.add(inferred_struct_name)

		return {'struct_method': inferred_struct_name, 'associated_type_name': None if associated_type_name is None else {'native': 'LDK' + associated_type_name, 'swift': associated_type_name},
			'is_free': is_free, 'is_constructor': is_constructor, 'is_clone': is_clone, 'takes_self': takes_self, 'name': {'native': method_name, 'swift': clean_method_name},
			'arguments': method_arguments, 'argument_types': argument_types, 'return_value': method_return_type, 'return_type': return_type_info, 'belongs_to_struct': belongs_to_struct,
			'belongs_to_tuple': belongs_to_tuple, 'is_independent': is_independent}

	@staticmethod
	def camel_to_snake(s):
		# Convert camel case to snake case, in a way that appears to match cbindgen
		con = "_"
		ret = ""
		lastchar = ""
		lastund = False
		for char in s:
			if lastchar.isupper():
				if not char.isupper() and not lastund:
					ret = ret + "_"
					lastund = True
				else:
					lastund = False
				ret = ret + lastchar.lower()
			else:
				ret = ret + lastchar
				if char.isupper() and not lastund:
					ret = ret + "_"
					lastund = True
				else:
					lastund = False
			lastchar = char
			if char.isnumeric():
				lastund = True
		return (ret + lastchar.lower()).strip("_")
