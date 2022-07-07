import os
import sys


class LibldkBuildConfiguration:
	def __init__(self, platform: str, llvm_target_triple_suffix: str, architectures: [str]):
		self.platform = platform
		self.llvm_target_triple_suffix = llvm_target_triple_suffix
		self.architectures = architectures


class BuildConfig:
	def __init__(self):
		self.LDK_C_BINDINGS_BASE: str = ''
		self.LDK_C_BINDINGS_DIRECTORY: str = ''
		self.LIBLDK_BUILD_CONFIGURATIONS: [LibldkBuildConfiguration] = []
		self.CONFIGURATION: str = ''
		self.RUST_CONFIGURATION: str = ''
		self.RUST_CONFIGURATION_FLAG: str = ''

	@classmethod
	def parse(cls, allow_ldk_argument=True, parse_configuration=False):

		ldk_directory_string = os.getenv('LDK_C_BINDINGS_BASE')
		if allow_ldk_argument and len(sys.argv) > 1:
			ldk_directory_string = sys.argv[1]

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

		config = BuildConfig()
		config.LDK_C_BINDINGS_BASE = ldk_directory
		config.LDK_C_BINDINGS_DIRECTORY = c_bindings_directory

		if parse_configuration:
			config.CONFIGURATION = os.getenv('CONFIGURATION')
			if config.CONFIGURATION == 'Debug':
				config.RUST_CONFIGURATION = 'debug'
				config.RUST_CONFIGURATION_FLAG = ''
			else:
				config.RUST_CONFIGURATION = 'release'
				config.RUST_CONFIGURATION_FLAG = '--release'

		return config
