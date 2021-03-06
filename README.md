# DYXML

XML document builder in Swift made with `@resultBuilder`.

## Description

This is a simple and lightweight XML document builder. It is built upon the Swift Result Builders, introduced in Swift 5.4. Heavily inspired by SwiftUI.

## Requirements

- Swift 5.4 (available from Xcode 12.5)

## Features

- **Write XML** string
- Supports `if`, `if...else`, `switch`, `for...in` statements
- Unit tests are available

## Usage

If you want the following XML output:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<gpx xmlns="http://www.topografix.com/GPX/1/1" creator="byHand" version="1.1" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd">
  <wpt lat="39.921055008" lon="3.054223107">
    <ele>12.863281</ele>
    <time>2005-05-16T11:49:06Z</time>
    <name>Cala Sant Vicenç - Mallorca</name>
    <sym>City</sym>
  </wpt>
</gpx>
```

With DYXML you can write it this way:

```swift
import DYXML

let xml = document {
    node("gpx", attributes: [
        ("xmlns", "http://www.topografix.com/GPX/1/1"),
        ("creator", "byHand"),
        ("version", "1.1"),
        ("xmlns:xsi", "http://www.w3.org/2001/XMLSchema-instance"),
        ("xsi:schemaLocation", "http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd")
    ]) {
            node("wpt", attributes: [("lat", "39.921055008"), ("lon", "3.054223107")]) {
                node("ele", value: "12.863281")
                node("time", value: "2005-05-16T11:49:06Z")
                node("name", value: "Cala Sant Vicenç - Mallorca")
                node("sym", value: "City")
        }
    }
}
```

You can then get your XML string content with one of the following method:

```swift
// Output without any indentation and on a single line
let output = xml.string

// Output with multiple lines and indentation of 2 spaces by level
let indentedOutput = xml.toString(withIndentation: 2)
```

## Installation

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/davidy4ng/DYXML.git", .upToNextMajor(from: "1.0.0"))
]
```

## License

DYXML is released under the MIT license. See [LICENSE](LICENSE) for details.
