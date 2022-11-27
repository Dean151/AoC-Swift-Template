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

public enum ExecutionError: Error {
    case notSolved
    case unsolvable
}

extension Puzzle {
    static func solve() async {
        do {
            // Input resolution
            let input = try await input()

            let start = DispatchTime.now()

            // Part 1
            let part1 = try await solvePartOne(input)
            print("\(self.self)-1 has been solved!")
            print(part1)

            printSeparator()

            // Part 2
            let part2 = try await solvePartTwo(input)
            print("\(self.self)-2 has been solved!")
            print(part2)

            printSeparator()
            printElapsedTime(from: start)
        } catch {
            print("Execution raised an error: \(error)")
            exit(1)
        }
    }

    static func printElapsedTime(from start: DispatchTime) {
        let elapsed = Double(DispatchTime.now().uptimeNanoseconds - start.uptimeNanoseconds) / 1_000_000_000
        let formatter = NumberFormatter()
        formatter.minimumIntegerDigits = 1
        formatter.maximumFractionDigits = 3
        print("Elapsed time: \(formatter.string(from: NSNumber(value: elapsed))!)s")
    }

    static func printSeparator() {
        print("––––––––––")
    }
}

extension Puzzle {
    public static func main() async {
        await solve()
    }
}

extension Puzzle where OutputPartOne: Equatable, OutputPartTwo: Equatable {
    public static func main() async {
        do {
            // Tests
            try await testPartOne()
            try await testPartTwo()
        } catch {
            print("Tests raised an error: \(error)")
            exit(1)
        }

        await solve()
    }
}
