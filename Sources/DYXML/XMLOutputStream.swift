protocol XMLOutputStream: TextOutputStream {
    func write(_ string: String)
    func writeDoubleQuoted(_ string: String)
}

final private class XMLOutputStreamString: XMLOutputStream {
    private(set) var output: String = ""

    func write(_ string: String) {
        output += string
    }

    func writeDoubleQuoted(_ string: String) {
        output += "\"\(string)\""
    }
}

extension XML {
    var string: String {
        let xmlOutputStreamString = XMLOutputStreamString()
        renderXML(into: xmlOutputStreamString)
        return xmlOutputStreamString.output
    }
}
