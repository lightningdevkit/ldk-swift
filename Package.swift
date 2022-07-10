// swift-tools-version:5.3
import PackageDescription

let tag = "0.0.108"
let checksum = "01eb13d93f90ae228130ad17b2dffe8388611886125f8dd53ba2d31518209f92"
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
