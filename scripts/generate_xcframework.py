import os
import shutil
import subprocess

from script_config import ScriptConfig, ArchiveConfig


def parse_config() -> ScriptConfig:
	config = ScriptConfig.parse(allow_ldk_argument=True, parse_configuration=True, parse_xcarchive_preservation=True)

	individual_configurations: [ArchiveConfig] = [
		ArchiveConfig('iOS Simulator', 'iphonesimulator'),
		ArchiveConfig('iOS', 'iphoneos'),
		ArchiveConfig('OS X', 'macosx'),
		ArchiveConfig('macOS,variant=Mac Catalyst', 'catalyst'),
	]
	config.XCARCHIVE_GENERATION_CONFIGURATIONS = individual_configurations

	return config


def run(config: ScriptConfig):
	build_products_directory = os.path.realpath(os.path.join(os.path.dirname(__file__), '../bindings/bin'))
	xcode_project_path = os.path.realpath(
		os.path.join(os.path.dirname(__file__), '../xcode/LDKFramework/LDK.xcodeproj')
	)
	framework_input_flags: [str] = []
	xcframework_output_path = os.path.join(
		build_products_directory,
		config.RUST_CONFIGURATION,
		'LightningDevKit.xcframework'
	)

	child_environment = dict(os.environ)
	child_environment['LDK_C_BINDINGS_BASE'] = config.LDK_C_BINDINGS_BASE

	archive_configurations = config.XCARCHIVE_GENERATION_CONFIGURATIONS
	for current_configuration in archive_configurations:
		current_destination = current_configuration.destination
		current_human_readable_platform = current_configuration.human_readable_platform

		lipo_binary_directory = os.path.join(
			build_products_directory,
			config.RUST_CONFIGURATION,
			current_human_readable_platform,
		)
		derived_data_directory = os.path.join(
			build_products_directory,
			config.RUST_CONFIGURATION,
			current_human_readable_platform,
			'DerivedData'
		)
		xcarchive_output_path = os.path.join(
			build_products_directory,
			config.RUST_CONFIGURATION,
			current_human_readable_platform,
			current_human_readable_platform  # the last component is the filename excluding .xcarchive
		)

		# XCFRAMEWORK_INPUT_FLAGS="${XCFRAMEWORK_INPUT_FLAGS}-framework ${CURRENT_ARCHIVE_PATH}.xcarchive/Products/Library/Frameworks/LDKFramework.framework "
		framework_input_flags += [
			'-framework',
			f'{xcarchive_output_path}.xcarchive/Products/Library/Frameworks/LightningDevKit.framework',
			'-debug-symbols',
			f'{xcarchive_output_path}.xcarchive/dSYMs/LightningDevKit.framework.dSYM'
		]

		if config.PRESERVE_XCARCHIVES:
			# we don't regenerate any new xcarchives, and simply reuse the existing ones
			continue

		# create clean derived data directory
		if os.path.exists(derived_data_directory):
			shutil.rmtree(derived_data_directory, ignore_errors=True)
		os.makedirs(derived_data_directory, exist_ok=False)

		child_environment['LDK_C_BINDINGS_BINARY_DIRECTORY'] = lipo_binary_directory

		# xcodebuild archive -verbose -project "${BASEDIR}/LDKFramework/LDKFramework.xcodeproj" -scheme LDKFramework -destination "generic/platform=${CURRENT_DESTINATION_NAME}" -derivedDataPath "${CURRENT_DERIVED_DATA_DIRECTORY}" -archivePath "${CURRENT_ARCHIVE_PATH}" ENABLE_BITCODE=NO EXCLUDED_ARCHS="i386 armv7" SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES LDK_C_BINDINGS_BASE="${LDK_DIRECTORY}" LDK_C_BINDINGS_BINARY_DIRECTORY="${CURRENT_LIPO_DIRECTORY_PATH}"
		subprocess.check_call(
			[
				'xcodebuild',
				'archive',
				'-verbose',
				'-project', xcode_project_path,
				'-scheme', 'LightningDevKit',
				'-destination', f'generic/platform={current_destination}',
				'-derivedDataPath', derived_data_directory,
				'-archivePath', xcarchive_output_path,
				'ENABLE_BITCODE=NO',
				'EXCLUDED_ARCHS="i386 armv7"',
				'SKIP_INSTALL=NO',
				'BUILD_LIBRARY_FOR_DISTRIBUTION=YES',
				f'LDK_C_BINDINGS_BASE={config.LDK_C_BINDINGS_BASE}',
				f'LDK_C_BINDINGS_BINARY_DIRECTORY={lipo_binary_directory}',
				f'LDK_C_BINDINGS_BINARY_FORCED_REBUILD_OUTPUT_DIRECTORY=',
			], env=child_environment
		)

		# clean up the derived data
		shutil.rmtree(derived_data_directory, ignore_errors=True)

	# xcodebuild -create-xcframework ${XCFRAMEWORK_INPUT_FLAGS} -output ${XCFRAMEWORK_OUTPUT_PATH}"
	if os.path.exists(xcframework_output_path):
		shutil.rmtree(xcframework_output_path, ignore_errors=True)

	subprocess.check_call(
		['xcodebuild', '-create-xcframework', *framework_input_flags, '-output', xcframework_output_path]
	)


if __name__ == '__main__':
	script_config = parse_config()
	run(script_config)
