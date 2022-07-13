import os
import sys


class BuildConfig:
	def __init__(self, platform: str, llvm_target_triple_suffix: str, architectures: [str]):
		self.platform = platform
		self.llvm_target_triple_suffix = llvm_target_triple_suffix
		self.architectures = architectures

		if not self.platform:
			self.platform = 'macosx'

		self.human_readable_platform = self.platform
		if self.platform == 'macosx' and llvm_target_triple_suffix == '-macabi':
			self.human_readable_platform = 'catalyst'


class ArchiveConfig:
	def __init__(self, destination: str, human_readable_platform: str):
		self.destination = destination
		self.human_readable_platform = human_readable_platform


class ScriptConfig:
	def __init__(self):
		self.LDK_C_BINDINGS_BASE: str = ''
		self.LDK_C_BINDINGS_DIRECTORY: str = ''
		self.LIBLDK_BUILD_CONFIGURATIONS: [BuildConfig] = []
		self.XCARCHIVE_GENERATION_CONFIGURATIONS: [ArchiveConfig] = []
		self.CONFIGURATION: str = ''
		self.RUST_CONFIGURATION: str = ''
		self.RUST_CONFIGURATION_FLAG: str = ''
		self.LIPO_BINARY_OUTPUT_DIRECTORY: str = ''
		self.C_FILE_OUTPUT_DIRECTORY: str = ''
		self.H_FILE_OUTPUT_DIRECTORY: str = ''
		self.PRESERVE_XCARCHIVES: bool = False

	@classmethod
	def parse(cls, allow_ldk_argument=True, parse_configuration=False, parse_lipo_output_directory=False, parse_as_xcode_invocation=False, parse_xcarchive_preservation=False):

		should_preserve_xcarchives = False
		if parse_xcarchive_preservation:
			preserve_xcarchives = os.getenv('PRESERVE_XCARCHIVES')
			if preserve_xcarchives and preserve_xcarchives.strip().lower() in ['1', 'true']:
				should_preserve_xcarchives = True

		ldk_directory_string = os.getenv('LDK_C_BINDINGS_BASE')
		if allow_ldk_argument and len(sys.argv) > 1:
			ldk_directory_string = sys.argv[1]

		if not ldk_directory_string:
			# if xcarchives are preserved, we don't need an LDK_C_BINDINGS_BASE
			print('Missing LDK C-bindings base directory. Either run command with the value or set the environment variable.', file=sys.stderr)
			print(f'Example usage: \npython3 {sys.argv[0]} /path/to/ldk-c-bindings')
			if not should_preserve_xcarchives:
				sys.exit(1)
			else:
				print('Ignoring because PRESERVE_XCARCHIVES is true.')

		ldk_directory = os.path.realpath(ldk_directory_string)
		c_bindings_directory = os.path.join(ldk_directory, 'lightning-c-bindings')

		print('ldk_directory_string (LDK_C_BINDINGS_BASE):', ldk_directory_string)
		print('ldk_directory:', ldk_directory)
		print('c_bindings_directory (LDK_C_BINDINGS_DIRECTORY):', c_bindings_directory)

		if not os.path.exists(c_bindings_directory):
			print('LDK C-bindings directory does not contain lightning-c-bindings:', c_bindings_directory, file=sys.stderr)
			if not should_preserve_xcarchives:
				sys.exit(1)
			else:
				print('Ignoring because PRESERVE_XCARCHIVES is true.')

		if not os.path.isdir(c_bindings_directory):
			print('lightning-c-bindings is not a directory', file=sys.stderr)
			if not should_preserve_xcarchives:
				sys.exit(1)
			else:
				print('Ignoring because PRESERVE_XCARCHIVES is true.')

		config = ScriptConfig()
		config.LDK_C_BINDINGS_BASE = ldk_directory
		config.LDK_C_BINDINGS_DIRECTORY = c_bindings_directory
		config.PRESERVE_XCARCHIVES = should_preserve_xcarchives

		if parse_configuration:
			config.CONFIGURATION = os.getenv('CONFIGURATION')
			if config.CONFIGURATION == 'Debug':
				config.RUST_CONFIGURATION = 'debug'
				config.RUST_CONFIGURATION_FLAG = ''
			else:
				config.RUST_CONFIGURATION = 'release'
				config.RUST_CONFIGURATION_FLAG = '--release'

		if parse_lipo_output_directory:
			config.LIPO_BINARY_OUTPUT_DIRECTORY = os.getenv('LDK_C_BINDINGS_BINARY_DIRECTORY')

		if parse_as_xcode_invocation:
			# this script is being called from xcode
			# that means we might get a PROJECT_DIR and a PLATFORM, ARCHS, etc.

			# parse C file destination directory
			config.C_FILE_OUTPUT_DIRECTORY = os.path.join(os.path.dirname(__file__), '../../xcode/LDKFramework/headers')
			project_directory = os.getenv('PROJECT_DIR')
			if project_directory:
				config.C_FILE_OUTPUT_DIRECTORY = os.path.join(os.path.realpath(project_directory), 'headers')

			# parse build config aspect
			platform = os.getenv('PLATFORM_NAME')
			llvm_target_triple_suffix = os.getenv('LLVM_TARGET_TRIPLE_SUFFIX')
			architecture_input_string = os.getenv('ARCHS')
			if platform and architecture_input_string:
				architectures = architecture_input_string.split(' ')
				ldkBuildConfig = BuildConfig(platform, llvm_target_triple_suffix, architectures)
				config.LIBLDK_BUILD_CONFIGURATIONS = [ldkBuildConfig]

		output_directory_override = os.getenv('C_FILE_OUTPUT_DIRECTORY')
		if output_directory_override:
			config.C_FILE_OUTPUT_DIRECTORY = output_directory_override

		config.H_FILE_OUTPUT_DIRECTORY = config.C_FILE_OUTPUT_DIRECTORY
		header_output_directory_override = os.getenv('H_FILE_OUTPUT_DIRECTORY')
		if header_output_directory_override:
			config.H_FILE_OUTPUT_DIRECTORY = header_output_directory_override

		return config
