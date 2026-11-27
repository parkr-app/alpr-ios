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
      url: "https://github.com/parkr-app/alpr-ios/releases/download/0.4.3/AlprKit-0.4.3.xcframework.zip",
      checksum: "1af5271fbde70337fff85e2a2d07fe0529535ac5300b528313a97ca5c24c1032"
    ),
  ]
)
