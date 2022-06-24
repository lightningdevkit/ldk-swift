import os

import src.conversion_helper
from src.generators.opaque_struct_generator import OpaqueStructGenerator
from src.generators.option_generator import OptionGenerator
from src.generators.result_generator import ResultGenerator
from src.generators.trait_generator import TraitGenerator
from src.generators.tuple_generator import TupleGenerator
from src.generators.util_generators.byte_array_generator import ByteArrayGenerator
from src.generators.util_generators.static_method_generator import StaticMethodGenerator
from src.generators.util_generators.vector_generator import VectorGenerator
from src.generators.util_generators.version_string_generator import VersionStringGenerator
from src.lightning_header_parser import LightningHeaderParser


def parse_header() -> LightningHeaderParser:
	header_file = LightningHeaderParser.get_file()

	header_parser = LightningHeaderParser()
	header_parser.parse_header_file(header_file)
	return header_parser


def generate_binding_methods(parser: LightningHeaderParser):
	# firstly, let's generate the vector utilities
	byte_array_generator = ByteArrayGenerator()
	vector_generator = VectorGenerator()
	static_method_generator = StaticMethodGenerator()
	version_string_generator = VersionStringGenerator()

	byte_arrays = sorted(parser.byte_arrays)
	for current_byte_array_type in byte_arrays:
		byte_array_details = parser.type_details[current_byte_array_type]
		byte_array_generator.generate_byte_array(current_byte_array_type, byte_array_details)
	byte_array_generator.generate_tuple_converter(80)
	byte_array_generator.finalize()

	vectors = sorted(parser.vec_types)
	for current_vector in vectors:
		if current_vector == 'LDKTransaction':
			continue
		vector_type_details = parser.type_details[current_vector]
		vector_generator.generate_vector(current_vector, vector_type_details)
	vector_generator.finalize()

	static_method_generator.generate_static_methods(parser.static_methods)
	static_method_generator.finalize()

	version_string_generator.obtain_version_string()
	version_string_generator.finalize()


def generate_opaque_struct_wrappers(parser: LightningHeaderParser, returned_trait_instances=set()):
	opaque_struct_generator = OpaqueStructGenerator()

	opaque_structs = parser.opaque_structs
	for current_struct in opaque_structs:
		current_struct_details = parser.type_details[current_struct]
		opaque_struct_generator.generate_opaque_struct(
			current_struct,
			current_struct_details,
			all_type_details=parser.type_details,
			trait_structs=parser.trait_structs,
			returned_trait_instances=returned_trait_instances
		)


def generate_tuple_wrappers(parser: LightningHeaderParser):
	tuple_generator = TupleGenerator()

	tuples = parser.tuple_types
	for current_tuple in tuples:
		current_tuple_details = parser.type_details[current_tuple]
		tuple_generator.generate_tuple(current_tuple, current_tuple_details, all_type_details=parser.type_details)


def generate_result_wrappers(parser: LightningHeaderParser):
	result_generator = ResultGenerator()

	results = parser.result_types
	for current_result in results:
		current_result_details = parser.type_details[current_result]
		result_generator.generate_result(current_result, current_result_details, all_type_details=parser.type_details)


def generate_option_wrappers(parser: LightningHeaderParser):
	option_generator = OptionGenerator()

	options = parser.option_types
	for current_option in options:
		current_option_details = parser.type_details[current_option]
		option_generator.generate_option(current_option, current_option_details, all_type_details=parser.type_details)


def generate_trait_placeholders(parser: LightningHeaderParser, returned_trait_instances=set()):
	trait_generator = TraitGenerator()

	traits = parser.trait_structs
	for current_trait in traits:
		current_trait_details = parser.type_details[current_trait]
		trait_generator.generate_trait(current_trait, current_trait_details)


def initialize_conversion_helper_knowledge(parser: LightningHeaderParser):
	src.conversion_helper.ConversionHelper.trait_structs = parser.trait_structs


def generate_sdk():
	returned_trait_instances = set()
	parser = parse_header()

	# initialize_conversion_helper_knowledge(parser)

	generate_binding_methods(parser)
	generate_opaque_struct_wrappers(parser, returned_trait_instances)
	generate_tuple_wrappers(parser)
	generate_result_wrappers(parser)
	generate_option_wrappers(parser)
	generate_trait_placeholders(parser, returned_trait_instances)

	# print('\n\nUtilized cloneable types:\n', '\n '.join(sorted(list(dict.fromkeys(src.conversion_helper.detected_cloneable_types)))), '\n\n')

	undetected_cloneables = src.conversion_helper.cloneable_types - src.conversion_helper.detected_cloneable_types  # print('\n\nUnutilized cloneable types:\n', '\n '.join(sorted(list(dict.fromkeys(undetected_cloneables)))), '\n\n')


def cleanup_bindings():
	directory_path = os.path.dirname(os.path.realpath(__file__))
	header_directory = os.path.realpath(f'{directory_path}/../ci/LDKSwift/Sources/LDKSwift/bindings')
	print("Cleaning up bindings/LDK directory:", header_directory)
	for current_directory, current_subdirectories, current_files in os.walk(header_directory):
		for current_file in current_files:
			if not current_file.endswith('.swift'):
				continue
			current_file_path = os.path.realpath(os.path.join(current_directory, current_file))
			os.remove(current_file_path)
	pass
