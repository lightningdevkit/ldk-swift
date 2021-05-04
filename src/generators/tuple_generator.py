import re
import os

from config import Config

# Tuples have only new, optionally clone, and free methods
class TupleGenerator:

	def __init__(self) -> None:
		super().__init__()
		template_path = f'{os.path.dirname(__file__)}/../../templates/TupleTemplate.swift'
		with open(template_path, 'r') as template_handle:
			template = template_handle.read()
			self.template = template

	def generate_tuple(self, struct_name, struct_details, all_type_details = {}):
		# method_names = ['openChannel', 'closeChannel']
		# native_method_names = ['ChannelHandler_openChannel', 'ChannelHandler_closeChannel']

		swift_tuple_name = struct_name[3:]

		mutating_output_file_contents = self.template


		# REGULAR METHODS START

		method_template_regex = re.compile(
			"(\/\* TUPLE_METHODS_START \*\/\n)(.*)(\n[\t ]*\/\* TUPLE_METHODS_END \*\/)",
			flags=re.MULTILINE | re.DOTALL)
		method_template = method_template_regex.search(mutating_output_file_contents).group(2)

		method_prefix = swift_tuple_name + '_'
		struct_methods = ''

		# fill templates
		for current_method_details in struct_details.methods:
			current_native_method_name = current_method_details['name']['native']
			current_method_name = current_method_details['name']['swift']
			current_return_type = current_method_details['return_type'].swift_type
			current_return_type = swift_tuple_name
			# current_rust_return_type = current_method_details['return_type'].rust_obj

			# if current_rust_return_type in all_type_details and all_type_details[current_rust_return_type].type.name == 'UNITARY_ENUM':
			# 	current_return_type = current_rust_return_type
			current_method_name = current_native_method_name[len(method_prefix):]

			current_replacement = method_template

			if current_method_details['return_type'].rust_obj is not None and current_method_details['return_type'].rust_obj.startswith('LDK') and current_method_details['return_type'].swift_type.startswith('['):
				return_type_wrapper_prefix = f'Bindings.{current_method_details["return_type"].rust_obj}_to_array(nativeType: '
				return_type_wrapper_suffix = ')'
				current_replacement = current_replacement.replace('return TupleType_methodName(native_arguments)', f'return {return_type_wrapper_prefix}TupleType_methodName(native_arguments){return_type_wrapper_suffix}')
			elif current_method_details['return_type'].rust_obj == 'LDK' + current_method_details['return_type'].swift_type:
				return_type_wrapper_prefix = f'{current_method_details["return_type"].swift_type}(pointer: '
				return_type_wrapper_suffix = ')'
				current_replacement = current_replacement.replace('return TupleType_methodName(native_arguments)', f'return {return_type_wrapper_prefix}TupleType_methodName(native_arguments){return_type_wrapper_suffix}')

			current_replacement = current_replacement.replace('func methodName(', f'func {current_method_name}(')

			is_clone_method = current_method_details['is_clone']
			if is_clone_method:
				current_replacement = current_replacement.replace('TupleType_methodName(',
																  f'{swift_tuple_name}(pointer: {current_native_method_name}(')
			else:
				current_replacement = current_replacement.replace('TupleType_methodName(',
																  f'{current_native_method_name}(')
			# replace arguments
			swift_arguments = []
			native_arguments = []
			native_call_prep = ''
			for current_argument_details in current_method_details['argument_types']:
				pass_instance = False
				argument_name = current_argument_details.var_name
				passed_argument_name = argument_name
				if argument_name == 'this_ptr':
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
					# let managerPointer = withUnsafePointer(to: self.cChannelManager!) { (pointer: UnsafePointer<LDKChannelManager>) in
					# 	pointer
					# }
					# the \n\t will add a bunch of extra lines, but this file will be easier to read
					current_prep = f'''
						\n\t	let {passed_argument_name} = withUnsafe{mutability_infix}Pointer(to: {argument_name}.cOpaqueStruct!) {{ (pointer: Unsafe{mutability_infix}Pointer<{current_argument_details.rust_obj}>) in
							\n\t\t	pointer
						\n\t	}}
					'''
					native_call_prep += current_prep

				if not pass_instance:
					swift_arguments.append(f'{argument_name}: {current_argument_details.swift_type}')

				# native_arguments.append(f'{passed_argument_name}')
				if current_argument_details.rust_obj == 'LDK' + current_argument_details.swift_type and not current_argument_details.is_ptr:
					native_arguments.append(f'{passed_argument_name}.cOpaqueStruct!')
				elif current_argument_details.rust_obj is not None and current_argument_details.rust_obj.startswith('LDK') and current_argument_details.swift_type.startswith('['):
					native_arguments.append(f'Bindings.new_{current_argument_details.rust_obj}(array: {passed_argument_name})')
				else:
					native_arguments.append(f'{passed_argument_name}')

			current_replacement = current_replacement.replace('swift_arguments', ', '.join(swift_arguments))
			if is_clone_method:
				# add closing parenthesis that could not be added further up in the clone initializer
				current_replacement = current_replacement.replace('native_arguments', ', '.join(native_arguments) + ')')
			else:
				current_replacement = current_replacement.replace('native_arguments', ', '.join(native_arguments))
			current_replacement = current_replacement.replace('/* NATIVE_CALL_PREP */', native_call_prep)
			current_replacement = current_replacement.replace('-> Void {', f'-> {current_return_type} {{')

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

				# always overwrite the weird _res variable
				native_arguments = ['self.cOpaqueStruct!']


			struct_methods += f'''
				\n\tdeinit {{
					{native_call_prep}
					\n\t	{free_native_name}({', '.join(native_arguments)})
				\n\t}}
			'''


		mutating_output_file_contents = mutating_output_file_contents.replace('class TupleName {',
																			  f'class {swift_tuple_name} {{')
		mutating_output_file_contents = mutating_output_file_contents.replace('init(pointer: TupleType',
																			  f'init(pointer: {struct_name}')
		mutating_output_file_contents = mutating_output_file_contents.replace('var cOpaqueStruct: TupleType?',
																			  f'var cOpaqueStruct: {struct_name}?')
		mutating_output_file_contents = method_template_regex.sub(f'\g<1>{struct_methods}\g<3>',
																  mutating_output_file_contents)


		# store the output
		output_path = f'{Config.OUTPUT_DIRECTORY_PATH}/tuples/{swift_tuple_name}.swift'
		output_directory = os.path.dirname(output_path)
		if not os.path.exists(output_directory):
			os.makedirs(output_directory)
		with open(output_path, "w") as f:
			f.write(mutating_output_file_contents)
