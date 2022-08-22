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
        var result: [String?] = []

        forLoop: for char in self {
            if char == "-" {
                result.append("-")
            } else if char.isInt {
                if let last = result.last,
                   let lastValue = last
                {
                    let newValue = lastValue + String(char)
                    result.removeLast()
                    result.append(newValue)
                }
            } else if !char.isInt, result.last == "-" {
                result.removeLast()
            } else if !char.isInt,
                let last = result.last ?? "",
               last.count > 1
            {
                result.append(nil)
            }
        }
        let resultString = result.compactMap { $0 }.joined(separator: ",")
        return resultString.isEmpty ? nil : resultString
    }

}

extension Character {
    var isInt: Bool {
        Int(String(self)) != nil
    }
}
