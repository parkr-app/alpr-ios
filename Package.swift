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
      url: "https://github.com/parkr-app/alpr-ios/releases/download/0.4.6/AlprKit-0.4.6.xcframework.zip",
      checksum: "dbaa3a72139581490242ca5eb0afd2519eb015ccd969bf0883d4df828dbeda18"
    ),
  ]
)
