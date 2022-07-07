import os
import subprocess
import sys

import build_individual_libldk
from script_config import ScriptConfig, BuildConfig

CALL_INDIVIDUAL_BUILD_METHOD_VIA_SHELL = False


def parse_config() -> ScriptConfig:
	config = ScriptConfig.parse(allow_ldk_argument=True, parse_configuration=(not CALL_INDIVIDUAL_BUILD_METHOD_VIA_SHELL))

	individual_configurations: [BuildConfig] = [BuildConfig('iphoneos', '', ['arm64']),
												BuildConfig('iphonesimulator', '-simulator', ['arm64', 'x86_64']),
												BuildConfig('macosx', '', ['arm64', 'x86_64']),
												BuildConfig('macosx', '-macabi', ['arm64', 'x86_64']), ]

	config.LIBLDK_BUILD_CONFIGURATIONS = individual_configurations

	return config


def run(config: ScriptConfig):
	child_environment = dict(os.environ)
	child_environment['LDK_C_BINDINGS_BASE'] = config.LDK_C_BINDINGS_BASE
	child_environment['LDK_C_BINDINGS_DIRECTORY'] = config.LDK_C_BINDINGS_DIRECTORY
	individual_libldk_file = os.path.join(os.path.dirname(os.path.realpath(__file__)), 'build_individual_libldk.py')

	libldk_build_configurations = config.LIBLDK_BUILD_CONFIGURATIONS
	for current_build_config in libldk_build_configurations:
		current_platform: str = current_build_config.platform
		current_llvm_target_triple_suffix: str = current_build_config.llvm_target_triple_suffix
		current_architectures: [str] = current_build_config.architectures

		if CALL_INDIVIDUAL_BUILD_METHOD_VIA_SHELL:
			child_environment['PLATFORM'] = current_platform
			child_environment['LLVM_TARGET_TRIPLE_SUFFIX'] = current_llvm_target_triple_suffix
			child_environment['ARCHS'] = ' '.join(current_architectures)

			subprocess.check_call([sys.executable, individual_libldk_file], env=child_environment)
		else:
			current_config_clone = config
			current_config_clone.LIBLDK_BUILD_CONFIGURATIONS = [current_build_config]
			build_individual_libldk.run(config=current_config_clone)


if __name__ == '__main__':
	run(config=parse_config())
