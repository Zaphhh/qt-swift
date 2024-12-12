// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

@preconcurrency import PackageDescription

let package = Package(
    name: "Qt",
    platforms: [.macOS(.v13)],
    products: [
        .library(
            name: "Qt",
            targets: ["Qt"]
        ),
        .library(
            name: "Core",
            targets: ["Core"]
        ),
    ],
    dependencies: [
        .package(url: "https://git.aparoksha.dev/aparoksha/meta", branch: "main"),
        .package(url: "https://git.aparoksha.dev/aparoksha/meta-sqlite", branch: "main"),
        .package(url: "https://git.aparoksha.dev/aparoksha/levenshtein-transformations", branch: "main"),
        .package(url: "https://github.com/MatuaDoc/qlift.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "Core",
            dependencies: [
                .product(name: "Meta", package: "Meta"),
                .product(name: "MetaSQLite", package: "meta-sqlite"),
                .product(name: "LevenshteinTransformations", package: "levenshtein-transformations"),
                .product(name: "Qlift", package: "qlift"),
            ]
        ),
        .target(
            name: "Qt",
            dependencies: [
                "Core",
                .product(name: "Qlift", package: "Qlift"),
            ]
        ),
        .executableTarget(
            name: "Old",
            dependencies: [
                .product(name: "Qlift", package: "Qlift")
            ]),
        .executableTarget(
            name: "Demo",
            dependencies: [
                "Qt"
            ]
        ),
    ],
    swiftLanguageModes: [.v5]
)
