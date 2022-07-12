// swift-tools-version:5.3
import PackageDescription

let tag = "0.0.109"
let checksum = "5e2657014a4595a2b3727e9073228a9d8b4a671207e55bb15307b44f3369b56b"
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
