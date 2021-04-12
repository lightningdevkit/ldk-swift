import re
import os


class TupleGenerator:

	def __init__(self) -> None:
		super().__init__()
		template_path = f'{os.path.dirname(__file__)}/../../templates/TupleTemplate.swift'
		with open(template_path, 'r') as template_handle:
			template = template_handle.read()
			self.template = template

	def generate_tuple(self, tuple_name, tuple_details):
		# method_names = ['openChannel', 'closeChannel']
		# native_method_names = ['ChannelHandler_openChannel', 'ChannelHandler_closeChannel']

		swift_tuple_name = tuple_name[3:]

		method_template_regex = re.compile(
			"(\/\* TUPLE_METHODS_START \*\/\n)(.*)(\n[\t ]*\/\* TUPLE_METHODS_END \*\/)",
			flags=re.MULTILINE | re.DOTALL)
		method_template = method_template_regex.search(self.template).group(2)

		method_prefix = swift_tuple_name + '_'
		tuple_methods = ''

		# fill templates
		for current_method_details in tuple_details.methods:
			current_native_method_name = current_method_details['name']['native']
			current_method_name = current_method_details['name']['swift']

			current_replacement = method_template
			current_replacement = current_replacement.replace('func methodName(', f'func {current_method_name}(')
			current_replacement = current_replacement.replace('TupleType_methodName(',
															  f'{current_native_method_name}(')

			# replace arguments
			swift_arguments = []
			native_arguments = ['self.cTuple']
			native_call_prep = ''
			for current_argument_details in current_method_details['argument_types']:
				argument_name = current_argument_details.var_name
				passed_argument_name = argument_name
				if argument_name == 'this_ptr':
					# we already pass this much more elegantly
					continue

				if current_argument_details.passed_as_ptr:
					passed_argument_name = argument_name+'Pointer'
					# let managerPointer = withUnsafePointer(to: self.cChannelManager!) { (pointer: UnsafePointer<LDKChannelManager>) in
					# 	pointer
					# }
					# the \n\t will add a bunch of extra lines, but this file will be easier to read
					current_prep = f'''
						\n\t	let {passed_argument_name} = withUnsafePointer(to: {argument_name}.cTuple!) {{ (pointer: UnsafePointer<{current_argument_details.rust_obj}>) in
							\n\t\t	pointer
						\n\t	}}
					'''
					native_call_prep += current_prep

				swift_arguments.append(f'{current_argument_details.swift_type} {argument_name}')
				native_arguments.append(f'{passed_argument_name}')

			current_replacement = current_replacement.replace('swift_arguments', ', '.join(swift_arguments))
			current_replacement = current_replacement.replace('native_arguments', ', '.join(native_arguments))
			current_replacement = current_replacement.replace('/* NATIVE_CALL_PREP */', native_call_prep)

			tuple_methods += '\n' + current_replacement + '\n'

		tuple_file = self.template.replace('class TupleName {', f'class {swift_tuple_name} {{')
		tuple_file = tuple_file.replace('var cTuple: TupleType?',
														f'var cTuple: {tuple_name}?')
		tuple_file = tuple_file.replace('self.cTuple = TupleType()',
														f'self.cTuple = {tuple_name}_new()')
		tuple_file = method_template_regex.sub(f'\g<1>{tuple_methods}\g<3>', tuple_file)

		# store the output
		output_path = f'{os.path.dirname(__file__)}/../../bindings/LDK/tuples/{swift_tuple_name}.swift'
		output_directory = os.path.dirname(output_path)
		if not os.path.exists(output_directory):
			os.makedirs(output_directory)
		with open(output_path, "w") as f:
			f.write(tuple_file)
		pass
