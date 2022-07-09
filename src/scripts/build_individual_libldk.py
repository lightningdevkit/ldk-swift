import os
import shutil
import subprocess
import sys

from script_config import ScriptConfig, BuildConfig

RUSTUP_PATH = os.getenv('HOME') + '/.cargo/bin/rustup'
CARGO_PATH = os.getenv('HOME') + '/.cargo/bin/cargo'


def run(config: ScriptConfig):
	if len(config.LIBLDK_BUILD_CONFIGURATIONS) != 1:
		print('Individual libldk build must have exactly 1 build configuration.')
		sys.exit(1)

	ldkBuildConfig = config.LIBLDK_BUILD_CONFIGURATIONS[0]
	platform = ldkBuildConfig.platform
	human_readable_platform = ldkBuildConfig.human_readable_platform
	llvm_target_triple_suffix = ldkBuildConfig.llvm_target_triple_suffix
	architectures = ldkBuildConfig.architectures

	build_products_directory = os.path.realpath(os.path.join(os.path.dirname(__file__), '../../bindings/bin'))

	rust_target_os = 'ios'
	if platform == 'macosx' and llvm_target_triple_suffix == '-macabi':
		rust_target_os = 'ios-macabi'
	elif platform == 'macosx':
		rust_target_os = 'darwin'

	print(f'\n\nPlatform name: {platform} ({human_readable_platform})')
	print('Configuration:', config.RUST_CONFIGURATION)
	print('LLVM Target Triple Suffix:', llvm_target_triple_suffix)

	individual_architecture_binary_directory = os.path.join(
		build_products_directory,
		config.RUST_CONFIGURATION,
		human_readable_platform,
		'architectures'
	)
	lipo_binary_directory = os.path.join(
		build_products_directory,
		config.RUST_CONFIGURATION,
		human_readable_platform
	)
	if config.LIPO_BINARY_OUTPUT_DIRECTORY:
		lipo_binary_directory = config.LIPO_BINARY_OUTPUT_DIRECTORY
	lipo_binary_output_path = os.path.join(lipo_binary_directory, 'libldk.a')

	print('Building lipo binary into', lipo_binary_output_path)

	os.makedirs(lipo_binary_directory, exist_ok=True)

	child_environment = dict(os.environ)
	child_environment['RUSTFLAGS'] = '--cfg=c_bindings'
	child_environment['PATH'] = '/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin'

	subprocess.check_call([RUSTUP_PATH, 'override', 'set', 'nightly'], cwd=config.LDK_C_BINDINGS_DIRECTORY)

	lipo_executables_input: [str] = []

	for current_architecture in architectures:
		current_architecture_binary_directory = os.path.join(
			individual_architecture_binary_directory,
			current_architecture
		)
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

		cargo_target_directory = os.path.join(config.LDK_C_BINDINGS_DIRECTORY, 'target')
		cargo_raw_binary_origin = os.path.join(
			cargo_target_directory,
			f'{rust_architecture}-apple-{rust_target_os}',
			config.RUST_CONFIGURATION,
			'libldk.a'
		)
		print('Raw binary origin:', cargo_raw_binary_origin)
		print('Raw binary target:', current_architecture_binary_directory)

		# create the directory if it doesn't exist
		os.makedirs(current_architecture_binary_directory, exist_ok=True)

		# stop the complaints about directories not being empty
		if os.path.isdir(cargo_target_directory):
			shutil.rmtree(cargo_target_directory, ignore_errors=True)
		subprocess.check_call([CARGO_PATH, 'clean'], cwd=config.LDK_C_BINDINGS_DIRECTORY)

		# cargo build -Z build-std=panic_abort,std --features "std" --target "${RUST_ARCH}-apple-${RUST_TARGET_OS}" $RUST_CONFIGURATION_FLAG
		build_arguments = [CARGO_PATH, 'build', '-Z', 'build-std=panic_abort,std', '--features', 'std', '--target', f'{rust_architecture}-apple-{rust_target_os}']
		if config.RUST_CONFIGURATION_FLAG:
			build_arguments.append(config.RUST_CONFIGURATION_FLAG)
		subprocess.check_call(
			build_arguments,
			env=child_environment,
			cwd=config.LDK_C_BINDINGS_DIRECTORY
		)

		# copy the generated binary to a monitored directory
		subprocess.check_call(['cp', cargo_raw_binary_origin, current_architecture_binary_directory])
		lipo_executables_input.append(os.path.join(current_architecture_binary_directory, 'libldk.a'))

	subprocess.check_call([RUSTUP_PATH, 'override', 'unset'], cwd=config.LDK_C_BINDINGS_DIRECTORY)

	# xcrun --sdk $PLATFORM_NAME lipo -create "${EXECUTABLES[@]}" -output "${LIPO_BINARY_DIR}/${TARGET_NAME}.a"
	subprocess.check_call(
		['xcrun', '--sdk', platform, 'lipo', '-create', *lipo_executables_input, '-output', lipo_binary_output_path]
	)


if __name__ == '__main__':
	script_config = ScriptConfig.parse(
		allow_ldk_argument=False,
		parse_configuration=True,
		parse_lipo_output_directory=True
	)

	platform = os.getenv('PLATFORM_NAME')
	llvm_target_triple_suffix = os.getenv('LLVM_TARGET_TRIPLE_SUFFIX')
	architectures = os.getenv('ARCHS').split(' ')

	ldkBuildConfig = BuildConfig(platform, llvm_target_triple_suffix, architectures)
	script_config.LIBLDK_BUILD_CONFIGURATIONS = [ldkBuildConfig]

	run(script_config)
