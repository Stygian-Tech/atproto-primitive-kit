// swift-tools-version: 6.0
import PackageDescription

let package = Package(
  name: "atproto-primitives",
  platforms: [
    .macOS(.v14),
    .iOS(.v17),
  ],
  products: [
    .library(name: "AtprotoPrimitives", targets: ["AtprotoPrimitives"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-crypto.git", from: "3.14.0"),
  ],
  targets: [
    .target(
      name: "AtprotoPrimitives",
      dependencies: [
        .product(name: "Crypto", package: "swift-crypto"),
      ],
      path: "Sources/AtprotoPrimitives",
      swiftSettings: [
        .swiftLanguageMode(.v6),
      ]
    ),
    .testTarget(
      name: "AtprotoPrimitivesTests",
      dependencies: ["AtprotoPrimitives"],
      path: "Tests/AtprotoPrimitivesTests",
      swiftSettings: [
        .swiftLanguageMode(.v6),
      ]
    ),
  ]
)
