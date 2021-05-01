# DYXML

XML document builder in Swift made with `@resultBuilder`.

## Description

This is a simple and lightweight XML document builder. It is built upon the Swift Result Builders, introduced in Swift 5.4.

## Features

- **Write XML** string
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

let xml = document(indentation: .initialDefault) {
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
print(xml.string)
```

## License

DYXML is released under the MIT license. See [LICENSE](LICENSE) for details.
