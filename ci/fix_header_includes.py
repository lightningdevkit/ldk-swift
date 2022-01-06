import os
import sys

directory_path = os.path.dirname(os.path.realpath(__file__))
default_header_directory = f'{directory_path}/LDKSwift/Sources/LDKHeaders'
header_directory = sys.argv[1] if len(sys.argv) >= 2 else default_header_directory
# header_directory = f'{directory_path}/../xcode/LDKFramework'

if not os.path.exists(header_directory):
	sys.exit(f'Directory "{header_directory}" does not exist')

header_files = []

# Create a collection of local header (or C) files
for current_directory, current_subdirectories, current_files in os.walk(header_directory):
	for current_header_file in current_files:
		current_file_path = os.path.join(current_directory, current_header_file)
		if not os.path.isfile(current_file_path):
			continue

		if not current_header_file.endswith('.h') and not current_header_file.endswith('.c'):
			continue

		header_files.append({'name': current_header_file, 'path': current_file_path})

for current_header_file in header_files:
	file_name = current_header_file['name']
	path = current_header_file['path']

	file_in = open(path, 'rt', encoding='utf-8')
	original_contents = file_in.read()
	file_in.close()

	fixed_contents = original_contents
	for other_header_file in header_files:
		other_file_name = other_header_file['name']
		if other_file_name == file_name:
			continue

		if not other_file_name.endswith('.h'):
			# Only header files are ever imported, even though imports can happen in either header or C files
			continue

		# TODO: use regex to detect multi-space or other whitespace-altered includes and fix them correctly, too
		# Fix each local file's import by replacing angular brackets with quotes
		fixed_contents = fixed_contents.replace(f'#include <{other_file_name}>', f'#include "{other_file_name}"')
	if fixed_contents != original_contents:
		# Only save updated file if a change occurred
		file_out = open(path, 'wt', encoding='utf-8')
		file_out.write(fixed_contents)
		file_out.close()
		print(f'Fixed .h/.c file: {path}')

