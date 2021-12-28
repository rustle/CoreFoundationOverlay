// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "CoreFoundationOverlay",
    products: [
        .library(
            name: "CoreFoundationOverlay",
            targets: ["CoreFoundationOverlay"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "CoreFoundationOverlay",
            dependencies: []),
        .testTarget(
            name: "CoreFoundationOverlayTests",
            dependencies: ["CoreFoundationOverlay"]),
    ]
)
