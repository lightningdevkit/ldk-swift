import os.path
import subprocess

from script_config import ScriptConfig


def run(config: ScriptConfig):
	header_directories = [
		os.path.join(config.LDK_C_BINDINGS_DIRECTORY, 'include'),
		os.path.join(config.LDK_C_BINDINGS_BASE, 'ldk-net'),
	]

	header_destination_directory = config.C_FILE_OUTPUT_DIRECTORY
	os.makedirs(header_destination_directory, exist_ok=True)

	print('Copying headers to', header_destination_directory)

	for current_directory in header_directories:
		for current_file in os.listdir(current_directory):

			is_relevant_file = current_file.endswith('.h') or current_file.endswith('.c')
			if not is_relevant_file:
				continue

			current_path = os.path.join(current_directory, current_file)
			if not os.path.isfile(current_path):
				continue

			print('Copying', current_path)
			subprocess.check_call(['cp', current_path, header_destination_directory])


if __name__ == '__main__':
	script_config = ScriptConfig.parse(allow_ldk_argument=True, parse_as_xcode_invocation=True)
	run(script_config)
