public struct XMLNode: XML {
    private let name: String
    private let attributes: [XMLAttribute]
    private let children: [XML]

    init(name: String, attributes: [XMLAttribute] = [], children: [XML] = []) {
        self.name = name
        self.attributes = attributes
        self.children = children
    }

    public func renderXML(into stream: XMLOutputStream) {
        stream.writeIndentation()
        if children.isEmpty {
            stream.writeOrphanTag(name, attributes: attributes)
            stream.writeNewLine()
        } else if let child = children.first, children.count == 1, child is String {
            stream.writeOpeningTag(name, attributes: attributes)
            child.renderXML(into: stream)
            stream.writeClosingTag(name)
            stream.writeNewLine()
        } else {
            stream.writeOpeningTag(name, attributes: attributes)
            stream.writeNewLine()
            stream.incrementIndentationLevel()
            for child in children {
                child.renderXML(into: stream)
            }
            stream.decrementIndentationLevel()
            stream.writeIndentation()
            stream.writeClosingTag(name)
            stream.writeNewLine()
        }
    }
}
