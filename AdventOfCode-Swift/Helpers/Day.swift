
import Foundation
import QuartzCore

protocol Day {
    static func run(input: String)
}

extension Day {
    static func solve() {
        let formatter = NumberFormatter()
        formatter.minimumIntegerDigits = 1
        formatter.maximumFractionDigits = 3

        guard let input = try? Input.get("\(Self.self)") else {
            print("Could not open input file \(Self.self)/input.txt")
            return
        }

        print("Solving \(Self.self)")

        let start = CACurrentMediaTime()
        run(input: input)
        let end = CACurrentMediaTime()

        let elapsed = end - start
        print("Solved \(Self.self) in \(formatter.string(from: NSNumber(value: elapsed))!)s")

        print("—————————————————————————————————")
    }
}
