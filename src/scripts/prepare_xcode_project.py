import os
import sys

from script_config import ScriptConfig
import copy_c_files
import build_individual_libldk



def run(config: ScriptConfig):
	print('Preparing Xcode project…')
	project_directory = os.getenv('PROJECT_DIR')

	bindings_binary_directory = os.getenv('LDK_C_BINDINGS_BINARY_DIRECTORY')
	forced_rebuild_override_directory = os.getenv('LDK_C_BINDINGS_BINARY_FORCED_REBUILD_OUTPUT_DIRECTORY')

	print('PROJECT_DIR:', project_directory)
	print('LDK_C_BINDINGS_BINARY_DIRECTORY:', bindings_binary_directory)
	print('LDK_C_BINDINGS_BINARY_FORCED_REBUILD_OUTPUT_DIRECTORY:', forced_rebuild_override_directory)

	# step 1: copy C files, *.h and *.c
	copy_c_files.run(config)

	if bindings_binary_directory and forced_rebuild_override_directory:
		print('LDK_C_BINDINGS_BINARY_DIRECTORY and LDK_C_BINDINGS_BINARY_FORCED_REBUILD_OUTPUT_DIRECTORY may not both be set at the same time!')
		sys.exit(1)

	if not bindings_binary_directory and not forced_rebuild_override_directory:
		print('One of LDK_C_BINDINGS_BINARY_DIRECTORY and LDK_C_BINDINGS_BINARY_FORCED_REBUILD_OUTPUT_DIRECTORY must be set!')
		sys.exit(1)

	if not forced_rebuild_override_directory:
		print('LDK_C_BINDINGS_BINARY_FORCED_REBUILD_OUTPUT_DIRECTORY not set: binary rebuild not necessary.')
		return

	# if and only if and if only LDK_C_BINDINGS_BINARY_FORCED_REBUILD_OUTPUT_DIRECTORY is set, we build the individual libldk
	config.LIPO_BINARY_OUTPUT_DIRECTORY = forced_rebuild_override_directory
	# TODO: detect if there's already a libldk.a in that directory and then not do the build
	build_individual_libldk.run(config)


if __name__ == '__main__':
	script_config = ScriptConfig.parse(
		allow_ldk_argument=False,
		parse_configuration=True,
		parse_lipo_output_directory=True,
		parse_as_xcode_invocation=True
	)
	run(script_config)
