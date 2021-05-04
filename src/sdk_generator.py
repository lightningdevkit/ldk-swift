from lightning_header_parser import LightningHeaderParser
from generators.opaque_struct_generator import OpaqueStructGenerator
from generators.tuple_generator import TupleGenerator
from generators.result_generator import ResultGenerator
from generators.option_generator import OptionGenerator
from generators.trait_generator import TraitGenerator
from generators.util_generators.vector_generator import VectorGenerator
from generators.util_generators.byte_array_generator import ByteArrayGenerator


def parse_header() -> LightningHeaderParser:
	header_file = LightningHeaderParser.get_file()

	header_parser = LightningHeaderParser()
	header_parser.parse_header_file(header_file)
	return header_parser


def generate_binding_methods(parser: LightningHeaderParser):
	# firstly, let's generate the vector utilities
	byte_array_generator = ByteArrayGenerator()
	vector_generator = VectorGenerator()

	byte_arrays = parser.byte_arrays
	for current_byte_array_type in byte_arrays:
		byte_array_details = parser.type_details[current_byte_array_type]
		byte_array_generator.generate_byte_array(current_byte_array_type, byte_array_details)
	byte_array_generator.finalize()

	vectors = parser.vec_types
	for current_vector in vectors:
		vector_type_details = parser.type_details[current_vector]
		vector_generator.generate_vector(current_vector, vector_type_details)
	vector_generator.finalize()


def generate_opaque_struct_wrappers(parser: LightningHeaderParser):
	opaque_struct_generator = OpaqueStructGenerator()

	opaque_structs = parser.opaque_structs
	for current_struct in opaque_structs:
		current_struct_details = parser.type_details[current_struct]
		opaque_struct_generator.generate_opaque_struct(current_struct, current_struct_details, all_type_details=parser.type_details)


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


def generate_trait_placeholders(parser: LightningHeaderParser):
	trait_generator = TraitGenerator()

	traits = parser.trait_structs
	for current_trait in traits:
		current_trait_details = parser.type_details[current_trait]
		trait_generator.generate_trait(current_trait, current_trait_details)


def generate_sdk():
	parser = parse_header()
	generate_binding_methods(parser)
	generate_opaque_struct_wrappers(parser)
	generate_tuple_wrappers(parser)
	generate_result_wrappers(parser)
	generate_option_wrappers(parser)
	generate_trait_placeholders(parser)


generate_sdk()
