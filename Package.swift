// swift-tools-version:5.3
import PackageDescription

let tag = "0.0.109"
let checksum = "6793a2be7b8e5037cbb81030cce155285defd8a014c18be172cda00bc01199bb"
let url = "https://github.com/lightningdevkit/ldk-swift/releases/download/\(tag)/LDKFramework.xcframework.zip"

let package = Package(
    name: "LDKFramework",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_12)
    ],
    products: [
        .library(
            name: "LDKFramework",
            targets: ["LDKFramework"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "LDKFramework",
            url: url,
            checksum: checksum
        )
    ]
)
