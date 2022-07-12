import json
import os
import re
import sys


def run(new_checksum: str):
	print("setting checksum (JSON-serialization):")
	print(json.dumps(new_checksum))

	if not new_checksum.isalnum():
		print('Checksum must be alphanumeric.', file=sys.stderr)
		sys.exit(1)

	if not new_checksum.islower():
		print('Checksum must be lowercase.', file=sys.stderr)
		sys.exit(1)

	try:
		int(new_checksum, 16)
	except:
		print('Checksum must be hexadecimal.', file=sys.stderr)
		sys.exit(1)


	package_file_path = os.path.realpath(os.path.join(os.path.dirname(__file__), '../../Package.swift'))
	print(package_file_path)
	regex = re.compile("(let[\s]+checksum[\s]*=[\s]*)(.*)")

	with open(package_file_path, 'r') as package_file_handle:
		package_file = package_file_handle.read()
		previous_checksum = regex.search(package_file).group(2)
		# new_package_file = regex.sub(f'\g<1>"{new_checksum}"', package_file)
		new_package_file = package_file.replace(previous_checksum, f'"{new_checksum}"')
		with open(package_file_path, "w") as f:
			f.write(new_package_file)



if __name__ == '__main__':
	new_checksum = sys.argv[1]
	run(new_checksum)
