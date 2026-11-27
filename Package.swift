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
      url: "https://github.com/parkr-app/alpr-ios/releases/download/0.4.4/AlprKit-0.4.4.xcframework.zip",
      checksum: "79d38dae62431f274b39ac4ce2ffbc5914df8b3381e2fd89d8aab829e3ba53e0"
    ),
  ]
)
