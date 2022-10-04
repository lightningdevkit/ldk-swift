from src.type_parsing_regeces import TypeParsingRegeces
from typing import Dict

pointer_iterating_vector_types = set()
cloneable_types = set()
detected_cloneable_types = set()

class ArrayAccessorType:
	def __init__(self, key: str, size: int = -1, length_key = None):
		self.size: int = size
		self.key: str = key
		self.length_key: str = length_key

array_accessor_types_fixed_length: Dict[str, ArrayAccessorType] = {
	"LDKThirtyTwoBytes": ArrayAccessorType(size=32, key='data'),
	"LDKTxid": ArrayAccessorType(size=32, key='data'),
	"LDKPaymentPreimage": ArrayAccessorType(size=32, key='data'),
	"LDKPublicKey": ArrayAccessorType(size=33, key='compressed_form'),
	"LDKSecretKey": ArrayAccessorType(size=32, key='bytes'),
	"LDKSignature": ArrayAccessorType(size=64, key='compact_form'),
	# "LDKError": ArrayAccessorType(size=0, key='_dummy'),
	"LDKThreeBytes": ArrayAccessorType(size=3, key='data'),
	"LDKFourBytes": ArrayAccessorType(size=4, key='data'),
	"LDKTenBytes": ArrayAccessorType(size=10, key='data'),
	"LDKTwelveBytes": ArrayAccessorType(size=12, key='data'),
	"LDKSixteenBytes": ArrayAccessorType(size=16, key='data'),
	"LDKTwentyBytes": ArrayAccessorType(size=20, key='data'),
	"LDKRecoverableSignature": ArrayAccessorType(size=68, key='serialized_form'),
	"LDKBigEndianScalar": ArrayAccessorType(size=32, key='big_endian_bytes')
}

array_accessor_types_variable_length: Dict[str, ArrayAccessorType] = {
	"LDKu5slice": ArrayAccessorType(length_key='datalen', key='data'),
	"LDKu8slice": ArrayAccessorType(length_key='datalen', key='data'),
	"LDKCVec_u8Z": ArrayAccessorType(length_key='datalen', key='data'),
	"LDKCVec_u5Z": ArrayAccessorType(length_key='datalen', key='data'),
	"LDKTransaction": ArrayAccessorType(length_key='datalen', key='data')
}

array_accessor_types: Dict[str, ArrayAccessorType] = {
	**array_accessor_types_fixed_length,
	**array_accessor_types_variable_length
}

unary_tuples: [str] = ["LDKu5", "LDKWitnessVersion"]
unary_tuple_type_details: Dict[str, object] = {}

