extension XML {
    /// Returns the XML as a string. No indentation or new lines will be inserted. Is the equivalent of calling `toString(withIndentation: nil)`
    public var string: String {
        return self.toString()
    }

    /// Returns the XML as a string with indentation and new lines
    /// - Parameter space: the number of spaces a level of indentation. If space is `nil`, no indentation or new lines will be inserted.
    /// - Returns: the content XML as a string
    public func toString(withIndentation space: Int? = nil) -> String {
        let xmlOutputStreamString = XMLOutputStreamString(indentation: space)
        renderXML(into: xmlOutputStreamString)
        return xmlOutputStreamString.output
    }
}
