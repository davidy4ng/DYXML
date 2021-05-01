extension String: XML {
    public func renderXML(into stream: XMLOutputStream) {
        stream.write(self)
    }
}
