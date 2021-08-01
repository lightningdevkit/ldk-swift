import os
import sys

walk_directory = sys.argv[1] if len(sys.argv) > 1 else os.path.dirname(os.path.realpath(__file__))

# Create a collection of local header (or C) files
for current_directory, current_subdirectories, current_files in os.walk(walk_directory):
	for current_file in current_files:
		print(os.path.realpath(os.path.join(current_directory, current_file)))
