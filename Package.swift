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
      url: "https://github.com/parkr-app/alpr-ios/releases/download/0.4.0/AlprKit-0.4.0.xcframework.zip",
      checksum: "a20d5c7ea211a8a3145792127bb10f3eb44cfacc42d0bf12bb61a923fd9cb428"
    ),
  ]
)
