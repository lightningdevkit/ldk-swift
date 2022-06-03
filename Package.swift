// swift-tools-version:5.5
import PackageDescription

let tag = "0.0.106.31"
let checksum = "347eae7509f94014977de83bbed209bb14d388b32cb1c967c55eaaedfe876ac9"
let url = "https://github.com/jurvis/ldk-swift/releases/download/\(tag)/LibWally.xcframework.zip"

let package = Package(
    name: "LDKFramework",
    platforms: [
        .iOS(.v11),
        .macOS(.v10_15)
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
