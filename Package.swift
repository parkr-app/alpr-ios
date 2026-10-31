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
      url: "https://github.com/parkr-app/alpr-ios/releases/download/0.4.1/AlprKit-0.4.1.xcframework.zip",
      checksum: "f5f64ba020523242bc766353ee21eb36ad76f044dee8655c3671eea4a4baabfc"
    ),
  ]
)
