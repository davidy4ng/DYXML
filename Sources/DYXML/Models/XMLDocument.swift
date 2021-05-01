public struct XMLDocument: XML {
    private let children: [XML]

    init(children: [XML]) {
        self.children = children
    }

    public func renderXML(into stream: XMLOutputStream) {
        stream.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>")
        stream.writeNewLine()
        for child in children {
            child.renderXML(into: stream)
        }
    }
}
