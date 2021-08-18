from src.type_parsing_regeces import TypeParsingRegeces

cloneable_types = set()
detected_cloneable_types = set()

class ConversionHelper:
	@classmethod
	def prepare_swift_to_native_arguments(cls, argument_types, is_trait_callback = False, force_pass_instance = False, is_free_method = False):
		swift_arguments = []
		native_arguments = []
		pointer_wrapping_prefix = ''
		pointer_wrapping_suffix = ''
		native_call_prep = ''
		pointer_wrapping_depth = 0
		static_eligible = True
		for current_argument_details in argument_types:
			pass_instance = False
			argument_name = current_argument_details.var_name
			passed_argument_name = argument_name
			is_pointer_to_array = False

			# if passed_argument_name == 'init': # illegal in swift
			# 	passed_argument_name = 'initValue'

			mutabilityIndicatorSuffix = ''
			clone_infix = ''

			if (argument_name == '' or argument_name is None) and current_argument_details.swift_type == 'Void' and len(argument_types) == 1:
				break

			if argument_name == 'this_ptr' or argument_name == 'this_arg' or argument_name == 'orig' or force_pass_instance:
				pass_instance = True
				passed_argument_name = 'self'
				static_eligible = False

			if current_argument_details.is_ptr:
				passed_argument_name = argument_name + 'Pointer'
				if argument_name == 'init':
					argument_name = 'initValue'

				requires_mutability = not current_argument_details.is_const

				reference_prefix = ''
				mutability_infix = ''

				non_nullable = current_argument_details.non_nullable

				if pass_instance:
					argument_name = 'self'
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

				if requires_mutability:
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

						if current_argument_details.rust_obj is not None and current_argument_details.rust_obj.startswith(
							'LDK') and current_argument_details.swift_type.startswith('['):
								initialization_target = f'Bindings.new_{current_argument_details.rust_obj}(array: {argument_name}Unwrapped)'
								is_pointer_to_array = True

						native_call_prep += f'''
							var {passed_argument_name}: UnsafeMutablePointer<{current_argument_details.rust_obj}>? = nil
							if let {argument_name}Unwrapped = {argument_name} {{
								{passed_argument_name} = UnsafeMutablePointer<{current_argument_details.rust_obj}>.allocate(capacity: 1)
								{passed_argument_name}!.initialize(to: {initialization_target})
							}}
						'''
						print('optional argument:', argument_name, passed_argument_name)
				else:
					wrapper_return_prefix = '' if pointer_wrapping_depth == 0 else 'return '
					pointer_wrapping_prefix += f'{wrapper_return_prefix}withUnsafe{mutability_infix}Pointer(to: {reference_prefix}{argument_name}.cOpaqueStruct!) {{ ({passed_argument_name}: Unsafe{mutability_infix}Pointer<{current_argument_details.rust_obj}>) in\n'
					pointer_wrapping_suffix += '\n}'
				# native_call_prep += current_prep
			elif current_argument_details.swift_type in cloneable_types or (current_argument_details.rust_obj is not None and current_argument_details.rust_obj.startswith('LDKC') and f'C{current_argument_details.swift_type}' in cloneable_types):
				if not is_free_method:
					# clone_infix = '.clone()'
					clone_infix = '.danglingClone()'
				# print(f'Cloneable type detected: {current_argument_details.swift_type}')
				detected_cloneable_types.add(current_argument_details.swift_type)
			elif current_argument_details.rust_obj is not None and ('Option' in current_argument_details.rust_obj or 'Tuple' in current_argument_details.rust_obj or 'Result' in current_argument_details.rust_obj) and not current_argument_details.rust_obj.startswith('['):
				print('Potentially undetected cloneable type?', current_argument_details.rust_obj)
				pass


			if is_trait_callback and current_argument_details.is_const:
				if current_argument_details.swift_type.startswith('[') or current_argument_details.swift_type == 'String':
					mutabilityIndicatorSuffix = '?'

			swift_argument_type = current_argument_details.swift_type
			if not pass_instance:
				if swift_argument_type == 'TxOut':
					swift_argument_type = 'LDKTxOut'

				if TypeParsingRegeces.WRAPPER_TYPE_ARRAY_BRACKET_REGEX.search(swift_argument_type):
					swift_argument_type = TypeParsingRegeces.WRAPPER_TYPE_ARRAY_BRACKET_REGEX.sub('[LDK', swift_argument_type)
				swift_arguments.append(f'{argument_name}: {swift_argument_type}{mutabilityIndicatorSuffix}')



			# native_arguments.append(f'{passed_argument_name}')
			if current_argument_details.rust_obj == 'LDK' + swift_argument_type and not current_argument_details.is_ptr:
				native_arguments.append(f'{passed_argument_name}{clone_infix}.cOpaqueStruct!')
			elif current_argument_details.rust_obj == 'LDKC' + swift_argument_type and not current_argument_details.is_ptr:
				native_arguments.append(f'{passed_argument_name}{clone_infix}.cOpaqueStruct!')
			elif current_argument_details.rust_obj is not None and current_argument_details.rust_obj.startswith(
				'LDK') and swift_argument_type.startswith('[') and not is_pointer_to_array:
				native_arguments.append(f'Bindings.new_{current_argument_details.rust_obj}(array: {passed_argument_name})')
			elif swift_argument_type == 'String':
				if is_trait_callback and current_argument_details.swift_raw_type == 'UnsafePointer<Int8>':
					force_unwrap_suffix = ''
					if mutabilityIndicatorSuffix == '?' and is_trait_callback:
						force_unwrap_suffix = '!'
					native_arguments.append(f'Bindings.string_to_unsafe_int8_pointer(string: {passed_argument_name}{force_unwrap_suffix})')
				else:
					native_arguments.append(f'Bindings.new_LDKStr(string: {passed_argument_name})')
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
		return {
			"swift_arguments": swift_arguments,
			"native_arguments": native_arguments,
			"native_call_prefix": pointer_wrapping_prefix,
			"native_call_suffix": pointer_wrapping_suffix,
			"native_call_prep": native_call_prep,
			"static_eligible": static_eligible
		}

	# the arguments that we receive from a native lambda, before they get passed on to a human consumer
	# Traits -> NATIVE_CALLBACKS -> SWIFT_CALLBACK_PREP, basically
	@classmethod
	def prepare_native_to_swift_callback_arguments(cls, argument_types):
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

			if received_var_name == 'init': # illegal in swift
				received_var_name = 'initValue'
			passed_var_name = received_var_name
			swift_callback_argument_value = received_var_name

			if published_swift_type == '[UInt8]':
				if inferred_raw_swift_type.startswith('(UInt8'):
					array_length = current_argument_details.arr_len
					swift_local_conversion_prefix = f'Bindings.tuple{array_length}_to_array(nativeType: '
					swift_local_conversion_suffix = ')'
					if received_raw_type == 'LDKPublicKey':
						swift_local_conversion_suffix = '.compressed_form)'
				elif received_raw_type is not None and received_raw_type.startswith('LDK'):
					swift_local_conversion_prefix = f'Bindings.{received_raw_type}_to_array(nativeType: '
					swift_local_conversion_suffix = ')'
				elif received_raw_type == 'LDKTransaction':
					swift_local_conversion_prefix = f'Bindings.LDKTransaction_to_array(nativeType: '
					swift_local_conversion_suffix = ')'
					published_swift_type = '[UInt8]'
				elif received_raw_type == 'LDKu8slice':
					swift_local_conversion_prefix = f'Bindings.LDKu8slice_to_array(nativeType: '
					swift_local_conversion_suffix = ')'
					published_swift_type = '[UInt8]'
			elif received_raw_type is not None and received_raw_type.startswith('LDK'):
				if received_raw_type == 'LDK' + published_swift_type:
					swift_local_conversion_prefix = f'{published_swift_type}(pointer: '
					swift_local_conversion_suffix = ')'
				elif received_raw_type.startswith('LDKCVec') and published_swift_type.startswith('[C'):
					swift_local_conversion_prefix = f'Bindings.{received_raw_type}_to_array(nativeType: '
					swift_local_conversion_suffix = ')'
					if TypeParsingRegeces.WRAPPER_TYPE_ARRAY_BRACKET_REGEX.search(published_swift_type):
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
					published_swift_type += '?' # the swift thing is obviously nullible, too

				if is_unsafe_pointer: # always true
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

		return {
			'raw_native_argument_list': native_arguments,
			'swift_callback_arguments': swift_callback_arguments,
			'public_swift_argument_list': public_swift_argument_list,
			'swift_callback_prep': swift_callback_prep
		}

	@classmethod
	def prepare_return_value(cls, return_type, is_clone_method = False, is_trait_instantiator = False):
		rust_return_type = return_type.rust_obj
		return_prefix = ''
		return_suffix = ''
		return_type_string = return_type.swift_type
		swift_return_instantiation_type = return_type_string
		if is_trait_instantiator:
			swift_return_instantiation_type = f'NativelyImplemented{return_type_string}'

		if rust_return_type is not None and rust_return_type.startswith('LDK') and return_type_string.startswith('['):
			return_prefix = f'Bindings.{rust_return_type}_to_array(nativeType: '
			return_suffix = ')'
		elif return_type.swift_raw_type.startswith('(UInt8'):
			# TODO: get array length
			array_length = return_type.arr_len
			return_prefix = f'Bindings.tuple{array_length}_to_array(nativeType: '
			return_suffix = ')'
		elif rust_return_type == 'LDK' + return_type_string and not is_clone_method:
			return_prefix = f'{swift_return_instantiation_type}(pointer: '
			return_suffix = ')'
			if return_type.is_const:
				return_suffix = '.pointee)'
		elif rust_return_type == 'LDKC' + return_type_string and not is_clone_method:
			return_prefix = f'{swift_return_instantiation_type}(pointer: '
			return_suffix = ')'
		elif return_type_string == 'String':
			return_prefix = 'Bindings.LDKStr_to_string(nativeType: '
			return_suffix = ')'
		elif is_clone_method:
			return_prefix = 'Self(pointer: ',
			return_suffix = ')'
		if rust_return_type is None and return_type_string.startswith('['):
			return_suffix = '.pointee)'
			pass

		if TypeParsingRegeces.WRAPPER_TYPE_ARRAY_BRACKET_REGEX.search(return_type_string):
			return_type_string = TypeParsingRegeces.WRAPPER_TYPE_ARRAY_BRACKET_REGEX.sub('[LDK', return_type_string)

		return {
			'prefix': return_prefix,
			'suffix': return_suffix,
			'swift_type': return_type_string
		}
