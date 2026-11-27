// swift-tools-version:5.9
import PackageDescription

let package = Package(
  name: "AlprKit",
  platforms: [.iOS("15.1")],
  products: [
    .library(name: "AlprKit", targets: ["AlprKit"]),
  ],
  targets: [
    .binaryTarget(
      name: "AlprKit",
      url: "https://github.com/parkr-app/alpr-ios/releases/download/0.5.0/AlprKit-0.5.0.xcframework.zip",
      checksum: "c221bce5ba70684f3a177eac6af96496c9b2a5330928bd301f861395ec3b7e6d"
    ),
  ]
)
