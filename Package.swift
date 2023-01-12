// swift-tools-version:5.3
import PackageDescription

let tag = "0.0.113"
let checksum = "b8969da1e7556b7780deed6dcd18510f46b4b44bceccaffd10335d980e34789a"
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
