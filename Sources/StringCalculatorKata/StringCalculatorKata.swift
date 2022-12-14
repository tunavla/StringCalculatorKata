import Foundation

enum StringCalculatorError: Error {
    case containNegative(String)
}

public class StringCalculator {
    let maxNumber = 1_000

    func add(_ str: String) throws -> Int {
        guard !str.isEmpty else { return -1 }
        if let negativeNumber = findNegative(str) {
            throw StringCalculatorError
                .containNegative("Negatives not allowed: " + negativeNumber)
        }
        let subStr = str.components(separatedBy: CharacterSet.decimalDigits.inverted)

        return subStr
            .map { $0.intValue }
            .filter { $0 <= maxNumber }
            .reduce(0, +)
    }

    private func findNegative(_ str: String) -> String? {
        let resultDict = getNegativeNumbers(str: str)
        let resultString = resultDict.compactMap { $0 }.joined(separator: ",")
        return resultString.isEmpty ? nil : resultString
    }

    private func getNegativeNumbers(str: String) -> [String?] {
        var result: [String?] = []
        for char in str {
            if char == "-" {
                result.append("-")
                continue
            }
            guard let last = result.last,
                  let lastValue = last
            else { continue }

            if char.isNumber {
                let newValue = lastValue + String(char)
                result.removeLast()
                result.append(newValue)
            } else {
                if last == "-" {
                    result.removeLast()
                } else if (last ?? "").count > 1 {
                    result.append(nil)
                }
            }
        }
        return result
    }
}

private extension String {
    var intValue: Int {
        Int(self) ?? 0
    }
}
