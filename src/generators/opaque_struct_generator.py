import re
import os

from src.config import Config
from src.type_parsing_regeces import TypeParsingRegeces
from src.conversion_helper import ConversionHelper


class OpaqueStructGenerator:

	def __init__(self) -> None:
		super().__init__()
		template_path = f'{os.path.dirname(__file__)}/../../templates/OpaqueStructTemplate.swift'
		with open(template_path, 'r') as template_handle:
			template = template_handle.read()
			self.template = template

	def generate_opaque_struct(self, struct_name, struct_details, all_type_details={}, trait_structs=set(), returned_trait_instances=set()):
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

			constructor_prepared_arguments = ConversionHelper.prepare_swift_to_native_arguments(constructor_details['argument_types'])
			constructor_swift_arguments = constructor_prepared_arguments["swift_arguments"]
			constructor_native_arguments = constructor_prepared_arguments['native_arguments']
			constructor_native_call_prefix = constructor_prepared_arguments['native_call_prefix']
			constructor_native_call_suffix = constructor_prepared_arguments['native_call_suffix']
			constructor_native_call_prep = constructor_prepared_arguments['native_call_prep']

			if len(constructor_prepared_arguments['non_cloneable_argument_indices_passed_by_ownership']) > 0:
				cloneability_warning = 'Non-cloneable types passed by ownership. Here be dragons!'
				print(f'/// {cloneability_warning}: {constructor_native_name}')

			mutating_output_file_contents = mutating_output_file_contents.replace('swift_constructor_arguments', ', '.join(constructor_swift_arguments))
			mutating_output_file_contents = mutating_output_file_contents.replace('OpaqueStructType(native_constructor_arguments)', constructor_native_call_prefix + 'OpaqueStructType(' + ', '.join(
				constructor_native_arguments) + ')' + constructor_native_call_suffix)

			mutating_output_file_contents = mutating_output_file_contents.replace('/* NATIVE_CONSTRUCTOR_PREP */', constructor_native_call_prep)
			mutating_output_file_contents = mutating_output_file_contents.replace('OpaqueStructType(', f'{constructor_native_name}(')
		else:
			# remove the default constructor template
			constructor_template_regex = re.compile("(\/\* DEFAULT_CONSTRUCTOR_START \*\/\n)(.*)(\n[\t ]*\/\* DEFAULT_CONSTRUCTOR_END \*\/)", flags=re.MULTILINE | re.DOTALL)
			mutating_output_file_contents = constructor_template_regex.sub('', mutating_output_file_contents)

		# REGULAR METHODS START

		method_template_regex = re.compile("(\/\* STRUCT_METHODS_START \*\/\n)(.*)(\n[\t ]*\/\* STRUCT_METHODS_END \*\/)", flags=re.MULTILINE | re.DOTALL)
		method_template = method_template_regex.search(mutating_output_file_contents).group(2)

		method_prefix = swift_struct_name + '_'
		struct_methods = ''

		method_iterator = struct_details.methods
		if struct_details.free_method is not None:
			method_iterator.append(struct_details.free_method)


		# fill templates
		for current_method_details in method_iterator:
			current_native_method_name = current_method_details['name']['native']
			current_method_name = current_method_details['name']['swift']
			current_return_type = current_method_details['return_type']
			current_swift_return_type = current_return_type.swift_type
			# current_rust_return_type = current_method_details['return_type'].rust_obj

			# if current_rust_return_type in all_type_details and all_type_details[current_rust_return_type].type.name == 'UNITARY_ENUM':
			# 	current_return_type = current_rust_return_type
			current_method_name = current_native_method_name[len(method_prefix):]

			force_pass_instance = False
			if len(current_method_details['argument_types']) == 1:
				if current_method_details['argument_types'][0].swift_type == swift_struct_name:
					force_pass_instance = True

			current_replacement = method_template
			is_clone_method = current_method_details['is_clone']
			is_free_method = current_method_details['is_free']

			if current_return_type.rust_obj is None and current_return_type.swift_type.startswith('['):
				# current_swift_return_type = current_return_type.swift_raw_type
				pass

			if TypeParsingRegeces.WRAPPER_TYPE_ARRAY_BRACKET_REGEX.search(current_swift_return_type):
				current_swift_return_type = TypeParsingRegeces.WRAPPER_TYPE_ARRAY_BRACKET_REGEX.sub('[LDK', current_swift_return_type)

			is_trait_instantiator = False
			if current_return_type.rust_obj == 'LDK' + current_return_type.swift_type and not is_clone_method:
				if current_return_type.rust_obj in trait_structs:
					trait_swift_type = current_method_details["return_type"].swift_type
					# actual_return_type = 'NativelyImplemented' + trait_swift_type
					# current_method_details["return_type"].swift_type = actual_return_type
					returned_trait_instances.add(trait_swift_type)
					is_trait_instantiator = True

			# replace arguments
			prepared_arguments = ConversionHelper.prepare_swift_to_native_arguments(current_method_details['argument_types'], False, force_pass_instance, is_free_method)
			value_return_wrappers = ConversionHelper.prepare_return_value(current_method_details['return_type'], False, is_trait_instantiator)
			static_infix = 'class ' if prepared_arguments['static_eligible'] else ''

			if len(prepared_arguments['non_cloneable_argument_indices_passed_by_ownership']) > 0:
				cloneability_warning = 'Non-cloneable types passed by ownership. Here be dragons!'
				cloneability_types = []
				for affected_argument_index in prepared_arguments['non_cloneable_argument_indices_passed_by_ownership']:
					# swift_argument_index = affected_argument_index + len(arguments['swift_arguments']) - len(current_method['argument_types'])
					# swift_argument_message = arguments['swift_arguments'][swift_argument_index] + f' ({swift_argument_index})'
					cloneability_types.append(f'{current_method_details["argument_types"][affected_argument_index].var_name} ({affected_argument_index})')
				cloneability_type_message = '; '.join(cloneability_types)
				print(f'/// {cloneability_warning}: {current_native_method_name} [{cloneability_type_message}]')


			current_replacement = current_replacement.replace('return OpaqueStructType_methodName(native_arguments)',
															  f'return {value_return_wrappers["prefix"]}OpaqueStructType_methodName(native_arguments){value_return_wrappers["suffix"]}')
			current_replacement = current_replacement.replace('func methodName(', f'{static_infix}func {current_method_name}(')
			current_replacement = current_replacement.replace('OpaqueStructType_methodName(native_arguments)',
															  prepared_arguments['native_call_prefix'] + 'OpaqueStructType_methodName(' + ', '.join(prepared_arguments['native_arguments']) + ')' +
															  prepared_arguments['native_call_suffix'])
			current_replacement = current_replacement.replace('OpaqueStructType_methodName(', f'{current_native_method_name}(')
			current_replacement = current_replacement.replace('func methodName(', f'{static_infix}func {current_method_name}(')
			current_replacement = current_replacement.replace('swift_arguments', ', '.join(prepared_arguments["swift_arguments"]))
			current_replacement = current_replacement.replace('native_arguments', ', '.join(prepared_arguments['native_arguments']))
			current_replacement = current_replacement.replace('/* NATIVE_CALL_PREP */', prepared_arguments['native_call_prep'])
			current_replacement = current_replacement.replace('-> Void {', f'-> {current_swift_return_type} {{')

			if is_clone_method:
				current_replacement += f'''\n
					internal func danglingClone() -> {current_swift_return_type} {{
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
							Bindings.print("Freeing {swift_struct_name} \(self.instanceNumber).")
							self.{current_method_name}()
						}} else {{
							Bindings.print("Not freeing {swift_struct_name} \(self.instanceNumber) due to dangle.")
						}}
					}}
				'''

			struct_methods += '\n' + current_replacement + '\n'

		if struct_details.is_transparent:
			for current_field in struct_details.fields:
				current_field_name = current_field['name']
				current_field_type = current_field['field_details']
				value_return_wrappers = ConversionHelper.prepare_return_value(current_field_type)
				current_swift_return_type = value_return_wrappers['swift_type']
				current_method_name = f'get_{current_field_name}'

				current_replacement = method_template
				current_replacement = current_replacement.replace('return OpaqueStructType_methodName(native_arguments)',
																  f'return {value_return_wrappers["prefix"]}self.cOpaqueStruct!.{current_field_name}{value_return_wrappers["suffix"]}')
				current_replacement = current_replacement.replace('func methodName(swift_arguments)', f'func {current_method_name}()')
				current_replacement = current_replacement.replace('/* NATIVE_CALL_PREP */', '')
				current_replacement = current_replacement.replace('-> Void {', f'-> {current_swift_return_type} {{')
				struct_methods += '\n' + current_replacement + '\n'

		mutating_output_file_contents = mutating_output_file_contents.replace('class OpaqueStructName: NativeTypeWrapper', f'class {swift_struct_name}: NativeTypeWrapper')
		mutating_output_file_contents = mutating_output_file_contents.replace('init(pointer: OpaqueStructType', f'init(pointer: {struct_name}')
		mutating_output_file_contents = mutating_output_file_contents.replace('var cOpaqueStruct: OpaqueStructType?', f'var cOpaqueStruct: {struct_name}?')
		mutating_output_file_contents = method_template_regex.sub(f'\g<1>{struct_methods}\g<3>', mutating_output_file_contents)

		# store the output
		output_path = f'{Config.OUTPUT_DIRECTORY_PATH}/structs/{swift_struct_name}.swift'
		output_directory = os.path.dirname(output_path)
		if not os.path.exists(output_directory):
			os.makedirs(output_directory)
		with open(output_path, "w") as f:
			f.write(mutating_output_file_contents)
