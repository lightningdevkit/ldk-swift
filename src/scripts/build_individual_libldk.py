import os
import subprocess
import sys

from build_config import BuildConfig, LibldkBuildConfiguration


def parseConfig() -> BuildConfig:
	ldk_directory_string = os.getenv('LDK_C_BINDINGS_BASE')
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

	platform = os.getenv('PLATFORM')
	llvm_target_triple_suffix = os.getenv('LLVM_TARGET_TRIPLE_SUFFIX')
	architectures = os.getenv('ARCHS').split(' ')

	ldkBuildConfig = LibldkBuildConfiguration(platform, llvm_target_triple_suffix, architectures)

	config = BuildConfig()
	config.LDK_C_BINDINGS_BASE = ldk_directory
	config.LDK_C_BINDINGS_DIRECTORY = c_bindings_directory
	config.LIBLDK_BUILD_CONFIGURATIONS = [ldkBuildConfig]

	config.CONFIGURATION = os.getenv('CONFIGURATION')
	if config.CONFIGURATION == 'Debug':
		config.RUST_CONFIGURATION = 'debug'
		config.RUST_CONFIGURATION_FLAG = ''
	else:
		config.RUST_CONFIGURATION = 'release'
		config.RUST_CONFIGURATION_FLAG = '--release'

	return config

config = parseConfig()
ldkBuildConfig: LibldkBuildConfiguration = config.LIBLDK_BUILD_CONFIGURATIONS[0]
build_products_directory = os.path.realpath(os.path.join(os.path.dirname(__file__), '../../bindings/bin'))

platform = ldkBuildConfig.platform
llvm_target_triple_suffix = ldkBuildConfig.llvm_target_triple_suffix
architectures = ldkBuildConfig.architectures

human_readable_platform = platform
rust_target_os = 'ios'
if platform == 'macosx' and llvm_target_triple_suffix == '-macabi':
	human_readable_platform = 'catalyst'
	rust_target_os = 'ios-macabi'
elif platform == 'macosx':
	rust_target_os = 'darwin'

print(f'\n\nPlatform name: {platform} ({human_readable_platform})')
print('Configuration:', config.RUST_CONFIGURATION)
print('LLVM Target Triple Suffix:', llvm_target_triple_suffix)

individual_architecture_binary_directory = os.path.join(build_products_directory, config.RUST_CONFIGURATION, human_readable_platform, 'raw')
lipo_binary_directory = os.path.join(build_products_directory, config.RUST_CONFIGURATION, human_readable_platform, 'lipo')
lipo_binary_output_path = os.path.join(lipo_binary_directory, 'libldk.a')

print(individual_architecture_binary_directory)
print(lipo_binary_directory)
os.makedirs(lipo_binary_directory, exist_ok=True)

child_environment = dict(os.environ)
child_environment['RUSTFLAGS'] = '--cfg=c_bindings'

subprocess.check_call(['rustup', 'override', 'set', 'nightly'], cwd=config.LDK_C_BINDINGS_DIRECTORY)

lipo_executables_input: [str] = []

for current_architecture in architectures:
	current_architecture_binary_directory = os.path.join(individual_architecture_binary_directory, current_architecture)
	print(f'\nCurrent architecture:', current_architecture)

	rust_architecture = current_architecture
	if rust_architecture == 'arm64':
		rust_architecture = 'aarch64'
		if platform == 'iphonesimulator':
			rust_target_os = 'ios-sim'
	elif platform == 'iphonesimulator':
		rust_target_os = 'ios'

	print('Rust architecture:', rust_architecture)
	print('Rust target OS:', rust_target_os)

	cargo_raw_binary_origin = os.path.join(config.LDK_C_BINDINGS_DIRECTORY, 'target', f'{rust_architecture}-apple-{rust_target_os}', config.RUST_CONFIGURATION, 'libldk.a')
	print('Raw binary origin:', cargo_raw_binary_origin)
	print('Raw binary target:', current_architecture_binary_directory)

	# create the directory if it doesn't exist
	os.makedirs(current_architecture_binary_directory, exist_ok=True)

	subprocess.check_call(['cargo', 'clean'], cwd=config.LDK_C_BINDINGS_DIRECTORY)

	# cargo build -Z build-std=panic_abort,std --features "std" --target "${RUST_ARCH}-apple-${RUST_TARGET_OS}" $RUST_CONFIGURATION_FLAG
	subprocess.check_call(['cargo', 'build', '-Z', 'build-std=panic_abort,std', '--features', 'std', '--target', f'{rust_architecture}-apple-{rust_target_os}', config.RUST_CONFIGURATION_FLAG], env=child_environment, cwd=config.LDK_C_BINDINGS_DIRECTORY)

	# copy the generated binary to a monitored directory
	subprocess.check_call(['cp', cargo_raw_binary_origin, current_architecture_binary_directory])
	lipo_executables_input.append(os.path.join(current_architecture_binary_directory, 'libldk.a'))


subprocess.check_call(['rustup', 'override', 'unset'], cwd=config.LDK_C_BINDINGS_DIRECTORY)

# xcrun --sdk $PLATFORM_NAME lipo -create "${EXECUTABLES[@]}" -output "${LIPO_BINARY_DIR}/${TARGET_NAME}.a"
subprocess.check_call(['xcrun', '--sdk', platform, 'lipo', '-create', *lipo_executables_input, '-output', lipo_binary_output_path])


