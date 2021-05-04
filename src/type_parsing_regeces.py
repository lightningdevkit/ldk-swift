import re


class TypeParsingRegeces:
	# variable mapping
	IS_VARIABLE_AN_ARRAY_REGEX = re.compile("\(\*([A-za-z0-9_]*)\)\[([a-z0-9]*)\]")
	IS_VARIABLE_A_FIXED_SIZE_ARRAY_REGEX = re.compile("[a-zA-Z0-9_]+ ([a-zA-Z0-9_]+)\[([1-9][0-9]*)\]")
	VARIABLE_TYPE_REGEX = re.compile("([A-za-z_0-9]*)(.*)")

	# function mapping
	FUNCTION_POINTER_REGEX = re.compile("^extern const ([A-Za-z_0-9\* ]*) \(\*(.*)\)\((.*)\);$")
	FUNCTION_RETURN_ARRAY_REGEX = re.compile("(.*) \(\*(.*)\((.*)\)\)\[([0-9]*)\];$")
	REGULAR_FUNCTION_REGEX = re.compile("(.*) \(\*(.*)\((.*)\)\)\[([0-9]*)\];$")

	# smart conversion
	WRAPPER_TYPE_ARRAY_BRACKET_REGEX = re.compile("\[(?!(LDK|UInt|\[))")
