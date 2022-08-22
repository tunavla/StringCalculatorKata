import XCTest
@testable import StringCalculatorKata

final class StringCalculatorTests: XCTestCase {
    private var sut: StringCalculator!
    override func setUp() {
        super.setUp()
        sut = StringCalculator()
    }

    func test_addEmpty_returnZero() {
        XCTAssertEqual(sut.add(""), 0)
    }
}
