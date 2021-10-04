import os
import re
import subprocess

from src.generators.util_generators import UtilGenerator


class VersionStringGenerator(UtilGenerator):

    def __init__(self) -> None:
        super().__init__()
        self.template_regex = re.compile('(")(\/\* SWIFT_BINDINGS_VERSION \*\/)(")')
        self.loadTemplate()
        self.raw_tuple_generators = {}

    def get_git_version(self) -> str:
        working_directory = os.path.dirname(__file__)
        version_long = subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=working_directory).decode(
            'ascii'
        ).strip()
        version_short = subprocess.check_output(['git', 'rev-parse', '--short', 'HEAD'], cwd=working_directory).decode(
            'ascii'
        ).strip()
        version_description = subprocess.check_output(
            ['git', 'describe', '--tag', '--dirty', '--always'],
            cwd=working_directory
        ).decode('ascii').strip()
        print('Git versions:', '\n', version_description, '\n', version_short, '\n', version_long, '\n')
        return version_long

    def obtain_version_string(self):
        version_string = self.get_git_version()
        self.filled_template = version_string
