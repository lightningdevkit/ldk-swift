from type_parsing_regeces import TypeParsingRegeces

class ConversionHelper:
	@classmethod
	def prepare_swift_to_native_arguments(cls, argument_types):
		swift_arguments = []
		native_arguments = []
		pointer_wrapping_prefix = ''
		pointer_wrapping_suffix = ''
		native_call_prep = ''
		pointer_wrapping_depth = 0
		for current_argument_details in argument_types:
			pass_instance = False
			argument_name = current_argument_details.var_name
			passed_argument_name = argument_name

			if (argument_name == '' or argument_name is None) and current_argument_details.swift_type == 'Void' and len(argument_types) == 1:
				break

			if argument_name == 'this_ptr' or argument_name == 'this_arg':
				pass_instance = True
				passed_argument_name = 'self'

			if current_argument_details.is_ptr:
				passed_argument_name = argument_name + 'Pointer'
				requires_mutability = not current_argument_details.is_const

				reference_prefix = ''
				mutability_infix = ''

				if pass_instance:
					argument_name = 'self'
				if requires_mutability:
					# argument_name = '&' + argument_name
					reference_prefix = '&'
					mutability_infix = 'Mutable'
				# let managerPointer = withUnsafePointer(to: self.cChannelManager!) { (pointer: UnsafePointer<LDKChannelManager>) in
				# 	pointer
				# }
				# the \n\t will add a bunch of extra lines, but this file will be easier to read

				if requires_mutability:
					native_call_prep += f'''
						let {passed_argument_name} = UnsafeMutablePointer<{current_argument_details.rust_obj}>.allocate(capacity: 1)
						{passed_argument_name}.initialize(to: {argument_name}.cOpaqueStruct!)
					'''
				else:
					wrapper_return_prefix = '' if pointer_wrapping_depth == 0 else 'return '
					pointer_wrapping_prefix += f'{wrapper_return_prefix}withUnsafe{mutability_infix}Pointer(to: {reference_prefix}{argument_name}.cOpaqueStruct!) {{ ({passed_argument_name}: Unsafe{mutability_infix}Pointer<{current_argument_details.rust_obj}>) in\n'
					pointer_wrapping_suffix += '\n}'
				# native_call_prep += current_prep

			swift_argument_type = current_argument_details.swift_type
			if not pass_instance:
				if swift_argument_type == 'TxOut':
					swift_argument_type = 'LDKTxOut'

				if TypeParsingRegeces.WRAPPER_TYPE_ARRAY_BRACKET_REGEX.search(swift_argument_type):
					swift_argument_type = TypeParsingRegeces.WRAPPER_TYPE_ARRAY_BRACKET_REGEX.sub('[LDK', swift_argument_type)
				swift_arguments.append(f'{argument_name}: {swift_argument_type}')

			# native_arguments.append(f'{passed_argument_name}')
			if current_argument_details.rust_obj == 'LDK' + swift_argument_type and not current_argument_details.is_ptr:
				native_arguments.append(f'{passed_argument_name}.cOpaqueStruct!')
			elif current_argument_details.rust_obj == 'LDKC' + swift_argument_type and not current_argument_details.is_ptr:
				native_arguments.append(f'{passed_argument_name}.cOpaqueStruct!')
			elif current_argument_details.rust_obj is not None and current_argument_details.rust_obj.startswith(
				'LDK') and swift_argument_type.startswith('['):
				native_arguments.append(f'Bindings.new_{current_argument_details.rust_obj}(array: {passed_argument_name})')
			elif swift_argument_type == 'String':
				native_arguments.append(f'Bindings.new_LDKStr(string: {passed_argument_name})')
			elif current_argument_details.rust_obj is None and current_argument_details.arr_len is not None and current_argument_details.arr_len.isnumeric():
				if current_argument_details.is_const:
					passed_argument_name = argument_name + 'Pointer'
					current_prep = f'''
							\n\t	let {passed_argument_name} = withUnsafePointer(to: Bindings.array_to_tuple{current_argument_details.arr_len}(array: {argument_name})) {{ (pointer: UnsafePointer<{current_argument_details.swift_raw_type}>) in
								\n\t\t	pointer
							\n\t	}}
						'''
					wrapper_return_prefix = '' if pointer_wrapping_depth == 0 else 'return '
					pointer_wrapping_prefix += f'{wrapper_return_prefix}withUnsafePointer(to: Bindings.array_to_tuple{current_argument_details.arr_len}(array: {argument_name})) {{ ({passed_argument_name}: UnsafePointer<{current_argument_details.swift_raw_type}>) in\n'
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
			"native_call_prep": native_call_prep
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
