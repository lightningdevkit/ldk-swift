from lightning_header_parser import LightningHeaderParser
from generators.opaque_struct_generator import OpaqueStructGenerator


def parse_header() -> LightningHeaderParser:
    header_file = LightningHeaderParser.get_file()

    header_parser = LightningHeaderParser()
    header_parser.parse_header_file(header_file)
    return header_parser


def generate_opaque_struct_wrappers(parser: LightningHeaderParser):
    opaque_struct_generator = OpaqueStructGenerator()

    opaque_structs = parser.opaque_structs
    for current_struct in opaque_structs:
        current_struct_details = parser.type_details[current_struct]
        opaque_struct_generator.generate_opaque_struct(current_struct, current_struct_details)


def generate_sdk():
    parser = parse_header()
    generate_opaque_struct_wrappers(parser)

generate_sdk()
