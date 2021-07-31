import re
import os

from src.config import Config
from src.type_parsing_regeces import TypeParsingRegeces
from src.conversion_helper import ConversionHelper


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

		# swift_struct_name = struct_name[3:] + 'Trait'
		swift_struct_name = struct_name[3:]

		native_callback_template_regex = re.compile(
			"(\/\* NATIVE_CALLBACKS_START \*\/\n)(.*)(\n[\t ]*\/\* NATIVE_CALLBACKS_END \*\/)",
			flags=re.MULTILINE | re.DOTALL)
		native_callback_template = native_callback_template_regex.search(self.template).group(2)

		swift_callback_template_regex = re.compile(
			"(\/\* SWIFT_CALLBACKS_START \*\/\n)(.*)(\n[\t ]*\/\* SWIFT_CALLBACKS_END \*\/)",
			flags=re.MULTILINE | re.DOTALL)
		swift_callback_template = swift_callback_template_regex.search(self.template).group(2)

		natively_implemented_callback_template_regex = re.compile(
			"(\/\* SWIFT_DEFAULT_CALLBACKS_START \*\/\n)(.*)(\n[\t ]*\/\* SWIFT_DEFAULT_CALLBACKS_END \*\/)",
			flags=re.MULTILINE | re.DOTALL)
		natively_implemented_callback_template = natively_implemented_callback_template_regex.search(self.template).group(2)

		method_prefix = swift_struct_name + '_'
		native_callbacks = ''
		swift_callbacks = ''
		default_callbacks = ''

		instantiation_arguments = []

		# fill templates
		for current_lambda in struct_details.lambdas:
			current_lambda_name = current_lambda['name']
			is_clone = current_lambda_name == 'clone'


			if not current_lambda['is_lambda']:
				current_field_details = current_lambda['field_details']
				current_rust_type = current_field_details.rust_obj
				instantiation_arguments.append(f'{current_lambda_name}: {current_rust_type}()')
				continue

			# Temporary misnomer, it's actually supposed to signify optional implementation
			if current_lambda['is_nullable']:
				instantiation_arguments.append(f'{current_lambda_name}: nil')
				continue

			current_swift_callback_replacement = swift_callback_template
			current_swift_callback_replacement = current_swift_callback_replacement.replace('func methodName(',
																							f'func {current_lambda_name}(')

			instantiation_arguments.append(f'{current_lambda_name}: {current_lambda_name}Callback')

			current_return_type_details = current_lambda["return_type"]
			swift_raw_return_type = current_return_type_details.swift_raw_type
			swift_return_type = current_return_type_details.swift_type

			if TypeParsingRegeces.WRAPPER_TYPE_ARRAY_BRACKET_REGEX.search(swift_return_type):
				swift_return_type = TypeParsingRegeces.WRAPPER_TYPE_ARRAY_BRACKET_REGEX.sub('[LDK', swift_return_type)
				swift_raw_return_type = swift_return_type

			return_conversion_prefix = ''
			return_conversion_suffix = ''
			swift_default_return = ''
			# if current_lambda['return_type'].rust_obj is not None and current_lambda['return_type'].rust_obj.startswith(
			# 	'LDK'):
			current_return_type_details = current_lambda['return_type']
			if current_return_type_details.rust_obj is not None and (
				current_return_type_details.rust_obj == 'LDK' + swift_return_type or current_return_type_details.rust_obj == 'LDKC' + swift_return_type):
				swift_raw_return_type = current_return_type_details.rust_obj
				return_conversion_suffix = '.cOpaqueStruct!'
			elif swift_raw_return_type.startswith('(UInt'):
				current_rust_type = current_return_type_details.rust_obj
				return_conversion_prefix = f'Bindings.array_to_tuple{current_return_type_details.arr_len}(array: '
				if current_rust_type is not None:
					swift_raw_return_type = current_rust_type
					return_conversion_prefix = f'Bindings.new_{current_rust_type}(array: '
				return_conversion_suffix = ')'
			elif swift_raw_return_type.startswith('LDK') and swift_return_type.startswith('['):
				return_conversion_prefix = f'Bindings.new_{swift_raw_return_type}(array: '
				return_conversion_suffix = ')'
			elif current_return_type_details.rust_obj is not None and current_return_type_details.rust_obj.startswith('LDK') and swift_raw_return_type.startswith('['):
				swift_raw_return_type = current_return_type_details.rust_obj
				return_conversion_prefix = f'Bindings.new_{swift_raw_return_type}(array: '
				return_conversion_suffix = ')'
			elif current_return_type_details.pass_by_ref and current_lambda_name == 'clone':
				swift_raw_return_type = 'UnsafeMutableRawPointer'
				swift_return_type = swift_raw_return_type

			if swift_return_type.startswith('UInt'):
				swift_default_return = 'return 0'
			if swift_return_type.startswith('Bool'):
				swift_default_return = 'return false'
			if swift_return_type.startswith('UnsafeMutableRawPointer'):
				swift_raw_return_type += '?'
				swift_default_return = 'return UnsafeMutableRawPointer(bitPattern: 0)!'
			elif swift_return_type.startswith('['):
				swift_default_return = f'return {swift_return_type}()'
			elif swift_return_type.startswith('LDK'):
				swift_default_return = f'return {swift_return_type}()'
			elif current_return_type_details.rust_obj is not None and current_return_type_details.rust_obj.startswith('LDK') and not swift_raw_return_type.startswith('['):
				swift_default_return = f'return {swift_return_type}(pointer: {current_return_type_details.rust_obj}())'

			current_native_callback_replacement = native_callback_template
			current_native_callback_replacement = current_native_callback_replacement.replace(
				'func methodNameCallback(', f'func {current_lambda_name}Callback(')
			current_native_callback_replacement = current_native_callback_replacement.replace('instance: TraitName',
																							  f'instance: {swift_struct_name}')
			current_native_callback_replacement = current_native_callback_replacement.replace(
				'instance.callbackName(swift_callback_arguments)',
				f'{return_conversion_prefix}instance.callbackName(swift_callback_arguments){return_conversion_suffix}')
			current_native_callback_replacement = current_native_callback_replacement.replace('instance.callbackName(',
																							  f'instance.{current_lambda_name}(')

			current_native_callback_replacement = current_native_callback_replacement.replace(') -> Void {',
																							  f') -> {swift_raw_return_type} {{')

			# let's get the current native arguments, i. e. the arguments we get from C into the native callback
			swift_argument_string = ''
			swift_callback_prepared_arguments = ConversionHelper.prepare_native_to_swift_callback_arguments(current_lambda['argument_types'])
			native_arguments = swift_callback_prepared_arguments['raw_native_argument_list']
			swift_callback_arguments = swift_callback_prepared_arguments['swift_callback_arguments']
			public_swift_argument_list = swift_callback_prepared_arguments['public_swift_argument_list']
			swift_callback_prep = swift_callback_prepared_arguments['swift_callback_prep']
			if len(native_arguments) > 0:
				# add leading comma
				swift_argument_string = ', '.join(native_arguments)
				native_arguments.insert(0, '')




			# let's create a native default implementation
			default_callback_prepared_arguments = ConversionHelper.prepare_swift_to_native_arguments(current_lambda['argument_types'], True)
			default_callback_return_wrappers = ConversionHelper.prepare_return_value(current_return_type_details, is_clone)
			current_default_callback_replacement = natively_implemented_callback_template
			current_default_callback_replacement = current_default_callback_replacement.replace('public_swift_argument_list', public_swift_argument_list)
			current_default_callback_replacement = current_default_callback_replacement.replace('-> Void {', f'-> {swift_return_type} {{')
			current_default_callback_replacement = current_default_callback_replacement.replace('func methodName(', f'func {current_lambda_name}(')
			default_native_call_arguments = default_callback_prepared_arguments['native_arguments']

			default_native_call_arguments.insert(0, 'self.cOpaqueStruct!.this_arg')
			default_return_prefix = 'return '
			if current_lambda['return_type'].swift_type == 'Void':
				default_return_prefix = ''

			current_default_callback_replacement = current_default_callback_replacement.replace('/* SWIFT_DEFAULT_CALLBACK_BODY */', f'''
				{default_return_prefix}{default_callback_prepared_arguments['native_call_prefix']}
				{default_callback_return_wrappers['prefix']}self.cOpaqueStruct!.{current_lambda_name}({', '.join(default_native_call_arguments)}){default_callback_return_wrappers['suffix']}
				{default_callback_prepared_arguments['native_call_suffix']}
			''')


			native_argument_string = ', '.join(native_arguments)

			current_native_callback_replacement = current_native_callback_replacement.replace(', native_arguments',
																							  native_argument_string)
			current_native_callback_replacement = current_native_callback_replacement.replace(
				'swift_callback_arguments', ', '.join(swift_callback_arguments))
			current_native_callback_replacement = current_native_callback_replacement.replace('/* SWIFT_CALLBACK_PREP */', swift_callback_prep)
			current_native_callback_replacement = current_native_callback_replacement.replace('<sourceMarker>', f'"{swift_struct_name}.swift::{current_lambda_name}"')


			current_swift_callback_replacement = current_swift_callback_replacement.replace('public_swift_argument_list',
																							public_swift_argument_list)
			current_swift_callback_replacement = current_swift_callback_replacement.replace('-> Void {',
																							f'-> {swift_return_type} {{')
			current_swift_callback_replacement = current_swift_callback_replacement.replace('/* EDIT ME */',
																							f'/* EDIT ME */\n\t\t{swift_default_return}')

			if not current_lambda['is_constant']:
				current_native_callback_replacement = current_native_callback_replacement.replace(
					'(pointer: UnsafeRawPointer?', '(pointer: UnsafeMutableRawPointer?')

			native_callbacks += '\n' + current_native_callback_replacement + '\n'
			swift_callbacks += '\n' + current_swift_callback_replacement + '\n'

			if not is_clone: # TODO: add support for natively implemented cloning
				default_callbacks += '\n' + current_default_callback_replacement + '\n'


		for current_method_details in struct_details.methods:
			current_native_method_name = current_method_details['name']['native']

			force_pass_instance = False
			if len(current_method_details['argument_types']) == 1:
				if current_method_details['argument_types'][0].swift_type == swift_struct_name:
					force_pass_instance = True

			value_return_wrappers = ConversionHelper.prepare_return_value(current_method_details['return_type'], False)
			prepared_arguments = ConversionHelper.prepare_swift_to_native_arguments(current_method_details['argument_types'], False, force_pass_instance)

			swift_argument_list = ', '.join(prepared_arguments['swift_arguments'])
			swift_return_type = value_return_wrappers['swift_type']
			native_arguments = prepared_arguments['native_arguments']
			default_return_prefix = 'return '
			if current_method_details['return_type'].swift_type == 'Void':
				default_return_prefix = ''

			current_method_implementation = f'''
				func {current_method_details['name']['swift']}({swift_argument_list}) -> {swift_return_type} {{
					{prepared_arguments['native_call_prep']}
					{default_return_prefix}{prepared_arguments['native_call_prefix']}
					{value_return_wrappers['prefix']}{current_method_details['name']['native']}({', '.join(native_arguments)}){value_return_wrappers['suffix']}
					{prepared_arguments['native_call_suffix']}
				}}
			'''

			swift_callbacks += '\n' + current_method_implementation + '\n'



		trait_file = self.template.replace('class TraitName {', f'class {swift_struct_name} {{')
		trait_file = trait_file.replace('class NativelyImplementedTraitName: TraitName {', f'class NativelyImplemented{swift_struct_name}: {swift_struct_name} {{')
		trait_file = trait_file.replace('init(pointer: TraitType', f'init(pointer: {struct_name}')
		trait_file = trait_file.replace('var cOpaqueStruct: TraitType?',
										f'var cOpaqueStruct: {struct_name}?')
		trait_file = trait_file.replace('self.cOpaqueStruct = TraitType(',
										f'self.cOpaqueStruct = {struct_name}(')
		trait_file = trait_file.replace('native_callback_instantiation_arguments',
										'\n\t\t\t'+',\n\t\t\t'.join(instantiation_arguments))
		trait_file = native_callback_template_regex.sub(f'\g<1>{native_callbacks}\g<3>', trait_file)
		trait_file = swift_callback_template_regex.sub(f'\g<1>{swift_callbacks}\g<3>', trait_file)
		trait_file = natively_implemented_callback_template_regex.sub(f'\g<1>{default_callbacks}\g<3>', trait_file)

		# source_marker_regex =

		# store the output
		output_path = f'{Config.OUTPUT_DIRECTORY_PATH}/traits/{swift_struct_name}.swift'
		output_directory = os.path.dirname(output_path)
		if not os.path.exists(output_directory):
			os.makedirs(output_directory)
		with open(output_path, "w") as f:
			f.write(trait_file)
		pass
