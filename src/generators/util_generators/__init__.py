import os

from src.config import Config


class UtilGenerator:
	bindings_templates = ''
	mutating_filled_template_set = ''

	def __init__(self):
		self.template_regex = None
		self.template = ''
		self.filled_template = ''

	def loadTemplate(self):
		self.template = self.template_regex.search(UtilGenerator.bindings_templates).group(2)

	def finalize(self):
		UtilGenerator.mutating_filled_template_set = self.template_regex.sub(f'\g<1>{self.filled_template}\g<3>',
																			 UtilGenerator.mutating_filled_template_set)
		self.persist()

	def persist(self):
		# store the output
		output_path = f'{Config.OUTPUT_DIRECTORY_PATH}/Bindings.swift'
		output_directory = os.path.dirname(output_path)
		if not os.path.exists(output_directory):
			os.makedirs(output_directory)
		with open(output_path, "w") as f:
			f.write(UtilGenerator.mutating_filled_template_set)


template_path = f'{os.path.dirname(__file__)}/../../../templates/BindingsTemplate.swift'
with open(template_path, 'r') as template_handle:
	UtilGenerator.bindings_templates = template_handle.read()
	UtilGenerator.mutating_filled_template_set = UtilGenerator.bindings_templates
