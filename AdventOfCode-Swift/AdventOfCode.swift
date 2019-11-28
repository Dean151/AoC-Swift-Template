//
//  AdventOfCode.swift
//  Advent-of-code-Swift-Starter
//  Forked from https://github.com/Dean151/Advent-of-code-Swift-Starter
//
//  Created by Thomas DURAND.
//  Check my computing blog on https://www.thomasdurand.fr/
//

import Foundation

enum AdventOfCode {
    /// Print an helper instructions to end-user to acknoledge existing commands
    static func explain() {
        print("Advent-of-code-Swift")
        print("")
        print("./AdventOfCode-Swift --day 1 : Run day 1 solving")
        print("./AdventOfCode-Swift --all : Solve every days one after another")
        print("./AdventOfCode-Swift --help : Show this explaination: ``")
        print("")
        print("More documentation on https://github.com/Dean151/Advent-of-code-Swift-Starter")
        print("If you have problem using this template, fill Github issues ; and/or ask me on Twitter @deanatoire")
    }

    /// Will solve given day output
    static func solve(day dayNumber: Int) {
        switch dayNumber {
        case 1:
            Day01.solve()
        case 2:
            Day02.solve()
        case 3:
            Day03.solve()
        case 4:
            Day04.solve()
        case 5:
            Day05.solve()
        case 6:
            Day06.solve()
        case 7:
            Day07.solve()
        case 8:
            Day08.solve()
        case 9:
            Day09.solve()
        case 10:
            Day10.solve()
        case 11:
            Day11.solve()
        case 12:
            Day12.solve()
        case 13:
            Day13.solve()
        case 14:
            Day14.solve()
        case 15:
            Day15.solve()
        case 16:
            Day16.solve()
        case 17:
            Day17.solve()
        case 18:
            Day18.solve()
        case 19:
            Day19.solve()
        case 20:
            Day20.solve()
        case 21:
            Day21.solve()
        case 22:
            Day22.solve()
        case 23:
            Day23.solve()
        case 24:
            Day24.solve()
        case 25:
            Day25.solve()
        default:
            explain()
        }
    }
}

protocol Day {
    static func run(input: String)
}

extension Day {
    static func solve(withTimeSpan: Bool = true) {
        guard let input = try? Input.get("\(Self.self)") else {
            print("Could not open input file Days/\(Self.self)/input.txt")
            return
        }

        print("Solving \(Self.self)")

        let start = DispatchTime.now()
        run(input: input)
        let end = DispatchTime.now()

        print("Solved \(Self.self)")
        if withTimeSpan {
            let elapsed = end - start
            let formatter = NumberFormatter()
            formatter.minimumIntegerDigits = 1
            formatter.maximumFractionDigits = 3
            print("Elapsed time: \(formatter.string(from: NSNumber(value: elapsed))!)s")
        }

        print("---------------------")
    }
}

enum Input {
    static let projectUrl = URL(fileURLWithPath: #file).deletingLastPathComponent()

    static func get(_ day: String) throws -> String {
        let url = projectUrl.appendingPathComponent("Days/\(day)/input.txt")
        let inputData = try Data(contentsOf: url)
        guard let input = String(data: inputData, encoding: .utf8) else {
            throw NSError() as Error
        }
        return input
    }
}
