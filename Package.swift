// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "VueKitBridge",
    platforms: [
        .macOS(.v10_15),
    ],
    products: [
        .library(name: "VueKitBridge", targets: ["VueKitBridge"])
    ],
    dependencies: [
        .package(
            name: "FrameworkBridge",
            url: "https://github.com/johnsusek/framework-bridge.git",
            .branch("master")
        ),
        .package(
            name: "SwiftyJSON",
            url: "https://github.com/SwiftyJSON/SwiftyJSON.git",
            .branch("master")
        )
    ],
    targets: [
        .target(
            name: "VueKitBridge",
            dependencies: ["FrameworkBridge", "SwiftyJSON"],
            resources: [
                .process("Resources")
            ]
        )
    ]
)
