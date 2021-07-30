from src.binding_types import TypeInfo

def java_c_types(fn_arg, ret_arr_len, var_is_arr_regex, java_c_types_none_allowed, tuple_types, var_ty_regex, unitary_enums, language_constants):
    fn_arg = fn_arg.strip()
    if fn_arg.startswith("MUST_USE_RES "):
        fn_arg = fn_arg[13:]
    is_const = False
    if fn_arg.startswith("const "):
        fn_arg = fn_arg[6:]
        is_const = True
    if fn_arg.startswith("struct "):
        fn_arg = fn_arg[7:]
    if fn_arg.startswith("enum "):
        fn_arg = fn_arg[5:]
    fn_arg = fn_arg.replace("NONNULL_PTR", "")

    is_ptr = False
    take_by_ptr = False
    rust_obj = None
    arr_access = None
    java_hu_ty = None
    if fn_arg.startswith("LDKThirtyTwoBytes"):
        fn_arg = "uint8_t (*" + fn_arg[18:] + ")[32]"
        assert var_is_arr_regex.match(fn_arg[8:])
        rust_obj = "LDKThirtyTwoBytes"
        arr_access = "data"
    elif fn_arg.startswith("LDKPublicKey"):
        fn_arg = "uint8_t (*" + fn_arg[13:] + ")[33]"
        assert var_is_arr_regex.match(fn_arg[8:])
        rust_obj = "LDKPublicKey"
        arr_access = "compressed_form"
    elif fn_arg.startswith("LDKSecretKey"):
        fn_arg = "uint8_t (*" + fn_arg[13:] + ")[32]"
        assert var_is_arr_regex.match(fn_arg[8:])
        rust_obj = "LDKSecretKey"
        arr_access = "bytes"
    elif fn_arg.startswith("LDKSignature"):
        fn_arg = "uint8_t (*" + fn_arg[13:] + ")[64]"
        assert var_is_arr_regex.match(fn_arg[8:])
        rust_obj = "LDKSignature"
        arr_access = "compact_form"
    elif fn_arg.startswith("LDKThreeBytes"):
        fn_arg = "uint8_t (*" + fn_arg[14:] + ")[3]"
        assert var_is_arr_regex.match(fn_arg[8:])
        rust_obj = "LDKThreeBytes"
        arr_access = "data"
    elif fn_arg.startswith("LDKFourBytes"):
        fn_arg = "uint8_t (*" + fn_arg[13:] + ")[4]"
        assert var_is_arr_regex.match(fn_arg[8:])
        rust_obj = "LDKFourBytes"
        arr_access = "data"
    elif fn_arg.startswith("LDKSixteenBytes"):
        fn_arg = "uint8_t (*" + fn_arg[16:] + ")[16]"
        assert var_is_arr_regex.match(fn_arg[8:])
        rust_obj = "LDKSixteenBytes"
        arr_access = "data"
    elif fn_arg.startswith("LDKTenBytes"):
        fn_arg = "uint8_t (*" + fn_arg[12:] + ")[10]"
        assert var_is_arr_regex.match(fn_arg[8:])
        rust_obj = "LDKTenBytes"
        arr_access = "data"
    elif fn_arg.startswith("LDKu8slice"):
        fn_arg = "uint8_t (*" + fn_arg[11:] + ")[datalen]"
        assert var_is_arr_regex.match(fn_arg[8:])
        rust_obj = "LDKu8slice"
        arr_access = "data"
    elif fn_arg.startswith("LDKCVec_u8Z"):
        fn_arg = "uint8_t (*" + fn_arg[12:] + ")[datalen]"
        rust_obj = "LDKCVec_u8Z"
        assert var_is_arr_regex.match(fn_arg[8:])
        arr_access = "data"
    elif fn_arg.startswith("LDKTransaction"):
        fn_arg = "uint8_t (*" + fn_arg[15:] + ")[datalen]"
        rust_obj = "LDKTransaction"
        assert var_is_arr_regex.match(fn_arg[8:])
        arr_access = "data"
    elif fn_arg.startswith("LDKCVec_"):
        is_ptr = False
        if "*" in fn_arg:
            fn_arg = fn_arg.replace("*", "")
            is_ptr = True

        tyn = fn_arg[8:].split(" ")
        assert tyn[0].endswith("Z")
        if tyn[0] == "u64Z":
            new_arg = "uint64_t"
        else:
            new_arg = "LDK" + tyn[0][:-1]
        for a in tyn[1:]:
            new_arg = new_arg + " " + a
        res = java_c_types(new_arg, ret_arr_len, var_is_arr_regex, java_c_types_none_allowed, tuple_types, var_ty_regex, unitary_enums, language_constants)
        if res is None:
            assert java_c_types_none_allowed
            return None
        if is_ptr:
            res.pass_by_ref = True
        if res.is_native_primitive or res.passed_as_ptr:
            return TypeInfo(rust_obj=fn_arg.split(" ")[0], java_ty=res.java_ty + "[]", java_hu_ty=res.java_hu_ty + "[]",
                            java_fn_ty_arg="[" + res.java_fn_ty_arg, c_ty=res.c_ty + "Array", passed_as_ptr=False, is_ptr=is_ptr, is_const=is_const,
                            var_name=res.var_name, arr_len="datalen", arr_access="data", subty=res, is_native_primitive=False)
        else:
            return TypeInfo(rust_obj=fn_arg.split(" ")[0], java_ty=res.java_ty + "[]", java_hu_ty=res.java_hu_ty + "[]",
                            java_fn_ty_arg="[" + res.java_fn_ty_arg, c_ty=language_constants.ptr_arr, passed_as_ptr=False, is_ptr=is_ptr, is_const=is_const,
                            var_name=res.var_name, arr_len="datalen", arr_access="data", subty=res, is_native_primitive=False)

    is_primitive = False
    arr_len = None
    mapped_type = []
    java_type_plural = None
    if fn_arg.startswith("void"):
        java_ty = "void"
        c_ty = "void"
        fn_ty_arg = "V"
        fn_arg = fn_arg[4:].strip()
        is_primitive = True
    elif fn_arg.startswith("bool"):
        java_ty = "boolean"
        c_ty = "jboolean"
        fn_ty_arg = "Z"
        fn_arg = fn_arg[4:].strip()
        is_primitive = True
    elif fn_arg.startswith("uint8_t"):
        mapped_type = language_constants.c_type_map['uint8_t']
        java_ty = mapped_type[0]
        c_ty = "int8_t"
        fn_ty_arg = "B"
        fn_arg = fn_arg[7:].strip()
        is_primitive = True
    elif fn_arg.startswith("uint16_t"):
        mapped_type = language_constants.c_type_map['uint16_t']
        java_ty = mapped_type[0]
        c_ty = "int16_t"
        fn_ty_arg = "S"
        fn_arg = fn_arg[8:].strip()
        is_primitive = True
    elif fn_arg.startswith("uint32_t"):
        mapped_type = language_constants.c_type_map['uint32_t']
        java_ty = mapped_type[0]
        c_ty = "int32_t"
        fn_ty_arg = "I"
        fn_arg = fn_arg[8:].strip()
        is_primitive = True
    elif fn_arg.startswith("uint64_t") or fn_arg.startswith("uintptr_t"):
        # TODO: uintptr_t is arch-dependent :(
        mapped_type = language_constants.c_type_map['uint64_t']
        java_ty = mapped_type[0]
        fn_ty_arg = "J"
        if fn_arg.startswith("uint64_t"):
            c_ty = "int64_t"
            fn_arg = fn_arg[8:].strip()
        else:
            c_ty = "int64_t"
            rust_obj = "uintptr_t"
            fn_arg = fn_arg[9:].strip()
        is_primitive = True
    elif is_const and fn_arg.startswith("char *"):
        java_ty = "String"
        c_ty = "const char*"
        fn_ty_arg = "Ljava/lang/String;"
        fn_arg = fn_arg[6:].strip()
    elif fn_arg.startswith("LDKStr"):
        java_ty = "String"
        c_ty = "jstring"
        fn_ty_arg = "Ljava/lang/String;"
        fn_arg = fn_arg[6:].strip()
        arr_access = "chars"
        arr_len = "len"
    else:
        ma = var_ty_regex.match(fn_arg)
        if ma.group(1).strip() in unitary_enums:
            java_ty = ma.group(1).strip()
            c_ty = language_constants.result_c_ty
            fn_ty_arg = "Lorg/ldk/enums/" + ma.group(1).strip() + ";"
            fn_arg = ma.group(2).strip()
            rust_obj = ma.group(1).strip()
        elif ma.group(1).strip().startswith("LDKC2Tuple"):
            c_ty = language_constants.ptr_c_ty
            java_ty = language_constants.ptr_native_ty
            java_hu_ty = "TwoTuple<"
            if not ma.group(1).strip() in tuple_types:
                assert java_c_types_none_allowed
                return None
            for idx, ty_info in enumerate(tuple_types[ma.group(1).strip()][0]):
                if idx != 0:
                    java_hu_ty = java_hu_ty + ", "
                if ty_info.is_native_primitive:
                    if ty_info.java_hu_ty == "int":
                        java_hu_ty = java_hu_ty + "Integer" # Java concrete integer type is Integer, not Int
                    else:
                        java_hu_ty = java_hu_ty + ty_info.java_hu_ty.title() # If we're a primitive, capitalize the first letter
                else:
                    java_hu_ty = java_hu_ty + ty_info.java_hu_ty
            java_hu_ty = java_hu_ty + ">"
            fn_ty_arg = "J"
            fn_arg = ma.group(2).strip()
            rust_obj = ma.group(1).strip()
            take_by_ptr = True
        elif ma.group(1).strip().startswith("LDKC3Tuple"):
            c_ty = language_constants.ptr_c_ty
            java_ty = language_constants.ptr_native_ty
            java_hu_ty = "ThreeTuple<"
            if not ma.group(1).strip() in tuple_types:
                assert java_c_types_none_allowed
                return None
            for idx, ty_info in enumerate(tuple_types[ma.group(1).strip()][0]):
                if idx != 0:
                    java_hu_ty = java_hu_ty + ", "
                if ty_info.is_native_primitive:
                    if ty_info.java_hu_ty == "int":
                        java_hu_ty = java_hu_ty + "Integer" # Java concrete integer type is Integer, not Int
                    else:
                        java_hu_ty = java_hu_ty + ty_info.java_hu_ty.title() # If we're a primitive, capitalize the first letter
                else:
                    java_hu_ty = java_hu_ty + ty_info.java_hu_ty
            java_hu_ty = java_hu_ty + ">"
            fn_ty_arg = "J"
            fn_arg = ma.group(2).strip()
            rust_obj = ma.group(1).strip()
            take_by_ptr = True
        else:
            c_ty = language_constants.ptr_c_ty
            java_ty = language_constants.ptr_native_ty
            java_hu_ty = ma.group(1).strip().replace("LDKCResult", "Result").replace("LDK", "")
            fn_ty_arg = "J"
            fn_arg = ma.group(2).strip()
            rust_obj = ma.group(1).strip()
            take_by_ptr = True

    if fn_arg.startswith(" *") or fn_arg.startswith("*"):
        fn_arg = fn_arg.replace("*", "").strip()
        is_ptr = True
        c_ty = language_constants.ptr_c_ty
        java_ty = language_constants.ptr_native_ty
        fn_ty_arg = "J"

    var_is_arr = var_is_arr_regex.match(fn_arg)
    if var_is_arr is not None or ret_arr_len is not None:
        assert(not take_by_ptr)
        assert(not is_ptr)
        # is there a special case for plurals?
        if len(mapped_type) == 2:
            java_ty = mapped_type[1]
        else:
            java_ty = java_ty + "[]"
        c_ty = c_ty + "Array"
        if var_is_arr is not None:
            if var_is_arr.group(1) == "":
                return TypeInfo(rust_obj=rust_obj, java_ty=java_ty, java_hu_ty=java_ty, java_fn_ty_arg="[" + fn_ty_arg, c_ty=c_ty, is_const=is_const,
                                passed_as_ptr=False, is_ptr=False, var_name="arg", arr_len=var_is_arr.group(2), arr_access=arr_access, is_native_primitive=False)
            return TypeInfo(rust_obj=rust_obj, java_ty=java_ty, java_hu_ty=java_ty, java_fn_ty_arg="[" + fn_ty_arg, c_ty=c_ty, is_const=is_const,
                            passed_as_ptr=False, is_ptr=False, var_name=var_is_arr.group(1), arr_len=var_is_arr.group(2), arr_access=arr_access, is_native_primitive=False)

    if java_hu_ty is None:
        java_hu_ty = java_ty
    return TypeInfo(rust_obj=rust_obj, java_ty=java_ty, java_hu_ty=java_hu_ty, java_fn_ty_arg=fn_ty_arg, c_ty=c_ty, passed_as_ptr=is_ptr or take_by_ptr,
                    is_const=is_const, is_ptr=is_ptr, var_name=fn_arg, arr_len=arr_len, arr_access=arr_access, is_native_primitive=is_primitive)
