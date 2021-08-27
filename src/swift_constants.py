from src.binding_types import *
from enum import Enum


class Target(Enum):
	JAVA = 1,
	ANDROID = 2


class Consts:
	def __init__(self, DEBUG: bool, target: Target, **kwargs):
		self.target = target
		self.c_array_class_caches = set()
		self.c_type_map = dict(uint8_t='UInt8', uint16_t='UInt16', uint32_t='UInt32', uint64_t='UInt64', )

		self.to_hu_conv_templates = dict(ptr='{human_type} {var_name}_hu_conv = new {human_type}(null, {var_name});', default='{human_type} {var_name}_hu_conv = new {human_type}(null, {var_name});')

		self.c_fn_ty_pfx = "JNIEXPORT "
		self.c_fn_args_pfx = "JNIEnv *env, jclass clz"
		self.file_ext = ".java"
		self.ptr_c_ty = "int64_t"
		# self.ptr_native_ty = "long"
		self.ptr_native_ty = "UInt"  # TODO: verify that all target architectures are 64 bit
		self.result_c_ty = "jclass"
		self.ptr_arr = "jobjectArray"
		self.get_native_arr_len_call = ("(*env)->GetArrayLength(env, ", ")")
