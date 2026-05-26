// swift-tools-version: 6.0
import PackageDescription

let package = Package(
  name: "atproto-primitive-kit",
  platforms: [
    .macOS(.v14),
    .iOS(.v17),
  ],
  products: [
    .library(name: "ATProtoPrimitiveKit", targets: ["ATProtoPrimitiveKit"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-crypto.git", from: "3.14.0"),
  ],
  targets: [
    .target(
      name: "ATProtoPrimitiveKit",
      dependencies: [
        .product(name: "Crypto", package: "swift-crypto"),
      ],
      path: "Sources/ATProtoPrimitiveKit",
      swiftSettings: [
        .swiftLanguageMode(.v6),
      ]
    ),
    .testTarget(
      name: "ATProtoPrimitiveKitTests",
      dependencies: ["ATProtoPrimitiveKit"],
      path: "Tests/ATProtoPrimitiveKitTests",
      swiftSettings: [
        .swiftLanguageMode(.v6),
      ]
    ),
  ]
)
