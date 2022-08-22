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

    func test_addNumeralNumbers_returnSum() {
        XCTAssertEqual(sut.add("1,2,3,4"), 10)
        XCTAssertEqual(sut.add("5,5,5,5,5,5,5,5,5,5,5,5,5,5"), 70)
        XCTAssertEqual(sut.add("1,1,1,1,1,1,1"), 7)
    }

    func test_addHugeCountOfNumbers_returnSum() {
        let number = 15
        let count = 150
        let input = generateBigLine(number, count)
        let result = number * count

        XCTAssertEqual(sut.add(input), result)
    }



    private func generateBigLine(_ number: Int,_ count: Int) -> String {
        var result = ""
        for _ in 0..<count {
            result.append(String(describing: number) + ",")
        }
        result.removeLast()
        return result
    }
}
