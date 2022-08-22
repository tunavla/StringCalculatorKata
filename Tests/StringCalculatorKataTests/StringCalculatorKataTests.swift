import XCTest
@testable import StringCalculatorKata

final class StringCalculatorTests: XCTestCase {
    private var sut: StringCalculator!
    override func setUp() {
        super.setUp()
        sut = StringCalculator()
    }

    func test_addEmpty_returnZero() throws {
        XCTAssertEqual(try sut.add(""), 0)
    }

    func test_addOneNumber_returnThisNumber() throws {
        XCTAssertEqual(try sut.add("1"), 1)
        XCTAssertEqual(try sut.add("2"), 2)
    }

    func test_addTwoNumbers_returnSum() throws {
        XCTAssertEqual(try sut.add("1,2"), 3)
    }
    func test_addHugeCountOfNumbers_returnSum() throws {
        let number = 15
        let count = 150
        let input = generateBigLine(number, count)
        let result = number * count

        XCTAssertEqual(try sut.add(input), result)
    }

    func test_addNumbersSeparationByNewLine_returnSum() throws {
        XCTAssertEqual(try sut.add("1\n2,3,4"), 10)
        XCTAssertEqual(try sut.add("1,2\n3,4"), 10)
        XCTAssertEqual(try sut.add("1,2,3\n4"), 10)
    }

    func test_stringWithDelimiters_returnSum() throws {
        XCTAssertEqual(try sut.add("//;\n1;2"), 3)
    }

    func test_stringContainOneNegativeNumber_returnErrorWithNumbers() throws {
        let result = "Negatives not allowed: -1"
        do {
            _ = try sut.add("-1,2")
        } catch StringCalculatorError.containNegative(let message){
            XCTAssertEqual(message, result)
        } 
    }

    func test_stringContainFewNegativeNumber_returnErrorWithNumbers() throws {
        let result = "Negatives not allowed: -4,-5"
        let string = "2,-4,3,-5"
        do {
            _ = try sut.add(string)
        } catch StringCalculatorError.containNegative(let message){
            XCTAssertEqual(message, result)
        }
    }

    func test_stringContain2_1001_returnSum() throws {
        XCTAssertEqual(try sut.add("1001,2"), 2)
    }

    func test_differentDelimiters_returnSum() {
        XCTAssertEqual(try sut.add("//[|||]\n1|||2|||3"), 6)
        XCTAssertEqual(try sut.add("//[|][%]\n1|2%3"), 6)
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
