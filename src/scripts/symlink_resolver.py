import argparse
import os
import shutil
import subprocess
import sys
from os import path


def run(xcframework_path: str):
	if not xcframework_path.endswith('.xcframework'):
		print('XCFramework path must end in *.xcframework', file=sys.stderr)
		sys.exit(1)
	if not path.exists(xcframework_path):
		print(f'Path {xcframework_path} does not exist', file=sys.stderr)
		sys.exit(1)
	if not path.isdir(xcframework_path):
		print('XCFramework must be a directory', file=sys.stderr)
		sys.exit(1)

	walked_paths = set()

	for current_root, current_subdirectories, current_files in os.walk(xcframework_path):

		if current_root in walked_paths:
			print('Skipping', current_root)

		for current_subdirectory in current_subdirectories:
			current_directory = path.join(current_root, current_subdirectory)
			is_symlink = path.islink(current_directory)
			if not is_symlink:
				continue

			walked_paths.add(current_directory)

			target = path.realpath(current_directory)
			print('Directory:', current_directory, '>', target)
			# remove current subdirectory
			print('Removing', current_directory)
			os.unlink(current_directory)
			# copy target into current directory
			target_contents = os.path.join(target, '.')
			print('Copying', target_contents, 'to', current_directory)
			subprocess.check_call(['cp', '-r', target_contents, current_directory])

		for current_file in current_files:
			current_file_absolute = os.path.join(current_root, current_file)
			is_symlink = os.path.islink(current_file_absolute)
			if not is_symlink:
				continue
			target = path.realpath(current_file_absolute)
			print('File:', current_file_absolute, '>', target)
			# remove current file
			print('Removing', current_file_absolute)
			os.unlink(current_file_absolute)
			# copy target into current directory
			print('Copying', target, 'to', current_root)
			subprocess.check_call(['cp', target, current_root])

	pass

if __name__ == '__main__':
	parser = argparse.ArgumentParser(description='Resolve and replace symlinks in an xcframework')
	parser.add_argument('path', type=str, help='new checksum of LightningDevKit.xcframework.zip', default=None)
	args = parser.parse_args()
	run(xcframework_path=args.path)
