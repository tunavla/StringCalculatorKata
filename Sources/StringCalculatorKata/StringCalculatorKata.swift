public class StringCalculator {

    func add(_ str: String) -> Int {
        str.split(separator: ",").reduce(0) { $0 + $1.intValue }
    }
    
}

extension Substring {
    var intValue: Int {
        Int(self) ?? 0
    }
}
