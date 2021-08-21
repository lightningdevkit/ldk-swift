import re
import os

from src.config import Config
from src.type_parsing_regeces import TypeParsingRegeces
from src.conversion_helper import ConversionHelper


class OptionGenerator:

	def __init__(self) -> None:
		super().__init__()
		template_path = f'{os.path.dirname(__file__)}/../../templates/OptionTemplate.swift'
		with open(template_path, 'r') as template_handle:
			template = template_handle.read()
			self.template = template

	def generate_option(self, struct_name, struct_details, all_type_details={}):
		# method_names = ['openChannel', 'closeChannel']
		# native_method_names = ['ChannelHandler_openChannel', 'ChannelHandler_closeChannel']

		swift_struct_name = struct_name[3:]
		is_binary_option = False
		if swift_struct_name.startswith('COption'):
			is_binary_option = True
			swift_struct_name = struct_name[4:]

		typed_class_names = []
		typed_class_details = {}

		option_value_details = struct_details.option_value_type

		mutating_output_file_contents = self.template

		# CONSTRUCTOR START
		if not is_binary_option:
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
				mutating_output_file_contents = mutating_output_file_contents.replace('self.cOpaqueStruct = OptionType(', f'self.cOpaqueStruct = {constructor_native_name}(')
			else:
				# remove the default constructor template
				constructor_template_regex = re.compile("(\/\* DEFAULT_CONSTRUCTOR_START \*\/\n)(.*)(\n[\t ]*\/\* DEFAULT_CONSTRUCTOR_END \*\/)", flags=re.MULTILINE | re.DOTALL)
				mutating_output_file_contents = constructor_template_regex.sub('', mutating_output_file_contents)

		# REGULAR METHODS START

		method_template_regex = re.compile("(\/\* OPTION_METHODS_START \*\/\n)(.*)(\n[\t ]*\/\* OPTION_METHODS_END \*\/)", flags=re.MULTILINE | re.DOTALL)
		method_template = method_template_regex.search(mutating_output_file_contents).group(2)

		method_prefix = swift_struct_name + '_'
		struct_methods = ''

		if is_binary_option:
			current_method_name = 'getValue'

			# TODO: make some/none-ordering-agnostic!
			some_variant_name = option_value_details[0].tag_value  # var_name
			none_variant_name = option_value_details[1].var_name
			field_details = option_value_details[0].fields[0]

			assert field_details.var_name == 'some'

			raw_rust_type = field_details.rust_obj
			swift_type = field_details.swift_type
			nullable_swift_type = swift_type + '?'

			native_conversion_prefix = ''
			native_conversion_suffix = ''
			swift_local_conversion_prefix = ''
			swift_local_conversion_suffix = ''

			if raw_rust_type == 'LDK' + swift_type:
				native_conversion_prefix = ''
				native_conversion_suffix = '.cOpaqueStruct!'
				swift_local_conversion_prefix = f'{swift_type}(pointer: '
				swift_local_conversion_suffix = ')'

			# DEFAULT CONSTRUCTOR

			mutating_output_file_contents = mutating_output_file_contents.replace('swift_constructor_arguments', f'value: {nullable_swift_type}')
			mutating_output_file_contents = mutating_output_file_contents.replace('self.cOpaqueStruct = OptionType(native_constructor_arguments)', '')
			mutating_output_file_contents = mutating_output_file_contents.replace('/* NATIVE_CONSTRUCTOR_PREP */', f'''
				self.cOpaqueStruct = {struct_name}()
				if let value = value {{
					self.cOpaqueStruct!.tag = {some_variant_name}
					self.cOpaqueStruct!.some = {native_conversion_prefix}value{native_conversion_suffix}
				}} else {{
					self.cOpaqueStruct!.tag = {none_variant_name}
				}}
			''')

			# GET VALUE METHOD
			current_replacement = method_template
			current_replacement = current_replacement.replace('return OptionType_methodName(native_arguments);', '')
			current_replacement = current_replacement.replace('methodName', current_method_name)
			current_replacement = current_replacement.replace('swift_arguments', '')
			current_replacement = current_replacement.replace('-> Void', '-> ' + nullable_swift_type)
			current_replacement = current_replacement.replace('/* NATIVE_CALL_PREP */', f'''
			
				if self.cOpaqueStruct!.tag == {none_variant_name} {{
						return nil
				}}
				if self.cOpaqueStruct!.tag == {some_variant_name} {{
					return {swift_local_conversion_prefix}self.cOpaqueStruct!.some{swift_local_conversion_suffix}
				}}
				assert(false, "invalid option enum value")
				return nil
			''')

			struct_methods += '\n' + current_replacement + '\n'
		else:
			swift_enum_type_name = swift_struct_name + 'ValueType'
			enum_value_types = []
			enum_switch_cases = ''
			value_getters = ''
			for current_option_details in option_value_details:
				native_tag_value: str = current_option_details.tag_value
				if not native_tag_value:
					continue
				swift_tag_value = native_tag_value.replace(struct_name + '_', '')
				getter_body = 'return nil'
				value_type_name = current_option_details.container_type_name
				return_type = value_type_name
				if not current_option_details.tuple_variant:
					typed_class_names.append(swift_tag_value)
					return_type = swift_tag_value
					typed_class_details[swift_tag_value] = current_option_details
					getter_body = f'return {swift_tag_value}(pointer: self.cOpaqueStruct!.{current_option_details.var_name})'
				else:
					assert (len(current_option_details.fields) == 1)
					return_body_details = self.prepare_return_body(current_option_details.fields[0])
					return_type = return_body_details['return_type']
					getter_body = return_body_details['body']
					# print('Tuple variant:', struct_name, swift_struct_name, swift_tag_value)

				enum_value_types.append(swift_tag_value)
				enum_switch_cases += f'\n\t\t\t\t\tcase {native_tag_value}:\n\t\t\t\t\t\treturn .{swift_tag_value}'
				current_value_getter = f'''
					public func getValueAs{swift_tag_value}() -> {return_type}? {{
						if self.cOpaqueStruct?.tag != {native_tag_value} {{
							return nil
						}}
						{getter_body}
					}}
				'''
				value_getters += current_value_getter

			enum_value_list_string = ', '.join(enum_value_types)
			struct_methods += f'''
				public enum {swift_enum_type_name} {{
					case {enum_value_list_string}
				}}
				
				public func getValueType() -> {swift_enum_type_name}? {{
					switch self.cOpaqueStruct?.tag {{
                    {enum_switch_cases}
                    default:
                        return nil
                    }}
				}}
				
				{value_getters}
			'''  # print('here we are')

		# fill templates
		method_iterator = struct_details.methods
		if struct_details.free_method is not None:
			method_iterator.append(struct_details.free_method)

		for current_method_details in method_iterator:
			current_native_method_name = current_method_details['name']['native']
			current_method_name = current_method_details['name']['swift']
			current_return_type = current_method_details['return_type'].swift_type
			# current_rust_return_type = current_method_details['return_type'].rust_obj

			# if current_rust_return_type in all_type_details and all_type_details[current_rust_return_type].type.name == 'UNITARY_ENUM':
			# 	current_return_type = current_rust_return_type
			# current_method_name = current_native_method_name[len(method_prefix):]

			current_replacement = method_template
			is_clone_method = current_method_details['is_clone']
			is_free_method = current_method_details['is_free']

			force_pass_instance = False
			if len(current_method_details['argument_types']) == 1:
				if current_method_details['argument_types'][0].swift_type == swift_struct_name:
					force_pass_instance = True



			value_return_wrappers = ConversionHelper.prepare_return_value(current_method_details['return_type'], False)
			current_replacement = current_replacement.replace('return OptionType_methodName(native_arguments)',
										f'return {value_return_wrappers["prefix"]}OptionType_methodName(native_arguments){value_return_wrappers["suffix"]}')


			# if is_clone_method:
			# 	current_replacement = current_replacement.replace('OptionType_methodName(', f'{swift_struct_name}(pointer: {current_native_method_name}(')
			# else:
			# 	current_replacement = current_replacement.replace('OptionType_methodName(', f'{current_native_method_name}(')
			# replace arguments


			prepared_arguments = ConversionHelper.prepare_swift_to_native_arguments(current_method_details['argument_types'], False, force_pass_instance, is_free_method)
			static_infix = 'class ' if prepared_arguments['static_eligible'] else ''

			if len(prepared_arguments['non_cloneable_argument_indices_passed_by_ownership']) > 0:
				cloneability_warning = 'Non-cloneable types passed by ownership. Here be dragons!'
				print(f'/// {cloneability_warning}: {current_native_method_name}')

			current_replacement = current_replacement.replace('func methodName(', f'{static_infix}func {current_method_name}(')
			current_replacement = current_replacement.replace('OptionType_methodName(native_arguments)', prepared_arguments['native_call_prefix'] + 'OptionType_methodName(' + ', '.join(prepared_arguments['native_arguments']) + ')' + prepared_arguments['native_call_suffix'])
			current_replacement = current_replacement.replace('OptionType_methodName(', f'{current_native_method_name}(')
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
							print("Freeing {swift_struct_name} \(self.instanceNumber).")
							self.{current_method_name}()
						}} else {{
							print("Not freeing {swift_struct_name} \(self.instanceNumber) due to dangle.")
						}}
					}}
				'''

			struct_methods += '\n' + current_replacement + '\n'

		mutating_output_file_contents = mutating_output_file_contents.replace('class OptionName: NativeTypeWrapper', f'class {swift_struct_name}: NativeTypeWrapper')
		mutating_output_file_contents = mutating_output_file_contents.replace('init(pointer: OptionType', f'init(pointer: {struct_name}')
		mutating_output_file_contents = mutating_output_file_contents.replace('var cOpaqueStruct: OptionType?', f'var cOpaqueStruct: {struct_name}?')
		mutating_output_file_contents = method_template_regex.sub(f'\g<1>{struct_methods}\g<3>', mutating_output_file_contents)

		if len(typed_class_names) > 0:
			type_class_string = ''
			for current_class_name in typed_class_names:
				class_output = self.generate_type_class(swift_struct_name, current_class_name, typed_class_details[current_class_name])
				type_class_string += '\n' + class_output
			mutating_output_file_contents = mutating_output_file_contents.replace('/* TYPE_CLASSES */', type_class_string)

		# store the output
		output_path = f'{Config.OUTPUT_DIRECTORY_PATH}/options/{swift_struct_name}.swift'
		output_directory = os.path.dirname(output_path)
		if not os.path.exists(output_directory):
			os.makedirs(output_directory)
		with open(output_path, "w") as f:
			f.write(mutating_output_file_contents)

	def generate_type_class(self, parent_class_name, class_name, class_details) -> str:
		native_pointer_type = class_details.container_type_name

		extension_suffix = ''
		pointer_constructor = ''
		is_tuple_variant = class_details.tuple_variant
		assert (is_tuple_variant == False)
		if is_tuple_variant:
			extension_suffix = ': ' + parent_class_name
		else:
			pointer_constructor = f'''
				var cOpaqueStruct: {native_pointer_type}?;
				fileprivate init(pointer: {native_pointer_type}) {{
					self.cOpaqueStruct = pointer
				}}
			'''

		value_getters = ''
		for current_field in class_details.fields:
			return_body_details = self.prepare_return_body(current_field)
			var_name: str = current_field.var_name
			swift_var_name = var_name[0].upper() + var_name[1:]
			return_body = return_body_details['body']
			if class_name == 'SegWitProgram' and var_name == 'version':
				return_body += '._0'  # one-time LDKu5 exception
			current_value_getter = f'''
					public func get{swift_var_name}() -> {return_body_details['return_type']} {{
						{return_body}
					}}
				'''
			value_getters += current_value_getter

		return f'''
			public class {class_name}{extension_suffix} {{
				
				{pointer_constructor}
				
				{value_getters}
				
			}}
		'''

	def prepare_return_body(self, type_details):
		current_return_type = type_details
		current_swift_return_type = current_return_type.swift_type
		# current_rust_return_type = current_method_details['return_type'].rust_obj

		# if current_rust_return_type in all_type_details and all_type_details[current_rust_return_type].type.name == 'UNITARY_ENUM':
		# 	current_return_type = current_rust_return_type

		current_replacement = 'return self.cOpaqueStruct!.varName'
		is_clone_method = False

		if current_return_type.rust_obj is not None and current_return_type.rust_obj.startswith('LDK') and current_return_type.swift_type.startswith('['):
			return_type_wrapper_prefix = f'Bindings.{current_return_type.rust_obj}_to_array(nativeType: '
			return_type_wrapper_suffix = ')'
			current_replacement = current_replacement.replace('return self.cOpaqueStruct!.varName', f'return {return_type_wrapper_prefix}self.cOpaqueStruct!.varName{return_type_wrapper_suffix}')
		elif current_return_type.swift_raw_type.startswith('(UInt8'):
			# TODO: get array length
			array_length = current_return_type.arr_len
			return_type_wrapper_prefix = f'Bindings.tuple{array_length}_to_array(nativeType: '
			return_type_wrapper_suffix = ')'
			current_replacement = current_replacement.replace('return self.cOpaqueStruct!.varName', f'return {return_type_wrapper_prefix}self.cOpaqueStruct!.varName{return_type_wrapper_suffix}')
		elif current_return_type.rust_obj == 'LDK' + current_return_type.swift_type and not is_clone_method:
			return_type_wrapper_prefix = f'{current_return_type.swift_type}(pointer: '
			return_type_wrapper_suffix = ')'
			if current_return_type.is_const:
				return_type_wrapper_suffix = '.pointee)'
			current_replacement = current_replacement.replace('return self.cOpaqueStruct!.varName', f'return {return_type_wrapper_prefix}self.cOpaqueStruct!.varName{return_type_wrapper_suffix}')
		elif current_return_type.rust_obj == 'LDKC' + current_return_type.swift_type and not is_clone_method:
			return_type_wrapper_prefix = f'{current_return_type.swift_type}(pointer: '
			# return_type_wrapper_suffix = '.pointee)'
			return_type_wrapper_suffix = ')'
			current_replacement = current_replacement.replace('return self.cOpaqueStruct!.varName', f'return {return_type_wrapper_prefix}self.cOpaqueStruct!.varName{return_type_wrapper_suffix}')
		elif current_return_type.swift_type == 'String':
			current_replacement = current_replacement.replace('return self.cOpaqueStruct!.varName', 'return Bindings.LDKStr_to_string(nativeType: self.cOpaqueStruct!.varName)')

		if current_return_type.rust_obj is None and current_return_type.swift_type.startswith('['):
			current_replacement = current_replacement.replace('self.cOpaqueStruct!.varName', 'self.cOpaqueStruct!.varName.pointee')
		elif current_return_type.rust_obj is None and current_return_type.swift_type == 'UInt8':
			# current_replacement = current_replacement.replace('self.cOpaqueStruct!.varName', 'self.cOpaqueStruct!.varName._0')
			pass

		if current_return_type.rust_obj is None and current_return_type.swift_type.startswith('['):
			# current_swift_return_type = current_return_type.swift_raw_type
			pass

		# if current_swift_return_type == '[TransactionOutputs]':
		# 	current_swift_return_type = '[LDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ]'
		# elif current_swift_return_type == '[Txid]':
		# 	current_swift_return_type = '[LDKThirtyTwoBytes]'

		if TypeParsingRegeces.WRAPPER_TYPE_ARRAY_BRACKET_REGEX.search(current_swift_return_type):
			prefix = 'LDK'
			if current_return_type.rust_obj.startswith('LDKCVec_CResult'):
				print(current_return_type.rust_obj)
				prefix = 'LDKC'
			current_swift_return_type = TypeParsingRegeces.WRAPPER_TYPE_ARRAY_BRACKET_REGEX.sub('[' + prefix, current_swift_return_type)

		current_replacement = current_replacement.replace('self.cOpaqueStruct!.varName', f'self.cOpaqueStruct!.{type_details.var_name}')
		return {"return_type": current_swift_return_type, "body": current_replacement}
