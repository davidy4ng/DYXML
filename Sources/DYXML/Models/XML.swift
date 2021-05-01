public protocol XML {
    func renderXML(into stream: XMLOutputStream)
}

public typealias XMLAttribute = (String, String)
