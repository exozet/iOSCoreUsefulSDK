#if !os(watchOS)
import XCTest

import iOSCoreUsefulSDKTests

var tests = [XCTestCaseEntry]()
tests += iOSCoreUsefulSDKTests.allTests()
XCTMain(tests)

#endif
