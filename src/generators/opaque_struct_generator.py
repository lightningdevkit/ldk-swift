import re
import os

from config import Config
from type_parsing_regeces import TypeParsingRegeces
from conversion_helper import ConversionHelper


class OpaqueStructGenerator:

	def __init__(self) -> None:
		super().__init__()
		template_path = f'{os.path.dirname(__file__)}/../../templates/OpaqueStructTemplate.swift'
		with open(template_path, 'r') as template_handle:
			template = template_handle.read()
			self.template = template

	def generate_opaque_struct(self, struct_name, struct_details, all_type_details={}):
		# method_names = ['openChannel', 'closeChannel']
		# native_method_names = ['ChannelHandler_openChannel', 'ChannelHandler_closeChannel']

		swift_struct_name = struct_name[3:]

		mutating_output_file_contents = self.template

		# CONSTRUCTOR START
		if struct_details.constructor_method is not None:
			# fill constructor details
			constructor_details = struct_details.constructor_method
			constructor_native_name = constructor_details['name']['native']
			swift_arguments = []
			native_arguments = []
			constructor_argument_prep = ''
			for current_argument_details in constructor_details['argument_types']:
				argument_name = current_argument_details.var_name
				passed_argument_name = argument_name
				constructor_argument_conversion_method = None

				swift_argument_type = current_argument_details.swift_type
				if (argument_name == '' or argument_name is None) and swift_argument_type == 'Void' and len(constructor_details['argument_types']) == 1:
					break

				if swift_argument_type == 'TxOut':
					swift_argument_type = 'LDKTxOut'

				if current_argument_details.rust_obj is not None and current_argument_details.rust_obj.startswith(
					'LDK') and swift_argument_type.startswith('['):
					constructor_argument_conversion_method = f'let converted_{argument_name} = Bindings.new_{current_argument_details.rust_obj}(array: {argument_name})'
					constructor_argument_prep += '\n\t\t'+constructor_argument_conversion_method
					passed_argument_name = f'converted_{argument_name}'
				elif swift_argument_type == 'String':
					constructor_argument_conversion_method = f'let converted_{argument_name} = Bindings.new_LDKStr(string: {argument_name})'
					constructor_argument_prep += '\n\t\t'+constructor_argument_conversion_method
					passed_argument_name = f'converted_{argument_name}'
				elif swift_argument_type == '[UInt8]' and current_argument_details.arr_len is not None and current_argument_details.arr_len.isnumeric():
					if current_argument_details.is_const:
						passed_argument_name = argument_name + 'Pointer'
						current_prep = f'''
							\n\t	let {passed_argument_name} = withUnsafePointer(to: Bindings.array_to_tuple{current_argument_details.arr_len}(array: {argument_name})) {{ (pointer: UnsafePointer<{current_argument_details.swift_raw_type}>) in
								\n\t\t	pointer
							\n\t	}}
						'''
						constructor_argument_prep += current_prep
					else:
						constructor_argument_conversion_method = f'let converted_{argument_name} = Bindings.array_to_tuple{current_argument_details.arr_len}(array: {argument_name})'
						constructor_argument_prep += '\n\t\t'+constructor_argument_conversion_method
						passed_argument_name = f'converted_{argument_name}'
				elif current_argument_details.is_ptr:
					passed_argument_name = argument_name + 'Pointer'
					requires_mutability = not current_argument_details.is_const
					mutability_infix = ''
					reference_prefix = ''
					if requires_mutability:
						# argument_name = '&' + argument_name
						reference_prefix = '&'
						mutability_infix = 'Mutable'
					current_prep = f'''
							\n\t	let {passed_argument_name} = withUnsafe{mutability_infix}Pointer(to: {reference_prefix}{argument_name}.cOpaqueStruct!) {{ (pointer: Unsafe{mutability_infix}Pointer<{current_argument_details.rust_obj}>) in
								\n\t\t	pointer
							\n\t	}}
						'''
					constructor_argument_prep += current_prep
				elif current_argument_details.rust_obj == 'LDK' + swift_argument_type:
					passed_argument_name += '.cOpaqueStruct!'
				elif current_argument_details.rust_obj == 'LDKC' + swift_argument_type:
					passed_argument_name += '.cOpaqueStruct!'

				if TypeParsingRegeces.WRAPPER_TYPE_ARRAY_BRACKET_REGEX.search(swift_argument_type):
					swift_argument_type = TypeParsingRegeces.WRAPPER_TYPE_ARRAY_BRACKET_REGEX.sub('[LDK', swift_argument_type)
				swift_arguments.append(f'{argument_name}: {swift_argument_type}')
				native_arguments.append(f'{passed_argument_name}')

			mutating_output_file_contents = mutating_output_file_contents.replace('swift_constructor_arguments',
																				  ', '.join(swift_arguments))
			mutating_output_file_contents = mutating_output_file_contents.replace('/* NATIVE_CONSTRUCTOR_PREP */',
																				  constructor_argument_prep)
			mutating_output_file_contents = mutating_output_file_contents.replace('native_constructor_arguments',
																				  ', '.join(native_arguments))
			mutating_output_file_contents = mutating_output_file_contents.replace(
				'self.cOpaqueStruct = OpaqueStructType(',
				f'self.cOpaqueStruct = {constructor_native_name}(')
		else:
			# remove the default constructor template
			constructor_template_regex = re.compile(
				"(\/\* DEFAULT_CONSTRUCTOR_START \*\/\n)(.*)(\n[\t ]*\/\* DEFAULT_CONSTRUCTOR_END \*\/)",
				flags=re.MULTILINE | re.DOTALL)
			mutating_output_file_contents = constructor_template_regex.sub('', mutating_output_file_contents)

		# REGULAR METHODS START

		method_template_regex = re.compile(
			"(\/\* STRUCT_METHODS_START \*\/\n)(.*)(\n[\t ]*\/\* STRUCT_METHODS_END \*\/)",
			flags=re.MULTILINE | re.DOTALL)
		method_template = method_template_regex.search(mutating_output_file_contents).group(2)

		method_prefix = swift_struct_name + '_'
		struct_methods = ''

		# fill templates
		for current_method_details in struct_details.methods:
			current_native_method_name = current_method_details['name']['native']
			current_method_name = current_method_details['name']['swift']
			current_return_type = current_method_details['return_type']
			current_swift_return_type = current_return_type.swift_type
			# current_rust_return_type = current_method_details['return_type'].rust_obj

			# if current_rust_return_type in all_type_details and all_type_details[current_rust_return_type].type.name == 'UNITARY_ENUM':
			# 	current_return_type = current_rust_return_type
			current_method_name = current_native_method_name[len(method_prefix):]

			current_replacement = method_template
			is_clone_method = current_method_details['is_clone']

			if current_return_type.rust_obj is not None and current_return_type.rust_obj.startswith('LDK') and current_return_type.swift_type.startswith('['):
				return_type_wrapper_prefix = f'Bindings.{current_method_details["return_type"].rust_obj}_to_array(nativeType: '
				return_type_wrapper_suffix = ')'
				current_replacement = current_replacement.replace(
					'return OpaqueStructType_methodName(native_arguments)',
					f'return {return_type_wrapper_prefix}OpaqueStructType_methodName(native_arguments){return_type_wrapper_suffix}')
			elif current_return_type.rust_obj == 'LDK' + current_return_type.swift_type and not is_clone_method:
				return_type_wrapper_prefix = f'{current_method_details["return_type"].swift_type}(pointer: '
				return_type_wrapper_suffix = ')'
				if current_return_type.is_const:
					return_type_wrapper_suffix = '.pointee)'
				current_replacement = current_replacement.replace(
					'return OpaqueStructType_methodName(native_arguments)',
					f'return {return_type_wrapper_prefix}OpaqueStructType_methodName(native_arguments){return_type_wrapper_suffix}')
			elif current_return_type.rust_obj == 'LDKC' + current_return_type.swift_type and not is_clone_method:
				return_type_wrapper_prefix = f'{current_method_details["return_type"].swift_type}(pointer: '
				# return_type_wrapper_suffix = '.pointee)'
				return_type_wrapper_suffix = ')'
				current_replacement = current_replacement.replace(
					'return OpaqueStructType_methodName(native_arguments)',
					f'return {return_type_wrapper_prefix}OpaqueStructType_methodName(native_arguments){return_type_wrapper_suffix}')
			elif current_return_type.swift_type == 'String':
				current_replacement = current_replacement.replace(
					'return OpaqueStructType_methodName(native_arguments)',
					'return Bindings.LDKStr_to_string(nativeType: OpaqueStructType_methodName(native_arguments))')

			if current_return_type.rust_obj is None and current_return_type.swift_type.startswith('['):
				current_replacement = current_replacement.replace(
					'OpaqueStructType_methodName(native_arguments)',
					'OpaqueStructType_methodName(native_arguments).pointee')

			if current_return_type.rust_obj is None and current_return_type.swift_type.startswith('['):
				current_swift_return_type = current_return_type.swift_raw_type

			# if current_swift_return_type == '[TransactionOutputs]':
			# 	current_swift_return_type = '[LDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ]'
			# elif current_swift_return_type == '[Txid]':
			# 	current_swift_return_type = '[LDKThirtyTwoBytes]'

			if TypeParsingRegeces.WRAPPER_TYPE_ARRAY_BRACKET_REGEX.search(current_swift_return_type):
				current_swift_return_type = TypeParsingRegeces.WRAPPER_TYPE_ARRAY_BRACKET_REGEX.sub('[LDK', current_swift_return_type)

			current_replacement = current_replacement.replace('func methodName(', f'func {current_method_name}(')

			# replace arguments
			prepared_arguments = ConversionHelper.prepare_swift_to_native_arguments(current_method_details['argument_types'])
			swift_arguments = prepared_arguments["swift_arguments"]
			native_arguments = prepared_arguments['native_arguments']
			native_call_prefix = prepared_arguments['native_call_prefix']
			native_call_suffix = prepared_arguments['native_call_suffix']

			current_replacement = current_replacement.replace('swift_arguments', ', '.join(swift_arguments))
			if is_clone_method:
				# add closing parenthesis that could not be added further up in the clone initializer
				current_replacement = current_replacement.replace('OpaqueStructType_methodName(native_arguments)', native_call_prefix + 'OpaqueStructType_methodName(' + ', '.join(native_arguments) + '))' + native_call_suffix)
			else:
				current_replacement = current_replacement.replace('OpaqueStructType_methodName(native_arguments)', native_call_prefix + 'OpaqueStructType_methodName(' + ', '.join(native_arguments) + ')' + native_call_suffix)
			# current_replacement = current_replacement.replace('/* NATIVE_CALL_PREP */', native_call_prep)
			current_replacement = current_replacement.replace('-> Void {', f'-> {current_swift_return_type} {{')

			if is_clone_method:
				current_replacement = current_replacement.replace('OpaqueStructType_methodName(',
																  f'{swift_struct_name}(pointer: {current_native_method_name}(')
			else:
				current_replacement = current_replacement.replace('OpaqueStructType_methodName(',
																  f'{current_native_method_name}(')

			struct_methods += '\n' + current_replacement + '\n'

		# DESTRUCTOR START
		if struct_details.free_method is not None:
			# fill constructor details
			free_method_details = struct_details.free_method
			free_native_name = free_method_details['name']['native']
			native_call_prep = ''
			native_arguments = []
			for current_argument_details in free_method_details['argument_types']:
				pass_instance = False
				argument_name = current_argument_details.var_name
				passed_argument_name = argument_name
				if argument_name.startswith('this_'):
					pass_instance = True

				if current_argument_details.is_ptr:
					passed_argument_name = argument_name + 'Pointer'
					requires_mutability = not current_argument_details.is_const

					mutability_infix = ''

					if pass_instance:
						argument_name = 'self'
					if requires_mutability:
						argument_name = '&' + argument_name
						mutability_infix = 'Mutable'

					current_prep = f'''
							\n\t	let {passed_argument_name} = withUnsafe{mutability_infix}Pointer(to: {argument_name}.cOpaqueStruct!) {{ (pointer: Unsafe{mutability_infix}Pointer<{current_argument_details.rust_obj}>) in
								\n\t\t	pointer
							\n\t	}}
						'''
					native_call_prep += current_prep
				elif pass_instance:
					passed_argument_name = 'self.cOpaqueStruct!'
				native_arguments.append(f'{passed_argument_name}')

			struct_methods += f'''
				\n\tdeinit {{
					{native_call_prep}
					\n\t	{free_native_name}({', '.join(native_arguments)})
				\n\t}}
			'''

		mutating_output_file_contents = mutating_output_file_contents.replace('class OpaqueStructName {',
																			  f'class {swift_struct_name} {{')
		mutating_output_file_contents = mutating_output_file_contents.replace('init(pointer: OpaqueStructType',
																			  f'init(pointer: {struct_name}')
		mutating_output_file_contents = mutating_output_file_contents.replace('var cOpaqueStruct: OpaqueStructType?',
																			  f'var cOpaqueStruct: {struct_name}?')
		mutating_output_file_contents = method_template_regex.sub(f'\g<1>{struct_methods}\g<3>',
																  mutating_output_file_contents)

		# store the output
		output_path = f'{Config.OUTPUT_DIRECTORY_PATH}/structs/{swift_struct_name}.swift'
		output_directory = os.path.dirname(output_path)
		if not os.path.exists(output_directory):
			os.makedirs(output_directory)
		with open(output_path, "w") as f:
			f.write(mutating_output_file_contents)
