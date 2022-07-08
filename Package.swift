// swift-tools-version:5.3
import PackageDescription

let tag = "0.0.108"
let checksum = "e69f12f9eb3335864ccd336d1285ec5e90826d68ca94594958aa61281af3ef84"
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
