import Foundation

enum StringCalculatorError: Error {
    case containNegative(String)
}

public class StringCalculator {

    func add(_ str: String) throws -> Int {
        if let negativeNumber = str.findNegative() {
            throw StringCalculatorError
                .containNegative("Negatives not allowed: " + negativeNumber)
        }
        let subStr = str.components(separatedBy:  CharacterSet.decimalDigits.inverted)

        return subStr.reduce(0) { $0 + $1.intValue }

    }
    
}

extension String {
    var intValue: Int {
        Int(self) ?? 0
    }

    var isInt: Bool {
        Int(self) != nil
    }

    func findNegative() -> String? {
        var result: String?

        forLoop: for char in self {
            if char == "-" {
                result = "-"
            } else if char.isInt, result != nil {
                result?.append(char)
            } else if !char.isInt, result == "-" {
                result = nil
            } else if !char.isInt, (result?.count ?? 0) > 1 {
                break forLoop
            }
        }
        return result
    }

}

extension Character {
    var isInt: Bool {
        Int(String(self)) != nil
    }
}
