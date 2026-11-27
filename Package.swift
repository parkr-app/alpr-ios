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
      url: "https://github.com/parkr-app/alpr-ios/releases/download/0.4.5/AlprKit-0.4.5.xcframework.zip",
      checksum: "be7ad395b802ee788ab56d96de83c655bbfd31ddc9a4314916a8e403c82010e3"
    ),
  ]
)
