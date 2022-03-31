import re
import os
import sys

directory_path = os.path.dirname(os.path.realpath(__file__))
file_path = f'{directory_path}/LDKSwift/Package.swift'
if len(sys.argv) != 2:
	sys.exit('Usage: python3 toggle_address_sanitation_library.py [on/off]')

if not os.path.isfile(file_path):
	sys.exit(f'Package.swift file is missing')

should_enable_string = sys.argv[1]
if not should_enable_string.lower() in ['on', 'off']:
	sys.exit(f'{should_enable_string} is not a valid on/off value')

should_enable = True if should_enable_string.lower() == 'on' else False

file_in = open(file_path, 'rt', encoding='utf-8')
original_contents = file_in.read()
file_in.close()

regex = re.compile("(\/\/)?([^\S\r\n]*)(\.linkedLibrary\(String\(utf8String: getenv\(\"LLVM_CLANG_ASAN_PATH\"\)!\)!\))", re.MULTILINE)
matches = regex.search(original_contents)

comment_prefix = ''
if not should_enable:
	comment_prefix = '//'

toggle_result = regex.sub(f'\g<2>{comment_prefix}\g<3>', original_contents)

file_out = open(file_path, 'wt', encoding='utf-8')
file_out.write(toggle_result)
file_out.close()
