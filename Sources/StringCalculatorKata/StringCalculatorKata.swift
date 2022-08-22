import Foundation
public class StringCalculator {

    func add(_ str: String) -> Int {
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
}

extension Character {
    var isInt: Bool {
        Int(String(self)) != nil
    }
}
