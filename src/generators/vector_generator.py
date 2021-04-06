import re
import os


class VectorGenerator:

	def __init__(self) -> None:
		super().__init__()
		template_path = f'{os.path.dirname(__file__)}/../../templates/BindingsTemplate.swift'
		with open(template_path, 'r') as template_handle:
			self.bindings_template = template_handle.read()
			self.vector_template_regex = re.compile(
				"(\/\* VECTOR_METHODS_START \*\/\n)(.*)(\n[\t ]*\/\* VECTOR_METHODS_END \*\/)",
				flags=re.MULTILINE | re.DOTALL)
			self.template = self.vector_template_regex.search(self.bindings_template).group(2)
			self.mutating_vector_methods = ''

	def generate_vector(self, vector_name, vector_type_details):
		if not vector_type_details.is_primitive:
			# TODO: add non-primitive tuple support
			return
		mutating_current_vector_methods = self.template
		mutating_current_vector_methods = mutating_current_vector_methods.replace('LDKCVec_rust_primitive', vector_name)
		mutating_current_vector_methods = mutating_current_vector_methods.replace('SwiftPrimitive',
																				  vector_type_details.primitive_swift_counterpart)
		self.mutating_vector_methods += "\n"+mutating_current_vector_methods+"\n"

	def finalize(self):
		filled_template = self.vector_template_regex.sub(f'\g<1>{self.mutating_vector_methods}\g<3>',
														 self.bindings_template)

		# store the output
		output_path = f'{os.path.dirname(__file__)}/../../output/LDK/Bindings.swift'
		output_directory = os.path.dirname(output_path)
		if not os.path.exists(output_directory):
			os.makedirs(output_directory)
		with open(output_path, "w") as f:
			f.write(filled_template)
