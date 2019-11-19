
import Foundation

class Input {
    static let inputURL = URL(fileURLWithPath: #file)
        .deletingLastPathComponent()
        .deletingLastPathComponent()

    static func get(_ day: String) throws -> String {
        let url = inputURL.appendingPathComponent("Sources/\(day)/input.txt")
        let inputData = try Data(contentsOf: url)
        guard let input = String(data: inputData, encoding: .utf8) else {
            throw NSError() as Error
        }
        return input
    }
}
