// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LDKCHeaders",
    products: [
        .library(
            name: "LDKCHeaders",
            targets: ["LDKCHeaders"]),
    ],
    dependencies: [],
    targets: [
        .systemLibrary(name: "LDKCHeaders")
    ]
)
