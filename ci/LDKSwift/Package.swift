// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

var cBindingsBase = "../../../ldk-c-bindings"
if let bindingsBase = getenv("LDK_C_BINDINGS_BASE") {
	cBindingsBase = String(utf8String: bindingsBase)!
}

var bindingsDirectory = "\(cBindingsBase)/lightning-c-bindings/target/debug"
if let ldkBinaryDirectory = getenv("LDK_C_BINDINGS_BINARY_DIRECTORY") {
	bindingsDirectory = String(utf8String: ldkBinaryDirectory)!
}

var bindingsLibraryPath = "\(bindingsDirectory)/libldk.a"

var linkerSettings: [PackageDescription.LinkerSetting] = [
	.linkedLibrary(bindingsLibraryPath)
]

#if os(Linux)
	linkerSettings.append(.linkedLibrary(String(utf8String: getenv("LLVM_CLANG_ASAN_PATH")!)!, .when(platforms: [.linux])))
#else
	linkerSettings = [
		.unsafeFlags(["-L\(bindingsDirectory)"]),
		.linkedLibrary("ldk")
	]
#endif

let package = Package(
	name: "LDKSwift",
	// platforms: [
	// 	// .macOS(.v11),
	// 	// .macCatalyst(.v13),
	// 	.iOS(.v14),
	// ],
	products: [
		.library(
			name: "LDKSwift",
			// type: .dynamic,
			targets: ["LDKSwift"]),
	],
	dependencies: [
		.package(url: "https://github.com/apple/swift-crypto.git", "1.0.0"..<"3.0.0")
	],
	targets: [
		// Targets are the basic building blocks of a package. A target can define a module or a test suite.
		// Targets can depend on other targets in this package, and on products in packages this package depends on.
		.target(name: "LDKHeaders"),
		.target(
			name: "LDKSwift",
			dependencies: [
				"LDKHeaders"
			],
			path: nil,
			exclude: [],
			sources: nil,
			resources: nil,
			publicHeadersPath: "include",
			cSettings: nil,
			cxxSettings: nil,
			swiftSettings: nil,
			linkerSettings: linkerSettings
		),
		.testTarget(
			name: "LDKSwiftTests",
			dependencies: [
				"LDKSwift",
				"LDKHeaders",
				.product(name: "Crypto", package: "swift-crypto")
			],
			path: nil,
			exclude: [],
			sources: nil,
			cSettings: nil, cxxSettings: nil, swiftSettings: nil,
			linkerSettings: nil)
	]
)
