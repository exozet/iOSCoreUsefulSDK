#if !os(watchOS)
import XCTest
@testable import iOSCoreUsefulSDK

final class iOSCoreUsefulSDKTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(iOSCoreUsefulSDK().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}

#endif
