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

    func test_addOneNumber_returnThisNumber() {
        XCTAssertEqual(sut.add("1"), 1)
        XCTAssertEqual(sut.add("2"), 2)
    }

    func test_addTwoNumbers_returnSum() {
        XCTAssertEqual(sut.add("1,2"), 3)
    }
}
