// swift-tools-version:5.3
import PackageDescription

let tag = "0.0.108"
let checksum = "3d2f98a1c81b3124c92dfa8a515cf69658c6513b089e86de72425b4d228b18d0"
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
