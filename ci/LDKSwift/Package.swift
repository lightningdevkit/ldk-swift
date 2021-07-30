// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let package = Package(
    name: "LDKSwift",
    products: [
        .library(
            name: "LDKSwift",
            targets: ["LDKSwift"]),
    ],
    dependencies: [
        .package(path: "../LDKCHeaders"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "LDKSwift",
            dependencies: ["LDKCHeaders"],
            linkerSettings: [
                 .linkedLibrary(String(utf8String: getenv("LDK_C_BINDINGS_BASE")!)! + "/lightning-c-bindings/target/debug/libldk.a"),
                 .linkedLibrary(String(utf8String: getenv("LDK_C_BINDINGS_BASE")!)! + "/lightning-c-bindings/ldk_net.o"),
                .linkedLibrary("/usr/lib/llvm-11/lib/clang/11.0.0/lib/linux/libclang_rt.asan-x86_64.a")
            ]),
        .testTarget(
            name: "LDKSwiftTests",
            dependencies: ["LDKSwift"]),
    ]
)
