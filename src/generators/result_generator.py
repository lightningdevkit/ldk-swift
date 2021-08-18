import re
import os

from src.config import Config
from src.conversion_helper import ConversionHelper
from src.conversion_helper import ConversionHelper

class ResultGenerator:

	def __init__(self) -> None:
		super().__init__()
		template_path = f'{os.path.dirname(__file__)}/../../templates/ResultTemplate.swift'
		with open(template_path, 'r') as template_handle:
			template = template_handle.read()
			self.template = template

	def generate_result(self, struct_name, struct_details, all_type_details={}):
		# method_names = ['openChannel', 'closeChannel']
		# native_method_names = ['ChannelHandler_openChannel', 'ChannelHandler_closeChannel']

		swift_struct_name = struct_name[4:]

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

				if current_argument_details.rust_obj is not None and current_argument_details.rust_obj.startswith('LDK') and current_argument_details.swift_type.startswith('['):
					constructor_argument_conversion_method = f'let converted_{argument_name} = Bindings.new_{current_argument_details.rust_obj}(array: {argument_name})'
					constructor_argument_prep += constructor_argument_conversion_method
					passed_argument_name = f'converted_{argument_name}'
				elif current_argument_details.rust_obj == 'LDK' + current_argument_details.swift_type:
					passed_argument_name += '.cOpaqueStruct!'

				swift_arguments.append(f'{argument_name}: {current_argument_details.swift_type}')
				native_arguments.append(f'{passed_argument_name}')

			mutating_output_file_contents = mutating_output_file_contents.replace('swift_constructor_arguments', ', '.join(swift_arguments))
			mutating_output_file_contents = mutating_output_file_contents.replace('/* NATIVE_CONSTRUCTOR_PREP */', constructor_argument_prep)
			mutating_output_file_contents = mutating_output_file_contents.replace('native_constructor_arguments', ', '.join(native_arguments))
			mutating_output_file_contents = mutating_output_file_contents.replace('self.cOpaqueStruct = ResultType(', f'self.cOpaqueStruct = {constructor_native_name}(')
		else:
			# remove the default constructor template
			constructor_template_regex = re.compile("(\/\* DEFAULT_CONSTRUCTOR_START \*\/\n)(.*)(\n[\t ]*\/\* DEFAULT_CONSTRUCTOR_END \*\/)", flags=re.MULTILINE | re.DOTALL)
			constructor_body = f'''
				public init() {{
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = {struct_name}(contents: {struct_details.result_wrapper_type}(), result_ok: true)
				}}
			'''
			mutating_output_file_contents = constructor_template_regex.sub(f'\g<1>{constructor_body}\g<3>', mutating_output_file_contents)

		# REGULAR METHODS START

		method_template_regex = re.compile("(\/\* RESULT_METHODS_START \*\/\n)(.*)(\n[\t ]*\/\* RESULT_METHODS_END \*\/)", flags=re.MULTILINE | re.DOTALL)
		method_template = method_template_regex.search(mutating_output_file_contents).group(2)

		method_prefix = swift_struct_name + '_'
		struct_methods = ''

		if struct_details.result_error_type.swift_type != 'Void':
			error_return_wrappers = ConversionHelper.prepare_return_value(struct_details.result_error_type, False)

			struct_methods += f'''
			public func getError() -> {error_return_wrappers['swift_type']}? {{
				if self.cOpaqueStruct?.result_ok == false {{
					return {error_return_wrappers['prefix']}self.cOpaqueStruct!.contents.err.pointee{error_return_wrappers['suffix']}
				}}
				return nil
			}}
			'''

		if struct_details.result_value_type.swift_type != 'Void':
			value_return_wrappers = ConversionHelper.prepare_return_value(struct_details.result_value_type, False)

			struct_methods += f'''
			public func getValue() -> {value_return_wrappers['swift_type']}? {{
				if self.cOpaqueStruct?.result_ok == true {{
					return {value_return_wrappers['prefix']}self.cOpaqueStruct!.contents.result.pointee{value_return_wrappers['suffix']}
				}}
				return nil
			}}
			'''

		# fill templates
		for current_method_details in struct_details.methods:
			current_native_method_name = current_method_details['name']['native']
			current_method_name = current_method_details['name']['swift']
			current_return_type = current_method_details['return_type'].swift_type

			current_replacement = method_template
			is_clone_method = current_method_details['is_clone']
			is_free_method = current_method_details['is_free']


			force_pass_instance = False
			if len(current_method_details['argument_types']) == 1:
				if current_method_details['argument_types'][0].swift_type == swift_struct_name:
					force_pass_instance = True
			value_return_wrappers = ConversionHelper.prepare_return_value(current_method_details['return_type'], False)
			prepared_arguments = ConversionHelper.prepare_swift_to_native_arguments(current_method_details['argument_types'], False, force_pass_instance, is_free_method)
			static_infix = 'class ' if prepared_arguments['static_eligible'] else ''

			current_replacement = current_replacement.replace('return ResultType_methodName(native_arguments)',
															  f'return {value_return_wrappers["prefix"]}ResultType_methodName(native_arguments){value_return_wrappers["suffix"]}')
			current_replacement = current_replacement.replace('ResultType_methodName(native_arguments)', prepared_arguments['native_call_prefix'] + 'ResultType_methodName(' + ', '.join(prepared_arguments['native_arguments']) + ')' + prepared_arguments['native_call_suffix'])
			current_replacement = current_replacement.replace('ResultType_methodName(', f'{current_native_method_name}(')
			current_replacement = current_replacement.replace('func methodName(', f'{static_infix}func {current_method_name}(')
			current_replacement = current_replacement.replace('swift_arguments', ', '.join(prepared_arguments["swift_arguments"]))
			current_replacement = current_replacement.replace('native_arguments', ', '.join(prepared_arguments['native_arguments']))
			current_replacement = current_replacement.replace('/* NATIVE_CALL_PREP */', prepared_arguments['native_call_prep'])
			current_replacement = current_replacement.replace('-> Void {', f'-> {current_return_type} {{')

			if is_clone_method:
				current_replacement += f'''\n
					internal func danglingClone() -> {current_return_type} {{
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}}
				'''

			if is_free_method:
				current_replacement = current_replacement.replace('public func', 'internal func')
				current_replacement += f'''\n
					internal func dangle() -> {swift_struct_name} {{
        				self.dangling = true
						return self
					}}
					
					deinit {{
						if !self.dangling {{
							self.{current_method_name}()
						}}
					}}
				'''

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

		mutating_output_file_contents = mutating_output_file_contents.replace('class ResultName {', f'class {swift_struct_name} {{')
		mutating_output_file_contents = mutating_output_file_contents.replace('init(pointer: ResultType', f'init(pointer: {struct_name}')
		mutating_output_file_contents = mutating_output_file_contents.replace('var cOpaqueStruct: ResultType?', f'var cOpaqueStruct: {struct_name}?')
		mutating_output_file_contents = method_template_regex.sub(f'\g<1>{struct_methods}\g<3>', mutating_output_file_contents)

		# store the output
		output_path = f'{Config.OUTPUT_DIRECTORY_PATH}/results/{swift_struct_name}.swift'
		output_directory = os.path.dirname(output_path)
		if not os.path.exists(output_directory):
			os.makedirs(output_directory)
		with open(output_path, "w") as f:
			f.write(mutating_output_file_contents)
