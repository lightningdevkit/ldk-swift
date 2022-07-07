import os
import subprocess
import sys

from build_config import BuildConfig, LibldkBuildConfiguration


def parseConfig() -> BuildConfig:
	ldk_directory_string = sys.argv[1] if len(sys.argv) > 1 else os.getenv('LDK_C_BINDINGS_BASE')
	if not ldk_directory_string:
		print('Missing LDK C-bindings base directory. Either call the value or set the environment variable.')
		sys.exit(1)

	ldk_directory = os.path.realpath(ldk_directory_string)
	c_bindings_directory = os.path.join(ldk_directory, 'lightning-c-bindings')
	if not os.path.exists(c_bindings_directory):
		print('LDK C-bindings directory does not contain lightning-c-bindings')
		sys.exit(1)

	if not os.path.isdir(c_bindings_directory):
		print('lightning-c-bindings is not a directory')
		sys.exit(1)

	individual_configurations: [LibldkBuildConfiguration] = [
		LibldkBuildConfiguration('iphoneos', '', ['arm64']),
		LibldkBuildConfiguration('iphonesimulator', '-simulator', ['arm64', 'x86_64']),
		LibldkBuildConfiguration('macosx', '', ['arm64', 'x86_64']),
		LibldkBuildConfiguration('macosx', '-macabi', ['arm64', 'x86_64']),
	]

	config = BuildConfig()
	config.LDK_C_BINDINGS_BASE = ldk_directory
	config.LDK_C_BINDINGS_DIRECTORY = c_bindings_directory
	config.LIBLDK_BUILD_CONFIGURATIONS = individual_configurations

	return config


config = parseConfig()
child_environment = dict(os.environ)
child_environment['LDK_C_BINDINGS_BASE'] = config.LDK_C_BINDINGS_BASE
child_environment['LDK_C_BINDINGS_DIRECTORY'] = config.LDK_C_BINDINGS_DIRECTORY
individual_libldk_file = os.path.join(os.path.dirname(os.path.realpath(__file__)), 'build_individual_libldk.py')

for current_build_config in config.LIBLDK_BUILD_CONFIGURATIONS:
	current_platform: str = current_build_config.platform
	current_llvm_target_triple_suffix: str = current_build_config.llvm_target_triple_suffix
	current_architectures: [str] = current_build_config.architectures

	child_environment['PLATFORM'] = current_platform
	child_environment['LLVM_TARGET_TRIPLE_SUFFIX'] = current_llvm_target_triple_suffix
	child_environment['ARCHS'] = ' '.join(current_architectures)

	process = subprocess.check_call([sys.executable, individual_libldk_file], env=child_environment)

