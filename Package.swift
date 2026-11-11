// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "DropCode",
    platforms: [.macOS(.v13)],
    dependencies: [
        .package(
            url: "https://github.com/Lakr233/libghostty-spm.git",
            exact: "1.4.0"
        )
    ],
    targets: [
        .executableTarget(
            name: "DropCode",
            dependencies: [
                .product(name: "GhosttyTerminal", package: "libghostty-spm")
            ]
        ),
        .testTarget(name: "DropCodeTests", dependencies: ["DropCode"])
    ]
)
