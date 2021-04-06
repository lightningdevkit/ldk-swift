from lightning_header_parser import LightningHeaderParser
from generators.opaque_struct_generator import OpaqueStructGenerator
from generators.tuple_generator import TupleGenerator
from generators.vector_generator import VectorGenerator


def parse_header() -> LightningHeaderParser:
	header_file = LightningHeaderParser.get_file()

	header_parser = LightningHeaderParser()
	header_parser.parse_header_file(header_file)
	return header_parser


def generate_binding_methods(parser: LightningHeaderParser):
	# firstly, let's generate the vector utilities
	vector_generator = VectorGenerator()

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
		opaque_struct_generator.generate_opaque_struct(current_struct, current_struct_details)


def generate_tuple_wrappers(parser: LightningHeaderParser):
	tuple_generator = TupleGenerator()

	tuples = parser.tuple_types
	for current_tuple in tuples:
		current_tuple_details = parser.type_details[current_tuple]
		tuple_generator.generate_tuple(current_tuple, current_tuple_details)


def generate_sdk():
	parser = parse_header()
	generate_binding_methods(parser)
	generate_opaque_struct_wrappers(parser)
	generate_tuple_wrappers(parser)


generate_sdk()
