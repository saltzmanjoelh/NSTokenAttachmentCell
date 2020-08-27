// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NSTokenAttachmentCell",
    products: [
        .library(name: "NSTokenAttachmentCell", targets: ["NSTokenAttachmentCell"]),
    ],
    targets: [
        .target(name: "NSTokenAttachmentCell"),
    ]
)
