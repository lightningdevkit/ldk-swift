import os


class Config:
	# Path to the C header file to parse, typically lightning.h
	HEADER_FILE_PATH = f'{os.path.dirname(__file__)}/../input/lightning.h'
	# HEADER_FILE_PATH = f'{os.path.dirname(__file__)}/../input/minimal_opaque_struct.h'
	# HEADER_FILE_PATH = f'{os.path.dirname(__file__)}/../input/minimal_tuple.h'
	# HEADER_FILE_PATH = f'{os.path.dirname(__file__)}/../input/minimal_ping.h'

	OUTPUT_DIRECTORY_PATH = f'{os.path.dirname(__file__)}/../bindings/LDK'
