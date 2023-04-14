// swift-tools-version:5.3
import PackageDescription

let tag = "0.0.114"
let checksum = "3fec857cc975f792da0d2a5c9e9c0b604d780b81888a607175e9e0d6c209fc43"
let url = "https://github.com/lightningdevkit/ldk-swift/releases/download/\(tag)/LightningDevKit.xcframework.zip"

let package = Package(
    name: "LightningDevKit",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_12)
    ],
    products: [
        .library(
            name: "LightningDevKit",
            targets: ["LightningDevKit"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "LightningDevKit",
            url: url,
            checksum: checksum
        )
    ]
)
