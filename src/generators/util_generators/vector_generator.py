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
		dimensions = 1
		conversion_call = None
		is_primitive = vector_type_details.is_primitive

		if is_primitive:
			swift_primitive = vector_type_details.primitive_swift_counterpart
		else:
			deepest_iteratee = vector_type_details
			while deepest_iteratee.iteratee is not None:
				deepest_iteratee = deepest_iteratee.iteratee
				dimensions += 1
			shallowmost_iteratee = vector_type_details.iteratee
			if deepest_iteratee.is_primitive:
				swift_primitive = deepest_iteratee.primitive_swift_counterpart
			else:
				dimensions -= 1
				swift_primitive = deepest_iteratee.name
			if dimensions > 1:
				conversion_call = f'let convertedEntry = {shallowmost_iteratee.name}_to_array(vector: currentEntry)'

		mutating_current_vector_methods = self.template
		for dim_delta in range(1, dimensions):
			mutating_current_vector_methods = mutating_current_vector_methods.replace('[SwiftPrimitive]', '[[SwiftPrimitive]]')
		mutating_current_vector_methods = mutating_current_vector_methods.replace('LDKCVec_rust_primitive', vector_name)

		if conversion_call is not None:
			mutating_current_vector_methods = mutating_current_vector_methods.replace('/* CONVERSION_PREP */', conversion_call)
		else:
			mutating_current_vector_methods = mutating_current_vector_methods.replace('(convertedEntry)', '(currentEntry)')

		if not is_primitive:
			mutating_current_vector_methods = mutating_current_vector_methods.replace('/* SWIFT_TO_RUST_START */', '/* SWIFT_TO_RUST_START ')
			mutating_current_vector_methods = mutating_current_vector_methods.replace('/* SWIFT_TO_RUST_END */', 'SWIFT_TO_RUST_END */')

		mutating_current_vector_methods = mutating_current_vector_methods.replace('SwiftPrimitive',
																				  swift_primitive)

		self.filled_template += "\n"+mutating_current_vector_methods+"\n"
