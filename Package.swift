// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SPMPlugins",
    defaultLocalization: "en",
    platforms: [
        // Ventura 13.2.1
        .macOS(.v13)
    ],
    products: [
        .plugin(
            name: "Reformat Source Code",
            targets: [
                "Reformat Source Code"
            ]
        ),
        .plugin(
            name: "Regenerate Contributors List",
            targets: [
                "Regenerate Contributors List"
            ]
        ),
        .plugin(
            name: "Update Copyright Dates",
            targets: [
                "Update Copyright Dates"
            ]
        ),
        
    ],
    dependencies: [

    ],
    targets: [
        .plugin(
            name: "Reformat Source Code",
            capability: .command(
                intent: .custom(verb: "reformat-source-code", description: "Reformats the Swift source code files using SwiftFormat"),
                permissions: [
                    .writeToPackageDirectory(reason: "This command reformats the Swift source files")
                ]
            ),
            dependencies: [
                .product(name: "swift-format", package: "swift-format"),
            ]
        ),
        .plugin(
            name: "Regenerate Contributors List",
            capability: .command(
                intent: .custom(verb: "regenerate-contributors-list", description: "Generates the CONTRIBUTORS.txt file based on Git logs"),
                permissions: [
                    .writeToPackageDirectory(reason: "This command write the new copyright dates to the Swift source files")
                ]
            )
        ),
        .plugin(
            name: "Update Copyright Dates",
            capability: .command(
                intent: .custom(verb: "update-copyright-dates", description: "Updates the copyright dates in source files based on Git logs"),
                permissions: [
                    .writeToPackageDirectory(reason: "This command write the new copyright dates to the Swift source files")
                ]
            )
        ),
    ]
)

// https://github.com/apple/swift-format#matching-swift-format-to-your-swift-version-swift-57-and-earlier

#if swift(>=5.7)
package.dependencies += [
    .package(url: "https://github.com/apple/swift-format", branch: "release/5.7")
]
#elseif swift(>=5.6)
package.dependencies += [
    .package(url: "https://github.com/apple/swift-format", branch: "release/5.6")
]
#elseif swift(>=5.5)
package.dependencies += [
    .package(url: "https://github.com/apple/swift-format", branch: "swift-5.5-branch")
]
#elseif swift(>=5.4)
package.dependencies += [
    .package(url: "https://github.com/apple/swift-format", branch: "swift-5.4-branch")
]
#elseif swift(>=5.3)
package.dependencies += [
    .package(url: "https://github.com/apple/swift-format", branch: "swift-5.3-branch")
]
#endif
