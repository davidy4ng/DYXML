public protocol XMLOutputStream: TextOutputStream {
    func write(_ string: String)
    func writeNewLine()
    func writeIndentation()
    func writeOrphanTag(_ name: String, attributes: [(String, String)]?)
    func writeOpeningTag(_ name: String, attributes: [(String, String)]?)
    func writeClosingTag(_ name: String)
    func incrementIndentationLevel()
    func decrementIndentationLevel()
}

final class XMLOutputStreamString: XMLOutputStream {
    let indentation: Int?
    private var indentationLevel: Int = 0
    private(set) var output: String = ""

    init(indentation: Int? = nil) {
        self.indentation = indentation
    }

    func write(_ string: String) {
        output += string
    }

    func writeNewLine() {
        guard indentation != nil else { return }
        write("\n")
    }

    func writeIndentation() {
        guard let indentation = indentation else { return }
        write(String(repeating: " ", count: indentation * indentationLevel))
    }

    func writeOrphanTag(_ name: String, attributes: [(String, String)]?) {
        let tagComponents = [name, buildAttributesString(attributes)]
            .compactMap { $0 }
            .joined(separator: " ")
        write("<\(tagComponents)/>")
    }

    func writeOpeningTag(_ name: String, attributes: [(String, String)]?) {
        let tagComponents = [name, buildAttributesString(attributes)]
            .compactMap { $0 }
            .joined(separator: " ")
        write("<\(tagComponents)>")
    }

    func writeClosingTag(_ name: String) {
        write("</\(name)>")
    }

    func incrementIndentationLevel() {
        self.indentationLevel += 1
    }

    func decrementIndentationLevel() {
        guard indentationLevel > 0 else { return }
        self.indentationLevel -= 1
    }

    private func buildAttributesString(_ attributes: [(String, String)]?) -> String? {
        guard let attributes = attributes, !attributes.isEmpty else {
            return nil
        }
        return attributes
            .map { key, value in
                return "\(key)=\"\(value)\""
            }
            .joined(separator: " ")
    }
}
