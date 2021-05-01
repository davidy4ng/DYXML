@resultBuilder
public struct XMLBuilder {
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

public func document(@XMLBuilder children: () -> [XML]) -> XML {
    return XMLDocument(children: children())
}

public func node(_ name: String, attributes: [XMLAttribute] = [], @XMLBuilder children: () -> [XML]) -> XML {
    return XMLNode(name: name, attributes: attributes, children: children())
}

public func node(_ name: String, attributes: [XMLAttribute] = [], value: XML) -> XML {
    return XMLNode(name: name, attributes: attributes, children: [value])
}
