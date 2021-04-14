import re
import os

from config import Config


class TraitGenerator:

	def __init__(self) -> None:
		super().__init__()
		template_path = f'{os.path.dirname(__file__)}/../../templates/TraitTemplate.swift'
		with open(template_path, 'r') as template_handle:
			template = template_handle.read()
			self.template = template

	def generate_trait(self, struct_name, struct_details):
		# method_names = ['openChannel', 'closeChannel']
		# native_method_names = ['ChannelHandler_openChannel', 'ChannelHandler_closeChannel']

		swift_struct_name = struct_name[3:]

		method_template_regex = re.compile(
			"(\/\* STRUCT_METHODS_START \*\/\n)(.*)(\n[\t ]*\/\* STRUCT_METHODS_END \*\/)",
			flags=re.MULTILINE | re.DOTALL)
		method_template = method_template_regex.search(self.template).group(2)

		method_prefix = swift_struct_name + '_'
		struct_methods = ''

		# fill templates
		for current_method_details in struct_details.methods:
			current_native_method_name = current_method_details['name']['native']
			current_method_name = current_method_details['name']['swift']
			# current_method_name = current_native_method_name[len(method_prefix):]

			current_replacement = method_template
			current_replacement = current_replacement.replace('func methodName(', f'func {current_method_name}(')
			current_replacement = current_replacement.replace('OpaqueStructType_methodName(',
															  f'{current_native_method_name}(')

			# replace arguments
			swift_arguments = []
			native_arguments = ['self.cOpaqueStruct']
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
						\n\t	let {passed_argument_name} = withUnsafePointer(to: {argument_name}.cOpaqueStruct!) {{ (pointer: UnsafePointer<{current_argument_details.rust_obj}>) in
							\n\t\t	pointer
						\n\t	}}
					'''
					native_call_prep += current_prep

				swift_arguments.append(f'{current_argument_details.java_hu_ty} {argument_name}')
				native_arguments.append(f'{passed_argument_name}')

			current_replacement = current_replacement.replace('swift_arguments', ', '.join(swift_arguments))
			current_replacement = current_replacement.replace('native_arguments', ', '.join(native_arguments))
			current_replacement = current_replacement.replace('/* NATIVE_CALL_PREP */', native_call_prep)

			struct_methods += '\n' + current_replacement + '\n'

		opaque_struct_file = self.template.replace('class OpaqueStructName {', f'class {swift_struct_name} {{')
		opaque_struct_file = opaque_struct_file.replace('var cOpaqueStruct: OpaqueStructType?',
														f'var cOpaqueStruct: {struct_name}?')
		opaque_struct_file = opaque_struct_file.replace('self.cOpaqueStruct = OpaqueStructType()',
														f'self.cOpaqueStruct = {struct_name}_new()')
		opaque_struct_file = method_template_regex.sub(f'\g<1>{struct_methods}\g<3>', opaque_struct_file)

		# store the output
		output_path = f'{Config.OUTPUT_DIRECTORY_PATH}/traits/{swift_struct_name}.swift'
		output_directory = os.path.dirname(output_path)
		if not os.path.exists(output_directory):
			os.makedirs(output_directory)
		with open(output_path, "w") as f:
			f.write(opaque_struct_file)
		pass
