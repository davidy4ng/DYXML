import XCTest

import DYXMLTests

var tests = [XCTestCaseEntry]()
tests += XMLTests.allTests()
tests += XMLBuilderTests.allTests()
XCTMain(tests)
