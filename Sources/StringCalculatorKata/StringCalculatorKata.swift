import Foundation
public class StringCalculator {

    func add(_ str: String) -> Int {
        let strWithCommas = str.replacingOccurrences(of: "\n", with: ",")
        let subStr = strWithCommas.components(separatedBy: ",")
        return subStr.reduce(0) { $0 + $1.intValue }
    }
    
}

extension String {
    var intValue: Int {
        Int(self) ?? 0
    }
}
