import re

from generators.util_generators import UtilGenerator


class ByteArrayGenerator(UtilGenerator):

	def __init__(self) -> None:
		super().__init__()
		self.template_regex = re.compile(
			"(\/\* BYTE_ARRAY_METHODS_START \*\/\n)(.*)(\n[\t ]*\/\* BYTE_ARRAY_METHODS_END \*\/)",
			flags=re.MULTILINE | re.DOTALL)
		self.loadTemplate()
		self.raw_tuple_generators = {}

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
		tupleReads = f'nativeType.{byte_array_field.var_name}.0'
		rawTupleReads = f'nativeType.0'
		for i in range(1, array_length):
			tupleArguments += f', array[{i}]'
			tupleReads += f', nativeType.{byte_array_field.var_name}.{i}'
			rawTupleReads += f', nativeType.{i}'
		mutating_current_byte_array_methods = mutating_current_byte_array_methods.replace('tupleArguments',
																						  tupleArguments)
		mutating_current_byte_array_methods = mutating_current_byte_array_methods.replace('tupleReads',
																						  tupleReads)
		self.filled_template += "\n" + mutating_current_byte_array_methods + "\n"

		if not array_length in self.raw_tuple_generators:
			self.raw_tuple_generators[array_length] = True
			current_generator = f"""
			static func array_to_tuple{array_length}(array: [UInt8]) -> {byte_array_field.swift_raw_type} {{
        		return ({tupleArguments})
			}}

    		static func tuple{array_length}_to_array(nativeType: {byte_array_field.swift_raw_type}) -> [UInt8] {{
				let array = [{rawTupleReads}]
				return array
			}}
			"""

			self.filled_template += current_generator + "\n"

	def generate_tuple_converter(self, array_length):
		if array_length in self.raw_tuple_generators:
			return

		self.raw_tuple_generators[array_length] = True

		swift_raw_type = f'({",".join(["UInt8"] * array_length)})'
		tupleArguments = 'array[0]'
		rawTupleReads = f'nativeType.0'
		for i in range(1, array_length):
			tupleArguments += f', array[{i}]'
			rawTupleReads += f', nativeType.{i}'

		current_generator = f"""
			public class func array_to_tuple{array_length}(array: [UInt8]) -> {swift_raw_type} {{
				return ({tupleArguments})
			}}
	
			public class func tuple{array_length}_to_array(nativeType: {swift_raw_type}) -> [UInt8] {{
				let array = [{rawTupleReads}]
				return array
			}}
		"""

		self.filled_template += current_generator + "\n"


