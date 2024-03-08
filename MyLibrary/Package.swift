// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "MyLibrary",
  defaultLocalization: "en",
  platforms: [.iOS(.v17), .macOS(.v14), .watchOS(.v10), .tvOS(.v17)],
  products: [
    .library(
      name: "AppFeature",
      targets: ["AppFeature"]),
  ],
  dependencies: [
    .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "1.9.1"),
  ],
  targets: [
    .target(
      name: "AppFeature",
      dependencies: [
        "ScheduleFeature",
        "SpeakerFeature",
        "SponsorFeature"
      ]
    ),
    .target(
      name: "DataClient",
      dependencies: [
        "SharedModels",
        .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
      ],
      resources: [
        .process("Resources")
      ]
    ),
    .target(
      name: "ScheduleFeature",
      dependencies: [
        "DataClient",
        .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
      ]
    ),
    .target(name: "SharedModels"),
    .target(
      name: "SpeakerFeature",
      dependencies: [
        "DataClient",
        .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
      ]
    ),
    .target(
      name: "SponsorFeature",
      dependencies: [
        "DataClient",
        .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
      ]
    ),

  ]
)