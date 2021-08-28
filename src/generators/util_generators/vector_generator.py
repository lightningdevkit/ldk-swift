import re

from src.generators.util_generators import UtilGenerator
import src.conversion_helper


class VectorGenerator(UtilGenerator):

	def __init__(self) -> None:
		super().__init__()
		self.template_regex = re.compile("(\/\* VECTOR_METHODS_START \*\/\n)(.*)(\n[\t ]*\/\* VECTOR_METHODS_END \*\/)", flags=re.MULTILINE | re.DOTALL)
		self.loadTemplate()
		self.extractors = {}

	def generate_vector(self, vector_name, vector_type_details):
		dimensions = 1
		conversion_call = None
		dimension_reduction_prep = None
		is_primitive = vector_type_details.is_primitive
		pointerTypeName = 'UInt8'
		shallowmost_iteratee_is_tuple_primitive = False
		extraction_method = ''

		is_deepest_iteratee_primitive = True

		if is_primitive:
			swift_primitive = vector_type_details.primitive_swift_counterpart
		else:
			deepest_iteratee = vector_type_details
			while deepest_iteratee.iteratee is not None:
				deepest_iteratee = deepest_iteratee.iteratee
				dimensions += 1
			shallowmost_iteratee = vector_type_details.iteratee

			if shallowmost_iteratee.is_tuple_based_iterator:
				shallowmost_iteratee_is_tuple_primitive = True
			if deepest_iteratee.is_primitive:
				swift_primitive = deepest_iteratee.primitive_swift_counterpart
			else:
				dimensions -= 1
				swift_primitive = deepest_iteratee.name

				# don't deinit the underlying type for complex arrays – the wrappers will do that when appropriate
				# is_deepest_iteratee_primitive = False
			if dimensions > 1:
				conversion_call = f'let convertedEntry = {shallowmost_iteratee.name}_to_array(nativeType: currentEntry)'
				if (shallowmost_iteratee.name.startswith('LDKCVec_') or shallowmost_iteratee.name) == 'LDKTransaction' and not is_deepest_iteratee_primitive:
					conversion_call = f'let convertedEntry = {shallowmost_iteratee.name}_to_array(nativeType: currentEntry, deallocate: deallocate)'
				pointerTypeName = shallowmost_iteratee.name
				subdimension_prefix = ''
				subdimension_suffix = '.cOpaqueStruct!'
				subdimension_call_suffix = 'Wrapper'
				if shallowmost_iteratee_is_tuple_primitive:
					subdimension_prefix = '// '
					subdimension_suffix = ''
					subdimension_call_suffix = ''
				dimension_reduction_prep = f'''
					var lowerDimension = [{shallowmost_iteratee.name}]()
					{subdimension_prefix}var subdimensionWrapper = [{shallowmost_iteratee.name}Wrapper]()
					for currentEntry in array {{
						let convertedEntry = new_{shallowmost_iteratee.name + subdimension_call_suffix}(array: currentEntry)
						lowerDimension.append(convertedEntry{subdimension_suffix})
						{subdimension_prefix}subdimensionWrapper.append(convertedEntry)
					}}
				'''

			if shallowmost_iteratee.name not in self.extractors and not shallowmost_iteratee_is_tuple_primitive:
				self.extractors[shallowmost_iteratee.name] = True
				if not shallowmost_iteratee.name.startswith('LDK'):
					pass
				elif shallowmost_iteratee.name.startswith('LDKCVec_'):
					pass
				elif shallowmost_iteratee.primitive_swift_counterpart == 'UInt8':
					pass
				elif shallowmost_iteratee.type.name == 'BYTE_ARRAY':  # BYTE_ARRAY, therefore not associated with a singular type
					pass
				else:
					cloneability_lookup = shallowmost_iteratee.name
					if cloneability_lookup.startswith('LDK'):
						cloneability_lookup = cloneability_lookup[len('LDK'):]
					shallowmost_swift_type_name = cloneability_lookup.replace('CResult_', 'Result_').replace('CTuple_', 'Tuple_')
					is_cloneable = cloneability_lookup in src.conversion_helper.cloneable_types
					cloneability_infix = ''
					if is_cloneable:
						cloneability_infix = '.danglingClone()'
					# print('Shallowmost iteratee:', shallowmost_iteratee.name, 'cloneable:', is_cloneable)
					extraction_method = f'''
						public class func extractNative{shallowmost_iteratee.name}Array(array: [{shallowmost_swift_type_name}]) -> [{shallowmost_iteratee.name}] {{
							return array.map {{ entry -> {shallowmost_iteratee.name} in
								entry{cloneability_infix}.cOpaqueStruct!
							}}
						}}
						
						public class func wrapNative{shallowmost_iteratee.name}Array(array: [{shallowmost_iteratee.name}]) -> [{shallowmost_swift_type_name}] {{
							return array.map {{ entry -> {shallowmost_swift_type_name} in
								{shallowmost_swift_type_name}(pointer: entry)
							}}
						}}
						
						public class func wrapDanglingNative{shallowmost_iteratee.name}Array(array: [{shallowmost_iteratee.name}]) -> [{shallowmost_swift_type_name}] {{
							return array.map {{ entry -> {shallowmost_swift_type_name} in
								{shallowmost_swift_type_name}(pointer: entry).dangle()
							}}
						}}
					'''

					if is_cloneable:
						extraction_method += f'''
							internal class func cloneNative{shallowmost_iteratee.name}Array(array: [{shallowmost_iteratee.name}]) -> [{shallowmost_iteratee.name}] {{
								return array.map {{ entry -> {shallowmost_iteratee.name} in
									// create a wrapper around the native object, dangle it to make it non-destructive, clone it, and then dangle the clone
									{shallowmost_swift_type_name}(pointer: entry).dangle().clone().dangle().cOpaqueStruct!
								}}
							}}
						'''

		mutating_current_vector_methods = self.template
		for dim_delta in range(1, dimensions):
			mutating_current_vector_methods = mutating_current_vector_methods.replace('[SwiftPrimitive]', '[[SwiftPrimitive]]')

		if conversion_call is not None:
			mutating_current_vector_methods = mutating_current_vector_methods.replace('/* CONVERSION_PREP */', conversion_call)
		else:
			mutating_current_vector_methods = mutating_current_vector_methods.replace('(convertedEntry)', '(currentEntry)')

		if dimension_reduction_prep is not None:
			mutating_current_vector_methods = mutating_current_vector_methods.replace('/* DIMENSION_REDUCTION_PREP */', dimension_reduction_prep)
			mutating_current_vector_methods = mutating_current_vector_methods.replace('array.withUnsafeBufferPointer', 'lowerDimension.withUnsafeBufferPointer')
			mutating_current_vector_methods = mutating_current_vector_methods.replace('dataContainer.initialize(from: array,', 'dataContainer.initialize(from: lowerDimension,')
			mutating_current_vector_methods = mutating_current_vector_methods.replace('<SwiftPrimitive>', f'<{pointerTypeName}>')
			if not shallowmost_iteratee_is_tuple_primitive:
				mutating_current_vector_methods = mutating_current_vector_methods.replace('LDKCVec_rust_primitiveWrapper(pointer: vector)',
																						  'LDKCVec_rust_primitiveWrapper(pointer: vector, subdimensionWrapper: subdimensionWrapper)')

		if vector_name.startswith('LDKCVec_'):
			mutating_current_vector_methods = mutating_current_vector_methods.replace('LDKCVec_rust_primitive_to_array(nativeType: LDKCVec_rust_primitive)',
																					  f'LDKCVec_rust_primitive_to_array(nativeType: LDKCVec_rust_primitive, deallocate: Bool = true)')
			if is_deepest_iteratee_primitive:
				mutating_current_vector_methods = mutating_current_vector_methods.replace('/* RUST_PRIMITIVE_CLEANUP */', f'''
					if deallocate && nativeType.datalen > 0 {{
						nativeType.data.deallocate()
					}}
				''')
			else:
				mutating_current_vector_methods = mutating_current_vector_methods.replace('/* RUST_PRIMITIVE_CLEANUP */', f'''
					if deallocate {{
						{vector_type_details.name[3:]}_free(nativeType)
					}}
				''')
		mutating_current_vector_methods = mutating_current_vector_methods.replace('LDKCVec_rust_primitive', vector_name)

		if not is_primitive and dimensions > 2 or is_primitive and dimensions > 3:
			mutating_current_vector_methods = mutating_current_vector_methods.replace('/* SWIFT_TO_RUST_START */', '/* SWIFT_TO_RUST_START ')
			mutating_current_vector_methods = mutating_current_vector_methods.replace('/* SWIFT_TO_RUST_END */', 'SWIFT_TO_RUST_END */')  # pass

		mutating_current_vector_methods = mutating_current_vector_methods.replace('SwiftPrimitive', swift_primitive)

		mutating_current_vector_methods += extraction_method

		self.filled_template += "\n" + mutating_current_vector_methods + "\n"
