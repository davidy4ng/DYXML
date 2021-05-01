@resultBuilder
struct XMLBuilder {
    typealias Expression = XML
    typealias Component = [XML]

    static func buildBlock(_ components: XMLBuilder.Component...) -> XMLBuilder.Component {
        return components.flatMap { $0 }
    }

    static func buildBlock(_ component: XMLBuilder.Component) -> XMLBuilder.Component {
        return component
    }

    static func buildExpression(_ expression: Expression) -> Component {
        return [expression]
    }

    static func buildOptional(_ component: XMLBuilder.Component?) -> XMLBuilder.Component {
        return component ?? []
    }

    static func buildEither(first component: XMLBuilder.Component) -> XMLBuilder.Component {
        return component
    }

    static func buildEither(second component: XMLBuilder.Component) -> XMLBuilder.Component {
        return component
    }

    static func buildArray(_ components: [XMLBuilder.Component]) -> XMLBuilder.Component {
        return components.flatMap { $0 }
    }
}

func document(indentation: XMLIndentation? = .initialDefault, @XMLBuilder children: () -> [XML]) -> XML {
    return XMLDocument(indentation: indentation, children: children())
}

func node(_ name: String, attributes: [XMLAttribute] = [], @XMLBuilder children: () -> [XML]) -> XMLNode {
    return XMLNode(name: name, attributes: attributes, children: children())
}

func node(_ name: String, attributes: [XMLAttribute] = [], value: XML) -> XMLNode {
    return XMLNode(name: name, attributes: attributes, children: [value])
}
