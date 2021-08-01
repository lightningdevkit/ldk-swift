import os

directory_path = os.path.dirname(os.path.realpath(__file__))
header_directory = f'{directory_path}/LDKSwift/Sources/LDKSwift'

swift_files = []

# Create a collection of local header (or C) files
for current_directory, current_subdirectories, current_files in os.walk(header_directory):
	for current_file in current_files:
		if not current_file.endswith('.swift'):
			continue
		swift_files.append({'name': current_file, 'path': os.path.join(current_directory, current_file)})

for current_swift_file in swift_files:
	file_name = current_swift_file['name']
	path = current_swift_file['path']

	file_in = open(path, 'rt', encoding='utf-8')
	original_contents = file_in.read()
	file_in.close()

	fixed_contents = original_contents

	if 'import LDKHeaders' not in original_contents:
		if 'import Foundation' in original_contents:
			fixed_contents = original_contents.replace('import Foundation', 'import Foundation\nimport LDKHeaders')
		else:
			fixed_contents = f'import LDKHeaders\n\n{original_contents}'

	if fixed_contents != original_contents:
		# Only save updated file if a change occurred
		file_out = open(path, 'wt')
		file_out.write(fixed_contents)
		file_out.close()

