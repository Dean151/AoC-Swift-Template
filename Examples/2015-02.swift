//
//  Day02.swift
//  AoC-Swift-Template
//  Forked from https://github.com/Dean151/AoC-Swift-Template
//
//  Created by Thomas DURAND.
//  Follow me on Twitter @deanatoire
//  Check my computing blog on https://www.thomasdurand.fr/
//

import Foundation

import AoC
import Common

struct Box: Parsable {
    let small: Int
    let middle: Int
    let large: Int

    static func parse(raw: String) throws -> Box {
        let components = raw.components(separatedBy: "x").compactMap({ Int($0) }).sorted()
        guard components.count == 3 else {
            throw InputError.unexpectedInput
        }
        return .init(small: components[0], middle: components[1], large: components[2])
    }

    var paperArea: Int {
        3*small*middle + 2*small*large + 2*middle*large
    }

    var ribbonLength: Int {
        2*small + 2*middle + small*middle*large
    }
}

@main
struct Day02: Puzzle {
    typealias Input = [Box]
    typealias OutputPartOne = Int
    typealias OutputPartTwo = Int
}

// MARK: - PART 1

extension Day02 {
    static var partOneExpectations: [any Expectation<Input, OutputPartOne>] {
        [
            assert(expectation: 58, fromRaw: "2x3x4"),
            assert(expectation: 43, fromRaw: "1x1x10"),
            assert(expectation: 101, fromRaw: "2x3x4\n1x1x10"),
        ]
    }

    static func solvePartOne(_ input: Input) async throws -> OutputPartOne {
        input.reduce(0, { $0 + $1.paperArea })
    }
}

// MARK: - PART 2

extension Day02 {
    static var partTwoExpectations: [any Expectation<Input, OutputPartTwo>] {
        [
            assert(expectation: 34, fromRaw: "2x3x4"),
            assert(expectation: 14, fromRaw: "1x1x10"),
            assert(expectation: 48, fromRaw: "2x3x4\n1x1x10"),
        ]
    }

    static func solvePartTwo(_ input: Input) async throws -> OutputPartTwo {
        input.reduce(0, { $0 + $1.ribbonLength })
    }
}
