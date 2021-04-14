import re

from generators.util_generators import UtilGenerator


class ByteArrayGenerator(UtilGenerator):

	def __init__(self) -> None:
		super().__init__()
		self.template_regex = re.compile(
			"(\/\* BYTE_ARRAY_METHODS_START \*\/\n)(.*)(\n[\t ]*\/\* BYTE_ARRAY_METHODS_END \*\/)",
			flags=re.MULTILINE | re.DOTALL)
		self.loadTemplate()

	def generate_byte_array(self, byte_array_type_name, byte_array_type_details):
		assert len(byte_array_type_details.fields) == 1
		byte_array_field = byte_array_type_details.fields[0]
		array_length = byte_array_field.arr_len
		mutating_current_byte_array_methods = self.template
		mutating_current_byte_array_methods = mutating_current_byte_array_methods.replace('LDKByteType',
																						  byte_array_type_name)
		mutating_current_byte_array_methods = mutating_current_byte_array_methods.replace('fieldName:',
																						  f'{byte_array_field.var_name}:')
		tupleArguments = 'array[0]'
		tupleReads = f'byteType.{byte_array_field.var_name}.0'
		for i in range(1, array_length):
			tupleArguments += f', array[{i}]'
			tupleReads += f', byteType.{byte_array_field.var_name}.{i}'
		mutating_current_byte_array_methods = mutating_current_byte_array_methods.replace('tupleArguments',
																						  tupleArguments)
		mutating_current_byte_array_methods = mutating_current_byte_array_methods.replace('tupleReads',
																						  tupleReads)
		self.filled_template += "\n" + mutating_current_byte_array_methods + "\n"


