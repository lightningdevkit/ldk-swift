// swift-tools-version:5.3
import PackageDescription

let tag = "0.0.116"
let checksum = "2c6e9b4de934e0e23f2439890815372f955c7c8a0316db57acd0408f7647825c"
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
        .target(
            name: "LightningDevKitTarget",
            dependencies: ["LightningDevKit"],
            path: "./out",
            swiftSettings: [.unsafeFlags(["-suppress-warnings"])]
        ),
        .binaryTarget(
            name: "LightningDevKit",
            url: url,
            checksum: checksum
        )
    ]
)
