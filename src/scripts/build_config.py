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
