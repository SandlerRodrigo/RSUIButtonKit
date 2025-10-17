// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RSUIButtonKit",
    platforms: [
        .iOS(.v17),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "RSUIButtonKit",
            targets: ["RSUIButtonKit"]
        )
    ],
    targets: [
        .target(
            name: "RSUIButtonKit",
            dependencies: []
        ),
        .testTarget(
            name: "RSUIButtonKitTests",
            dependencies: ["RSUIButtonKit"]
        )
    ]
)
