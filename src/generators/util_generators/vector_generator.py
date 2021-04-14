import re

from generators.util_generators import UtilGenerator

class VectorGenerator(UtilGenerator):

	def __init__(self) -> None:
		super().__init__()
		self.template_regex = re.compile(
			"(\/\* VECTOR_METHODS_START \*\/\n)(.*)(\n[\t ]*\/\* VECTOR_METHODS_END \*\/)",
			flags=re.MULTILINE | re.DOTALL)
		self.loadTemplate()

	def generate_vector(self, vector_name, vector_type_details):
		if not vector_type_details.is_primitive:
			# TODO: add non-primitive tuple support
			return
		mutating_current_vector_methods = self.template
		mutating_current_vector_methods = mutating_current_vector_methods.replace('LDKCVec_rust_primitive', vector_name)
		mutating_current_vector_methods = mutating_current_vector_methods.replace('SwiftPrimitive',
																				  vector_type_details.primitive_swift_counterpart)
		self.filled_template += "\n"+mutating_current_vector_methods+"\n"
