from type_parsing_regeces import TypeParsingRegeces

class ConversionHelper:
	@classmethod
	def prepare_swift_to_native_arguments(cls, argument_types):
		swift_arguments = []
		native_arguments = []
		pointer_wrapping_prefix = ''
		pointer_wrapping_suffix = ''
		pointer_wrapping_depth = 0
		for current_argument_details in argument_types:
			pass_instance = False
			argument_name = current_argument_details.var_name
			passed_argument_name = argument_name
			if argument_name == 'this_ptr':
				pass_instance = True

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
				current_prep = f'''
						\n\t	let {passed_argument_name} = withUnsafe{mutability_infix}Pointer(to: {reference_prefix}{argument_name}.cOpaqueStruct!) {{ (pointer: Unsafe{mutability_infix}Pointer<{current_argument_details.rust_obj}>) in
							\n\t\t	pointer
						\n\t	}}
					'''
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
					pointer_wrapping_prefix += f'return withUnsafePointer(to: Bindings.array_to_tuple{current_argument_details.arr_len}(array: {argument_name})) {{ ({passed_argument_name}: UnsafePointer<{current_argument_details.swift_raw_type}>) in\n'
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
			"native_call_suffix": pointer_wrapping_suffix
		}
