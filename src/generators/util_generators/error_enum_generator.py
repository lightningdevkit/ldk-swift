import re

from src.generators.util_generators import UtilGenerator
from src.conversion_helper import ConversionHelper


class ErrorEnumGenerator(UtilGenerator):

	def __init__(self) -> None:
		super().__init__()
		self.template_regex = re.compile("(\/\* ERROR_ENUM_START \*\/\n)(.*)(\n[\t ]*\/\* ERROR_ENUM_END \*\/)", flags=re.MULTILINE | re.DOTALL)
		self.loadTemplate()
		self.raw_tuple_generators = {}

	def generate_error_enum(self):

		error_types = ConversionHelper.swift_error_types


		enum_string = '''
			public enum Error: Swift.Error {
				case void
		'''

		for current_swift_type in error_types:
			if current_swift_type == 'Void':
				continue
			case_name = ConversionHelper.swift_type_to_case_name(current_swift_type)
			enum_string += f'\n\t\t\t\tcase {case_name}({current_swift_type})'

		enum_string += '\n\t\t\t}\n'

		self.filled_template += enum_string
