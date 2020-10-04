// swift-tools-version:5.3

import PackageDescription

let SwiftSampleProject = Package(
  name: "SwiftSampleProject",
  products: [
    .executable(name: "SwiftSampleProject", targets: ["SwiftSampleProject"]),
  ],
  targets: [
    .target(
      name: "SwiftSampleProject",
      path: "Sources",
      exclude: [
        "CMakeLists.txt",
      ],
      swiftSettings: [
        .unsafeFlags([
          "-parse-as-library"
        ]),
      ]
    ),
  ]
)
