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
      url: "https://github.com/parkr-app/alpr-ios/releases/download/0.4.2/AlprKit-0.4.2.xcframework.zip",
      checksum: "c535c485004454a60342fd550c0489111772307ceb7346021394a9f78e7ddba2"
    ),
  ]
)
