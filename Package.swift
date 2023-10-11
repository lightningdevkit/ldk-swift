// swift-tools-version:5.3
import PackageDescription

let tag = "0.0.117"
let checksum = "0dafa8a11dea190aa0b700ca68349d0011e20b6bd5340b6fa935c191b894b0f5"
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
            checksum: checksum,
            swiftSettings: [.unsafeFlags(["-suppress-warnings"])]
        )
    ]
)
