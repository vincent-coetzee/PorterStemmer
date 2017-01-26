import PackageDescription

let package = Package(
    name: "PorterStemmer",
    targets: [
        Target(name: "PorterStemmer", dependencies: ["Porter"]),
        Target(name: "Porter", dependencies: [])
        ]
)
