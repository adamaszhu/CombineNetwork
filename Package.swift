// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CombineNetwork",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "CombineNetwork", targets: ["CombineNetwork"])
    ],
    dependencies: [
        .package(url: "https://github.com/adamaszhu/CombineUtility", .upToNextMajor(from: "1.0.3")),
        .package(url: "https://github.com/Quick/Quick", .upToNextMajor(from: "5.0.0")),
        .package(url: "https://github.com/Quick/Nimble", .upToNextMajor(from: "10.0.0"))
    ],
    targets: [
        .target(name: "CombineNetwork",
                dependencies: ["CombineUtility"],
                path: "CombineNetwork"),
        .testTarget(
            name: "CombineNetworkTests",
            dependencies: ["CombineUtility",
                           "Nimble",
                           "Quick"],
            path: "CombineNetworkTests"),
    ]
)
