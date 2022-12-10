//
//  Puzzle+Execute.swift
//  AoC-Swift-Template
//  Forked from https://github.com/Dean151/AoC-Swift-Template
//
//  Created by Thomas DURAND.
//  Follow me on Twitter @deanatoire
//  Check my computing blog on https://www.thomasdurand.fr/
//

import Foundation

public enum ExecutionError: Error, CustomStringConvertible {
    case notSolved
    case unsolvable

    public var description: String {
        switch self {
        case .unsolvable:
            return "Puzzle couldn‘t find a solution"
        case .notSolved:
            return "Puzzle implementation is not yet provided"
        }
    }
}

extension Puzzle {
    public static func main() async {
        let start: DispatchTime
        let input: Input
        do {
            // Input resolution
            let rawInput = try await rawInput()

            start = .now()
            input = try await transform(raw: rawInput)
        } catch {
            print("Input parsing failed: \(error)")
            exit(1)
        }

        do {
            // Part 1
            let part1 = try await solvePartOne(input)
            print("\(self.self)-1 has been solved!")
            if !(part1 is Void) {
                print(part1)
            }
        } catch {
            print("\(self.self)-1 failed: \(error)")
        }

        printSeparator()

        do {
            // Part 2
            let part2 = try await solvePartTwo(input)
            print("\(self.self)-2 has been solved!")
            if !(part2 is Void) {
                print(part2)
            }
        } catch {
            print("\(self.self)-2 failed: \(error)")
        }

        printSeparator()
        printElapsedTime(from: start)
    }

    static func printElapsedTime(from start: DispatchTime) {
        let elapsed = Double(DispatchTime.now().uptimeNanoseconds - start.uptimeNanoseconds) / 1_000_000_000
        let formatter = NumberFormatter()
        formatter.minimumIntegerDigits = 1
        formatter.minimumFractionDigits = 4
        formatter.maximumFractionDigits = 4
        print("Elapsed time: \(formatter.string(from: NSNumber(value: elapsed))!)s")
    }

    static func printSeparator() {
        print("––––––––––")
    }
}
