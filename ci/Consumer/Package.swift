// swift-tools-version:5.9
import PackageDescription

let package = Package(
  name: "Consumer",
  platforms: [.iOS("15.1")],
  products: [
    .library(name: "Consumer", targets: ["Consumer"]),
  ],
  dependencies: [
    .package(path: "../.."),
  ],
  targets: [
    .target(name: "Consumer", dependencies: [.product(name: "AlprKit", package: "alpr-ios")]),
  ]
)
