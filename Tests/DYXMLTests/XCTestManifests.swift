import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(XMLTests.allTests),
        testCase(XMLBuilderTests.allTests),
    ]
}
#endif