class ConversionHelper:
	trait_structs = set()
	freeable_types = set()
	nullable_inner_types = {'LDKOutPoint'}

	@classmethod
	def normalize_swift_type(cls, swift_type: str):
		if swift_type == 'Type':
			return 'BindingsType'
		if swift_type == 'Error':
			return 'BindingsError'

		return swift_type

	@classmethod
	def is_instance_type(cls, swift_type: str, raw_rust_type: str, include_options_and_results: bool = True):
		if raw_rust_type == 'LDK' + swift_type:
			return True

		if include_options_and_results:
			if raw_rust_type == 'LDKC' + swift_type:
				return True

		# for edge cases
		if raw_rust_type == 'LDKType' and swift_type == 'BindingsType':
			return True

		return False

	@classmethod
	def is_array_type(cls, swift_type: str):
		return swift_type.startswith('[')

	@classmethod
	def is_byte_array_type(cls, rust_type: str):
		return rust_type in array_accessor_types

	@classmethod
	def is_trait_type(cls, raw_rust_type: str):
		if raw_rust_type is None:
			return False
		return raw_rust_type in ConversionHelper.trait_structs

	@classmethod
	def is_type_cloneable(cls, raw_rust_type: str):
		cloneability_lookup = 'x-uncloneable'
		individual_cloneability_lookup = None
		if raw_rust_type is not None:
			cloneability_lookup = raw_rust_type
			if cloneability_lookup.startswith('LDK'):
				cloneability_lookup = cloneability_lookup[len('LDK'):]
		is_cloneable = cloneability_lookup in cloneable_types
		return is_cloneable

	@classmethod
	def prepare_swift_to_native_arguments(cls, argument_types, is_trait_callback=False, force_pass_instance=False, is_free_method=False, is_returned_value_freeable=False, unwrap_complex_arrays = True, array_unwrapping_preparation_only = False, is_trait_default_redirect = False, prefix_namespace=False):
		swift_arguments = []
		swift_redirection_arguments = []
		native_arguments = []
		pointer_wrapping_prefix = ''
		pointer_wrapping_suffix = ''
		native_call_prep = ''
		constructor_post_init_anchoring = ''
		pointer_wrapping_depth = 0
		static_eligible = True
		non_cloneable_argument_indices_passed_by_ownership = []
		has_unwrapped_arrays = False
		return_type_nullable = False
		for argument_index, current_argument_details in enumerate(argument_types):
			pass_instance = False
			argument_name = current_argument_details.var_name
			passed_argument_name = argument_name
			is_pointer_to_array = False
			is_array_wrapper_extraction_required = False
			array_wrapper_extraction = ''

			# if passed_argument_name == 'init': # illegal in swift
			# 	passed_argument_name = 'initValue'

			mutabilityIndicatorSuffix = ''
			clone_infix = ''
			cloneability_lookup = 'x-uncloneable'
			individual_cloneability_lookup = None
			if current_argument_details.rust_obj is not None:
				cloneability_lookup = current_argument_details.rust_obj
				if cloneability_lookup.startswith('LDK'):
					cloneability_lookup = cloneability_lookup[len('LDK'):]
			is_cloneable = cloneability_lookup in cloneable_types

			if (argument_name == '' or argument_name is None) and current_argument_details.swift_type == 'Void' and len(argument_types) == 1:
				break

			if argument_name == 'this_ptr' or argument_name == 'this_arg' or argument_name == 'orig' or force_pass_instance:
				pass_instance = True
				passed_argument_name = 'self'
				static_eligible = False

				# if caller_is_nullable_inner_type:
				# 	native_call_prep = f'''
				# 		if self.cOpaqueStruct!.inner == nil {{
				# 			return nil
				# 		}}
				# 		{native_call_prep}
				# 	'''
				# 	return_type_nullable = True

			swift_argument_type = current_argument_details.swift_type
			if not pass_instance:
				# TODO: remove magic type!
				if swift_argument_type == 'TxOut':
					swift_argument_type = 'LDKTxOut'

				if TypeParsingRegeces.WRAPPER_TYPE_ARRAY_BRACKET_REGEX.search(swift_argument_type):
					has_unwrapped_arrays = True
					if (is_trait_callback and not array_unwrapping_preparation_only) or not unwrap_complex_arrays:
						swift_argument_type = TypeParsingRegeces.WRAPPER_TYPE_ARRAY_BRACKET_REGEX.sub('[LDK', swift_argument_type)
						swift_argument_type = swift_argument_type.replace('[LDKResult_', '[LDKCResult_').replace('[LDKTuple_', '[LDKCTuple_')
					else:
						is_array_wrapper_extraction_required = True
						individual_cloneability_lookup = swift_argument_type.lstrip('[').rstrip(']')
						wrapper_depth = int((len(swift_argument_type) - len(individual_cloneability_lookup)) / 2)
						if individual_cloneability_lookup.startswith('Result_') or individual_cloneability_lookup.startswith('Tuple_'):
							individual_cloneability_lookup = f'C{individual_cloneability_lookup}'
						is_individual_cloneable = individual_cloneability_lookup in cloneable_types
						individual_clone_infix = '.danglingClone()'
						if not is_individual_cloneable:
							individual_clone_infix = '.dangle()'
							print(f'Non-cloneable array entry detected for type {swift_argument_type}')
						passed_argument_name = f'{argument_name}Unwrapped'
						map_prefix = f'''.map {{ ({argument_name}CurrentValue) in
							{argument_name}CurrentValue''' * wrapper_depth
						map_suffix = '}' * wrapper_depth
						input_argument_name = argument_name
						is_nullable_array_argument = current_argument_details.is_ptr and not pass_instance and not current_argument_details.non_nullable
						if is_nullable_array_argument:
							input_argument_name = passed_argument_name
						declaration_prefix = 'let '
						if is_trait_default_redirect and current_argument_details.is_ptr and not current_argument_details.is_const:
							declaration_prefix = ''
							input_argument_name = passed_argument_name
							passed_argument_name = f'{argument_name}Native'
						array_wrapper_extraction = f'''
							{declaration_prefix}{passed_argument_name} = {input_argument_name}{map_prefix}
								{individual_clone_infix}.cOpaqueStruct!
							{map_suffix}
						'''
						if not is_nullable_array_argument:
							native_call_prep += array_wrapper_extraction

			if current_argument_details.is_ptr:
				if not is_trait_default_redirect:
					passed_argument_name = argument_name + 'Pointer'
				if argument_name == 'init':
					argument_name = 'initValue'

				requires_mutability = not current_argument_details.is_const
				is_trait = ConversionHelper.is_trait_type(current_argument_details.rust_obj)

				reference_prefix = ''
				mutability_infix = ''
				trait_activation_infix = ''

				non_nullable = current_argument_details.non_nullable

				if pass_instance:
					argument_name = 'self'
				if is_trait:
					trait_activation_infix = '.activateOnce()'
				if requires_mutability:
					# argument_name = '&' + argument_name
					reference_prefix = '&'
					mutability_infix = 'Mutable'
					if not pass_instance and not non_nullable:
						mutabilityIndicatorSuffix = '?'
				# let managerPointer = withUnsafePointer(to: self.cChannelManager!) { (pointer: UnsafePointer<LDKChannelManager>) in
				# 	pointer
				# }
				# the \n\t will add a bunch of extra lines, but this file will be easier to read

				if requires_mutability and not array_unwrapping_preparation_only:
					if pass_instance or non_nullable:
						native_call_prep += f'''
							let {passed_argument_name} = UnsafeMutablePointer<{current_argument_details.rust_obj}>.allocate(capacity: 1)
							{passed_argument_name}.initialize(to: {argument_name}.cOpaqueStruct!)
						'''
					else:
						# nullable pass by pointer

						# var first_hopsPointer: UnsafeMutablePointer<LDKCVec_ChannelDetailsZ>? = nil
						# if let first_hopsUnwrapped = first_hops {
						# first_hopsPointer = UnsafeMutablePointer<LDKCVec_ChannelDetailsZ>.allocate(capacity: 1)
						# first_hopsPointer!.initialize(to: new_LDKCVec_ChannelDetailsZ(array: first_hopsUnwrapped))
						# }

						initialization_target = f'{argument_name}Unwrapped.cOpaqueStruct!'

						if current_argument_details.rust_obj is not None and current_argument_details.rust_obj.startswith('LDK') and current_argument_details.swift_type.startswith('['):
							# TODO: figure out why this never gets hit, or rather why I originally wrote this
							initialization_target = f'Bindings.new_{current_argument_details.rust_obj}Wrapper(array: {argument_name}Unwrapped).cOpaqueStruct!'
							is_pointer_to_array = True

						native_call_prep += f'''
							var {passed_argument_name}: UnsafeMutablePointer<{current_argument_details.rust_obj}>? = nil
							if let {argument_name}Unwrapped = {argument_name} {{
								{array_wrapper_extraction}
								{passed_argument_name} = UnsafeMutablePointer<{current_argument_details.rust_obj}>.allocate(capacity: 1)
								{passed_argument_name}!.initialize(to: {initialization_target})
							}}
						'''  # print('optional argument:', argument_name, passed_argument_name)
				elif requires_mutability and array_unwrapping_preparation_only and is_trait_default_redirect:
					initialization_target = f'{argument_name}Unwrapped.cOpaqueStruct!'
					native_call_prep += f'''
						var {passed_argument_name}: {current_argument_details.swift_raw_type}? = nil
						if let {argument_name}Unwrapped = {argument_name} {{
							{array_wrapper_extraction}
						}}
					'''  # print('optional argument:', argument_name, passed_argument_name)
				else:
					wrapper_return_prefix = '' if pointer_wrapping_depth == 0 else 'return '
					pointer_wrapping_prefix += f'{wrapper_return_prefix}withUnsafe{mutability_infix}Pointer(to: {reference_prefix}{argument_name}{trait_activation_infix}.cOpaqueStruct!) {{ ({passed_argument_name}: Unsafe{mutability_infix}Pointer<{current_argument_details.rust_obj}>) in\n'
					pointer_wrapping_suffix += '\n}'
			# native_call_prep += current_prep
			elif is_cloneable:
				if not is_free_method:
					# clone_infix = '.clone()'
					clone_infix = '.danglingClone()'
				# print(f'Cloneable type detected: {current_argument_details.swift_type}')
				detected_cloneable_types.add(current_argument_details.swift_type)
			else:
				if current_argument_details.rust_obj is None:
					pass
				elif ConversionHelper.is_trait_type(current_argument_details.rust_obj):
					clone_infix = '.activate()'
				elif current_argument_details.rust_obj.startswith('LDK') and not current_argument_details.swift_type.startswith('[') and not is_free_method:
					non_cloneable_argument_indices_passed_by_ownership.append(argument_index)  # clone_infix = '.dangle()'
				if current_argument_details.rust_obj is not None and (
					'Option' in current_argument_details.rust_obj or 'Tuple' in current_argument_details.rust_obj or 'Result' in current_argument_details.rust_obj) and not current_argument_details.rust_obj.startswith(
					'['):
					# TODO: figure out potentially undetected cloneable types
					# print('Potentially undetected cloneable type?', current_argument_details.rust_obj)
					pass

			# it should not be cloneable, and it should be an object instance, and it should not be an array and not be an enum
			if not is_cloneable and current_argument_details.rust_obj is not None and current_argument_details.rust_obj.startswith('LDK') and not current_argument_details.swift_type.startswith('[') and not current_argument_details.swift_type.startswith('LDK'):
				constructor_post_init_anchoring += f'try? self.addAnchor(anchor: {argument_name})\n'

			if is_trait_callback and current_argument_details.is_const:
				if current_argument_details.swift_type.startswith('[') or current_argument_details.swift_type == 'String':
					mutabilityIndicatorSuffix = '?'

			if not pass_instance:
				if cls.is_instance_type(swift_argument_type, current_argument_details.rust_obj) and prefix_namespace:
					swift_arguments.append(f'{argument_name}: Bindings.{swift_argument_type}{mutabilityIndicatorSuffix}')
				else:
					swift_arguments.append(f'{argument_name}: {swift_argument_type}{mutabilityIndicatorSuffix}')
				if is_array_wrapper_extraction_required and array_unwrapping_preparation_only:
					swift_redirection_arguments.append(f'{argument_name}: {passed_argument_name}')
				else:
					swift_redirection_arguments.append(f'{argument_name}: {argument_name}')

			# native_arguments.append(f'{passed_argument_name}')
			if cls.is_instance_type(swift_argument_type, current_argument_details.rust_obj) and not current_argument_details.is_ptr:
				native_arguments.append(f'{passed_argument_name}{clone_infix}.cOpaqueStruct!')
			elif current_argument_details.rust_obj is not None and current_argument_details.rust_obj.startswith('LDK') and swift_argument_type.startswith('[') and not is_pointer_to_array:
				# if current_argument_details.swift_type == '[UInt8]' and not current_argument_details.swift_raw_type.startswith('LDKC'):
				if current_argument_details.rust_obj in pointer_iterating_vector_types and not array_unwrapping_preparation_only:
					# TODO: expand beyond 1-dimensional array support (as of writing only affects Route.swift)
					cloneability_lookup = current_argument_details.swift_type[1:-1].replace('Result_', 'CResult_').replace('Tuple_', 'CTuple_')
					array_clone_prefix = ''
					array_clone_suffix = ''
					if cloneability_lookup in cloneable_types:
						# print('cloneable array type (ignored):', current_argument_details.rust_obj, 'LDK'+cloneability_lookup)
						# array_clone_prefix = f'Bindings.cloneNativeLDK{cloneability_lookup}Array(array: '
						# array_clone_suffix = ')'
						pass
					native_call_prep += f'''
						let {argument_name}Wrapper = Bindings.new_{current_argument_details.rust_obj}Wrapper(array: {array_clone_prefix}{passed_argument_name}{array_clone_suffix})
						defer {{
							{argument_name}Wrapper.noOpRetain()
						}}
					'''
					if current_argument_details.rust_obj.startswith('LDKCVec_') or current_argument_details.rust_obj == 'LDKTransaction':
						# vectors will be freed by the underlying function automatically
						native_arguments.append(f'{argument_name}Wrapper.dangle().cOpaqueStruct!')
					else:
						native_arguments.append(f'{argument_name}Wrapper.cOpaqueStruct!')
				else:
					native_arguments.append(f'Bindings.new_{current_argument_details.rust_obj}(array: {passed_argument_name})')
			elif current_argument_details.rust_obj is not None and current_argument_details.rust_obj.startswith('LDK') and current_argument_details.is_unary_tuple:
				native_arguments.append(f'Bindings.new_{current_argument_details.rust_obj}(array: {passed_argument_name})')
			elif swift_argument_type == 'String':
				if is_trait_callback and current_argument_details.swift_raw_type == 'UnsafePointer<Int8>':
					force_unwrap_suffix = ''
					if mutabilityIndicatorSuffix == '?' and is_trait_callback:
						force_unwrap_suffix = '!'
					native_arguments.append(f'Bindings.string_to_unsafe_int8_pointer(string: {passed_argument_name}{force_unwrap_suffix})')
				else:
					native_arguments.append(f'Bindings.new_LDKStr(string: {passed_argument_name}, chars_is_owned: true)')
			elif current_argument_details.rust_obj is None and current_argument_details.arr_len is not None and current_argument_details.arr_len.isnumeric():
				if current_argument_details.is_const:
					force_unwrap_suffix = ''
					if mutabilityIndicatorSuffix == '?' and is_trait_callback:
						force_unwrap_suffix = '!'
					passed_argument_name = argument_name + 'Pointer'
					wrapper_return_prefix = '' if pointer_wrapping_depth == 0 else 'return '
					pointer_wrapping_prefix += f'{wrapper_return_prefix}withUnsafePointer(to: Bindings.array_to_tuple{current_argument_details.arr_len}(array: {argument_name}{force_unwrap_suffix})) {{ ({passed_argument_name}: UnsafePointer<{current_argument_details.swift_raw_type}>) in\n'
					pointer_wrapping_suffix += '\n}'
					native_arguments.append(passed_argument_name)
				else:
					native_arguments.append(f'Bindings.array_to_tuple{current_argument_details.arr_len}(array: {passed_argument_name})')
			else:
				native_arguments.append(f'{passed_argument_name}')

		full_syntax = pointer_wrapping_prefix + ', '.join(native_arguments) + pointer_wrapping_suffix
		# print(full_syntax)
		return {"swift_arguments": swift_arguments, "native_arguments": native_arguments, "native_call_prefix": pointer_wrapping_prefix, "native_call_suffix": pointer_wrapping_suffix,
				"native_call_prep": native_call_prep, "static_eligible": static_eligible, "non_cloneable_argument_indices_passed_by_ownership": non_cloneable_argument_indices_passed_by_ownership,
				'has_unwrapped_arrays': has_unwrapped_arrays, 'swift_redirection_arguments': swift_redirection_arguments, 'return_type_nullable': return_type_nullable, 'constructor_post_init_anchoring': constructor_post_init_anchoring}

	# the arguments that we receive from a native lambda, before they get passed on to a human consumer
	# Traits -> NATIVE_CALLBACKS -> SWIFT_CALLBACK_PREP, basically
	@classmethod
	def prepare_native_to_swift_callback_arguments(cls, argument_types, array_unwrapping_preparation_only=False):
		# let's get the current native arguments, i. e. the arguments we get from C into the native callback
		native_arguments = []
		swift_callback_arguments = []
		swift_callback_prep = ''
		public_swift_arguments = []
		public_swift_argument_list = ''
		for current_argument_details in argument_types:
			published_swift_type = current_argument_details.swift_type
			inferred_raw_swift_type = current_argument_details.swift_raw_type
			received_raw_type = current_argument_details.rust_obj

			swift_local_conversion_prefix = ''
			swift_local_conversion_suffix = ''

			received_var_name = current_argument_details.var_name

			if received_var_name == 'init':  # illegal in swift
				received_var_name = 'initValue'
			passed_var_name = received_var_name
			swift_callback_argument_value = received_var_name

			if '[UInt8]' in published_swift_type:
				if inferred_raw_swift_type.startswith('(UInt8'):
					array_length = current_argument_details.arr_len
					swift_local_conversion_prefix = f'Bindings.tuple{array_length}_to_array(nativeType: '
					swift_local_conversion_suffix = ')'
					if current_argument_details.arr_access is not None and len(current_argument_details.arr_access) > 0:
						swift_local_conversion_suffix = f'.{current_argument_details.arr_access})'
				elif received_raw_type is not None and received_raw_type.startswith('LDK'):
					swift_local_conversion_prefix = f'Bindings.{received_raw_type}_to_array(nativeType: '
					swift_local_conversion_suffix = ')'
			elif received_raw_type is not None and received_raw_type.startswith('LDK'):
				if cls.is_instance_type(published_swift_type, received_raw_type):
					swift_local_conversion_prefix = f'{published_swift_type}(pointer: '
					swift_local_conversion_suffix = ')'
					# TODO: see if `current_argument_details.pass_by_ref` condition is necessary
					if current_argument_details.passed_as_ptr and current_argument_details.pass_by_ref:
						# this is useful for traits, but some types may not have cloneability support
						swift_local_conversion_suffix = ').dangle()'
						is_cloneable = ConversionHelper.is_type_cloneable(received_raw_type)
						if is_cloneable:
							swift_local_conversion_suffix += '.clone()'
						else:
							print(f"trait callback uncloneable type danger: {received_raw_type} / {published_swift_type}")
					elif current_argument_details.passed_as_ptr or current_argument_details.pass_by_ref:
						descriptor = 'passed_as_ptr' if current_argument_details.passed_as_ptr else 'pass_by_ref'
						print(f'{descriptor}: {received_raw_type} / {published_swift_type}')
				elif received_raw_type.startswith('LDKCOption_') and received_raw_type == 'LDKC' + published_swift_type:
					swift_local_conversion_prefix = f'{published_swift_type}(pointer: '
					swift_local_conversion_suffix = ')'
					# TODO: see if `current_argument_details.pass_by_ref` condition is necessary
					if current_argument_details.passed_as_ptr and current_argument_details.pass_by_ref:
						swift_local_conversion_suffix = ').dangle()'
				elif received_raw_type.startswith('LDKCVec') and (published_swift_type.startswith('[C') or (not published_swift_type.startswith('[C') and inferred_raw_swift_type.startswith('[LDK'))):
					swift_local_conversion_prefix = f'Bindings.{received_raw_type}_to_array(nativeType: '
					swift_local_conversion_suffix = ')'
					if TypeParsingRegeces.WRAPPER_TYPE_ARRAY_BRACKET_REGEX.search(published_swift_type) and not array_unwrapping_preparation_only:
						# Bindings array converters cannot yet convert LDK types to wrapped types
						published_swift_type = TypeParsingRegeces.WRAPPER_TYPE_ARRAY_BRACKET_REGEX.sub('[LDK', published_swift_type)
				received_raw_type = current_argument_details.rust_obj
			# swift_callback_argument_value = f'{received_raw_type}(pointer: {received_var_name})'

			if received_raw_type is None:
				received_raw_type = inferred_raw_swift_type

			if current_argument_details.is_const:
				is_unsafe_pointer = received_raw_type.startswith('Unsafe')
				is_optional = False
				if not received_raw_type.startswith('Unsafe'):
					received_raw_type = f'UnsafePointer<{received_raw_type}>'
					is_unsafe_pointer = True
				if current_argument_details.swift_type.startswith('[') or current_argument_details.swift_type == 'String':
					is_optional = True
					received_raw_type += '?'  # TODO: figure out when tf it actually becomes nullable!
					published_swift_type += '?'  # the swift thing is obviously nullible, too

				if is_unsafe_pointer:  # always true
					received_var_name += 'Pointer'
					if is_optional:
						if inferred_raw_swift_type == 'UnsafePointer<Int8>':
							swift_callback_prep += f'''
								var {passed_var_name}: {published_swift_type} = nil
								if let {passed_var_name}Unwrapped = {received_var_name} {{
									{passed_var_name} = Bindings.UnsafeIntPointer_to_string(nativeType: {passed_var_name}Unwrapped)
								}}
							'''
						else:
							swift_callback_prep += f'''
								var {passed_var_name}: {published_swift_type} = nil
								if let {passed_var_name}Unwrapped = {received_var_name} {{
									{passed_var_name} = {swift_local_conversion_prefix}{passed_var_name}Unwrapped.pointee{swift_local_conversion_suffix}
								}}
							'''
					else:
						swift_callback_prep += f'let {passed_var_name} = {swift_local_conversion_prefix}{received_var_name}.pointee{swift_local_conversion_suffix};\n'
			elif current_argument_details.is_ptr:
				# it is not const
				received_raw_type = f'UnsafeMutablePointer<{received_raw_type}>?'
				received_var_name += 'Pointer'
				published_swift_type += '?'
				swift_callback_prep += f'''
					var {passed_var_name}: {published_swift_type} = nil
					if let {passed_var_name}Unwrapped = {received_var_name} {{
						{passed_var_name} = {swift_local_conversion_prefix}{passed_var_name}Unwrapped.pointee{swift_local_conversion_suffix}
					}}
				'''
			else:
				swift_callback_argument_value = swift_local_conversion_prefix + received_var_name + swift_local_conversion_suffix
			# if current_argument_details.passed_as_ptr:
			# 	received_raw_type += '?'

			native_arguments.append(f'{received_var_name}: {received_raw_type}')
			swift_callback_arguments.append(f'{passed_var_name}: {swift_callback_argument_value}')
			public_swift_arguments.append(f'{passed_var_name}: {published_swift_type}')
		if len(native_arguments) > 0:
			# add leading comma
			# swift_argument_string = ', '.join(native_arguments)
			public_swift_argument_list = ', '.join(public_swift_arguments)
			# native_arguments.insert(0, '')
			pass

		return {'raw_native_argument_list': native_arguments, 'swift_callback_arguments': swift_callback_arguments, 'public_swift_argument_list': public_swift_argument_list,
				'swift_callback_prep': swift_callback_prep}

	@classmethod
	def prepare_return_value(cls, return_type, is_clone_method=False, is_trait_instantiator=False, is_raw_property_getter=False, is_trait_callback=False, prefix_namespace=False):
		rust_return_type = return_type.rust_obj
		return_prefix = ''
		return_suffix = ''
		return_type_string = return_type.swift_type
		swift_return_instantiation_type = return_type_string
		if is_trait_instantiator:
			swift_return_instantiation_type = f'NativelyImplemented{return_type_string}'
			# return_type_string = swift_return_instantiation_type

		if rust_return_type is not None and rust_return_type.startswith('LDK') and return_type_string.startswith('['):
			return_prefix = f'Bindings.{rust_return_type}_to_array(nativeType: '
			return_suffix = ')'
			individual_map_suffix = ''
			if (rust_return_type.startswith('LDKCVec_') or rust_return_type == 'LDKTransaction') and is_raw_property_getter:
				return_suffix = ', deallocate: false)'
				individual_map_suffix = '.dangle()'

			if TypeParsingRegeces.WRAPPER_TYPE_ARRAY_BRACKET_REGEX.search(return_type_string) and not is_trait_callback:
				# replace the last [ with [LDK (in case
				constructor_type = return_type_string.lstrip('[').rstrip(']')
				# native_return_type_string = TypeParsingRegeces.WRAPPER_TYPE_ARRAY_BRACKET_REGEX.sub('[LDK', return_type_string)
				# native_return_type_string = return_type_string.replace('LDKResult_', 'LDKCResult_').replace('LDKTuple_', 'LDKCTuple_').replace('LDKVec_', 'LDKCVec_')

				wrapper_depth = int((len(return_type_string) - len(constructor_type)) / 2)

				if constructor_type == 'Txid':
					return_suffix += f'''
					.map {{ (bytes) in
						   Bindings.LDKThirtyTwoBytes_to_array(nativeType: bytes)
					}}
				'''
				else:

					map_prefix = f'''.map {{ (cOpaqueStruct) in
						cOpaqueStruct''' * (wrapper_depth-1)

					map_suffix = '}' * wrapper_depth

					return_suffix += f'''
						{map_prefix}
						.map {{ (cOpaqueStruct) in
							{constructor_type}(pointer: cOpaqueStruct){individual_map_suffix}
						{map_suffix}
					'''



		elif return_type.swift_raw_type.startswith('(UInt8'):
			# TODO: get array length
			array_length = return_type.arr_len
			return_prefix = f'Bindings.tuple{array_length}_to_array(nativeType: '
			return_suffix = ')'
		elif cls.is_instance_type(return_type_string, rust_return_type):
			if prefix_namespace:
				swift_return_instantiation_type = f'Bindings.{swift_return_instantiation_type}'
				return_type_string = f'Bindings.{return_type_string}'
			return_prefix = f'{swift_return_instantiation_type}(pointer: '
			if is_clone_method:
				# return_prefix = 'Self(pointer: '
				pass
			return_suffix = ')'
			if return_type.is_const:
				return_suffix = '.pointee)'
			if is_trait_instantiator or is_raw_property_getter:
				# replace if with elif if it's only to be used for _as methods (ChannelManagerReadArgs with get_ vs KeysManager with as_)
				return_suffix = return_suffix.rstrip(')') + ', anchor: self)'
		# if is_trait_instantiator:
		# only applies to tuples, but is never hit
		# return_suffix = ', anchor: self)'
		elif return_type_string == 'String':
			return_prefix = 'Bindings.LDKStr_to_string(nativeType: '
			return_suffix = ')'
		# elif is_clone_method:
		# 	return_prefix = 'Self(pointer: ',
		# 	return_suffix = ')'
		if rust_return_type is None and return_type_string.startswith('['):
			return_suffix = '.pointee)'
			pass

		if TypeParsingRegeces.WRAPPER_TYPE_ARRAY_BRACKET_REGEX.search(return_type_string) and is_trait_callback:
			# replace the last [ with [LDK (in case
			return_type_string = TypeParsingRegeces.WRAPPER_TYPE_ARRAY_BRACKET_REGEX.sub('[LDK', return_type_string)
			return_type_string = return_type_string.replace('LDKResult_', 'LDKCResult_').replace('LDKTuple_', 'LDKCTuple_').replace('LDKVec_', 'LDKCVec_')

		if is_trait_instantiator:
			return_type_string = swift_return_instantiation_type

		if rust_return_type in ConversionHelper.nullable_inner_types and not is_clone_method:
			return_suffix = f''';
				if cStruct.inner == nil {{
					return nil
				}}
				return {return_prefix}cStruct{return_suffix}
				}}()
			'''
			return_prefix = f'''
				{{ () in
					let cStruct =
				'''
			return_type_string += '?'

		return {'prefix': return_prefix, 'suffix': return_suffix, 'swift_type': return_type_string}
