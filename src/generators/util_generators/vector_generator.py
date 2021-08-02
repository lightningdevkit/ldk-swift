import re

from src.generators.util_generators import UtilGenerator

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
		dimension_reduction_prep = None
		is_primitive = vector_type_details.is_primitive
		pointerTypeName = 'UInt8'

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
				conversion_call = f'let convertedEntry = {shallowmost_iteratee.name}_to_array(nativeType: currentEntry)'
				pointerTypeName = shallowmost_iteratee.name
				dimension_reduction_prep = f'''
					var lowerDimension = [{shallowmost_iteratee.name}]()
					for currentEntry in array {{
						let convertedEntry = new_{shallowmost_iteratee.name}(array: currentEntry)
						lowerDimension.append(convertedEntry)
					}}
				'''

		mutating_current_vector_methods = self.template
		for dim_delta in range(1, dimensions):
			mutating_current_vector_methods = mutating_current_vector_methods.replace('[SwiftPrimitive]', '[[SwiftPrimitive]]')
		mutating_current_vector_methods = mutating_current_vector_methods.replace('LDKCVec_rust_primitive', vector_name)

		if conversion_call is not None:
			mutating_current_vector_methods = mutating_current_vector_methods.replace('/* CONVERSION_PREP */', conversion_call)
		else:
			mutating_current_vector_methods = mutating_current_vector_methods.replace('(convertedEntry)', '(currentEntry)')

		if dimension_reduction_prep is not None:
			mutating_current_vector_methods = mutating_current_vector_methods.replace('/* DIMENSION_REDUCTION_PREP */', dimension_reduction_prep)
			mutating_current_vector_methods = mutating_current_vector_methods.replace('array.withUnsafeBufferPointer', 'lowerDimension.withUnsafeBufferPointer')
			mutating_current_vector_methods = mutating_current_vector_methods.replace('dataContainer.initialize(from: array,', 'dataContainer.initialize(from: lowerDimension,')
			mutating_current_vector_methods = mutating_current_vector_methods.replace('<SwiftPrimitive>', f'<{pointerTypeName}>')

		if not is_primitive and dimensions > 2 or is_primitive and dimensions > 3:
			mutating_current_vector_methods = mutating_current_vector_methods.replace('/* SWIFT_TO_RUST_START */', '/* SWIFT_TO_RUST_START ')
			mutating_current_vector_methods = mutating_current_vector_methods.replace('/* SWIFT_TO_RUST_END */', 'SWIFT_TO_RUST_END */')
			# pass

		mutating_current_vector_methods = mutating_current_vector_methods.replace('SwiftPrimitive',
																				  swift_primitive)

		self.filled_template += "\n"+mutating_current_vector_methods+"\n"
