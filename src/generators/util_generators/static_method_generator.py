import re

from src.generators.util_generators import UtilGenerator
from src.conversion_helper import ConversionHelper


class StaticMethodGenerator(UtilGenerator):

	def __init__(self) -> None:
		super().__init__()
		self.template_regex = re.compile("(\/\* STATIC_METHODS_START \*\/\n)(.*)(\n[\t ]*\/\* STATIC_METHODS_END \*\/)", flags=re.MULTILINE | re.DOTALL)
		self.loadTemplate()
		self.raw_tuple_generators = {}

	def generate_static_methods(self, static_methods):
		genes = self.raw_tuple_generators
		for current_method in static_methods:

			native_method_name = current_method['name']['native']
			swift_method_name = current_method['name']['swift']
			method_name = 'swift_' + swift_method_name

			if swift_method_name.startswith('_'):
				method_name = 'swift' + swift_method_name

			if native_method_name == 'get_route':
				# continue
				pass

			arguments = ConversionHelper.prepare_swift_to_native_arguments(current_method['argument_types'], False)
			return_wrappers = ConversionHelper.prepare_return_value(current_method['return_type'], False)

			swift_argument_list = ', '.join(arguments['swift_arguments'])
			swift_return_type = return_wrappers['swift_type']

			current_method_replacement = self.template
			current_method_replacement = current_method_replacement.replace('swift_arguments', swift_argument_list)
			current_method_replacement = current_method_replacement.replace('-> Void {', f'-> {swift_return_type} {{')
			current_method_replacement = current_method_replacement.replace('func methodName(', f'func {method_name}(')
			deprecation_prefix = ''

			cloneability_print = ''
			if len(arguments['non_cloneable_argument_indices_passed_by_ownership']) > 0:
				cloneability_warning = 'Non-cloneable types passed by ownership. Here be dragons!'
				deprecation_prefix = '#warning("This method passes non-cloneable objects by owned value. Here be dragons.")\n@available(*, deprecated, message: "This method passes non-cloneable objects by owned value. Here be dragons.")\n'
				cloneability_types = []
				for affected_argument_index in arguments['non_cloneable_argument_indices_passed_by_ownership']:
					cloneability_types.append(f'{current_method["argument_types"][affected_argument_index].var_name} ({affected_argument_index})')
				cloneability_type_message = '; '.join(cloneability_types)
				print(f'(static_method_generator.py, warned, deprecated) {cloneability_warning}: {native_method_name} [{cloneability_type_message}]')

				# cloneability_types = []
				# for affected_argument_index in arguments['non_cloneable_argument_indices_passed_by_ownership']:
				# 	swift_argument_index = affected_argument_index + len(arguments['swift_arguments']) - len(current_method['argument_types'])
				# 	swift_argument_message = arguments['swift_arguments'][swift_argument_index] + f' ({swift_argument_index})'
				# 	cloneability_types.append(swift_argument_message)
				# cloneability_type_message = '; '.join(cloneability_types)
				# cloneability_print = f'print("DANGER! Non-cloneable types passed by ownership. Affected arguments: [{cloneability_type_message}]")\n'
				current_method_replacement = current_method_replacement.replace('public class func ', f'{deprecation_prefix}public class func ')
			native_arguments = arguments['native_arguments']
			default_return_prefix = 'return '
			if current_method['return_type'].swift_type == 'Void':
				default_return_prefix = ''

			current_method_replacement = current_method_replacement.replace('/* STATIC_METHOD_BODY */', f'''
				{cloneability_print}{arguments['native_call_prep']}
				{default_return_prefix}{arguments['native_call_prefix']}
				{return_wrappers['prefix']}{native_method_name}({', '.join(native_arguments)}){return_wrappers['suffix']}
				{arguments['native_call_suffix']}
			''')
			self.filled_template += current_method_replacement + "\n"
