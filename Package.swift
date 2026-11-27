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
      url: "https://github.com/parkr-app/alpr-ios/releases/download/0.5.1/AlprKit-0.5.1.xcframework.zip",
      checksum: "d3a6b63f683c06370b7f20a0d79c193c9c4eddb3b39c7207cdd27537cf13159a"
    ),
  ]
)
