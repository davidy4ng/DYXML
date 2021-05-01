@resultBuilder
public struct XMLBuilder {
    public typealias Expression = XML
    public typealias Component = [XML]

    public static func buildBlock(_ components: XMLBuilder.Component...) -> XMLBuilder.Component {
        return components.flatMap { $0 }
    }

    public static func buildBlock(_ component: XMLBuilder.Component) -> XMLBuilder.Component {
        return component
    }

    public static func buildExpression(_ expression: Expression) -> Component {
        return [expression]
    }

    public static func buildOptional(_ component: XMLBuilder.Component?) -> XMLBuilder.Component {
        return component ?? []
    }

    public static func buildEither(first component: XMLBuilder.Component) -> XMLBuilder.Component {
        return component
    }

    public static func buildEither(second component: XMLBuilder.Component) -> XMLBuilder.Component {
        return component
    }

    public static func buildArray(_ components: [XMLBuilder.Component]) -> XMLBuilder.Component {
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
