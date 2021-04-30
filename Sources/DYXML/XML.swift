public typealias XMLAttribute = (String, String)

protocol XML {
    func indentedCopy(_ indentation: XMLIndentation?) -> XML
    func renderXML(into stream: XMLOutputStream)
}

public struct XMLDocument: XML {
    private let indentation: XMLIndentation?
    private let children: [XML]

    init(indentation: XMLIndentation? = .initialDefault, children: [XML]) {
        self.indentation = indentation
        self.children = children
    }

    func indentedCopy(_ indentation: XMLIndentation?) -> XML {
        return self
    }

    func renderXML(into stream: XMLOutputStream) {
        stream.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>")
        indentation?.writeNewLine(into: stream)
        for child in children {
            child.indentedCopy(indentation).renderXML(into: stream)
        }
    }
}

public struct XMLNode: XML {
    private let name: String
    private let attributes: [XMLAttribute]
    private let children: [XML]
    private var indentation: XMLIndentation?

    init(name: String, attributes: [XMLAttribute] = [], children: [XML] = []) {
        self.name = name
        self.attributes = attributes
        self.children = children
    }

    func indentedCopy(_ indentation: XMLIndentation?) -> XML {
        var copy = self
        copy.indentation = indentation
        return copy
    }

    func renderXML(into stream: XMLOutputStream) {
        indentation?.writeIndentation(into: stream)
        stream.write("<")
        stream.write(name)
        for attribute in attributes {
            stream.write(" ")
            stream.write(attribute.0)
            stream.write("=")
            stream.writeDoubleQuoted(attribute.1)
        }
        if children.isEmpty {
            stream.write("/>")
            indentation?.writeNewLine(into: stream)
        } else if children.count == 1, children.first is String, let child = children.first {
            stream.write(">")
            child.renderXML(into: stream)
            stream.write("</")
            stream.write(name)
            stream.write(">")
            indentation?.writeNewLine(into: stream)
        } else {
            stream.write(">")
            indentation?.writeNewLine(into: stream)
            for child in children {
                child.indentedCopy(indentation?.next).renderXML(into: stream)
            }
            indentation?.writeIndentation(into: stream)
            stream.write("</")
            stream.write(name)
            stream.write(">")
            indentation?.writeNewLine(into: stream)
        }
    }
}

extension String: XML {
    func indentedCopy(_ indentation: XMLIndentation?) -> XML {
        return self
    }

    func renderXML(into stream: XMLOutputStream) {
        stream.write(self)
    }
}

struct XMLIndentation {
    static var `initialDefault` = XMLIndentation(amount: 2, level: 0)
    static var none: XMLIndentation? = nil

    let amount: Int
    let level: Int

    var next: XMLIndentation {
        return XMLIndentation(amount: amount, level: level + 1)
    }

    func writeIndentation(into stream: XMLOutputStream) {
        stream.write(String(repeating: " ", count: amount * level))
    }

    func writeNewLine(into stream: XMLOutputStream) {
        stream.write("\n")
    }
}
