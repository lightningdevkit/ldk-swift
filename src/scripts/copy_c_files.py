import os.path
import subprocess

from script_config import ScriptConfig


def run(config: ScriptConfig):
	header_directories = [
		os.path.join(config.LDK_C_BINDINGS_DIRECTORY, 'include'),
		os.path.join(config.LDK_C_BINDINGS_BASE, 'ldk-net'),
	]

	c_file_destination_directory = config.C_FILE_OUTPUT_DIRECTORY
	header_destination_directory = config.H_FILE_OUTPUT_DIRECTORY
	os.makedirs(c_file_destination_directory, exist_ok=True)
	os.makedirs(header_destination_directory, exist_ok=True)

	if c_file_destination_directory != header_destination_directory:
		print('Copying C files to', c_file_destination_directory)
	print('Copying headers to', header_destination_directory)

	for current_directory in header_directories:
		for current_file in os.listdir(current_directory):

			is_header_file = current_file.endswith('.h')
			is_c_file = current_file.endswith('.c')

			is_relevant_file = is_header_file or is_c_file
			if not is_relevant_file:
				continue

			current_path = os.path.join(current_directory, current_file)
			if not os.path.isfile(current_path):
				continue

			current_destination_directory = header_destination_directory
			if is_c_file:
				current_destination_directory = c_file_destination_directory

			print('Copying', current_path)
			subprocess.check_call(['cp', current_path, current_destination_directory])


if __name__ == '__main__':
	script_config = ScriptConfig.parse(allow_ldk_argument=True, parse_as_xcode_invocation=True)
	run(script_config)
