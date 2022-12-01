//
//  Day01.swift
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

@main
struct Day01: Puzzle {
    typealias Input = String
    typealias OutputPartOne = Int
    typealias OutputPartTwo = Int
}

// MARK: - PART 1

extension Day01 {
    static var partOneExpectations: [any Expectation<Input, OutputPartOne>] {
        [
            assert(expectation: 0, from: "(())"),
            assert(expectation: 0, from: "()()"),
            assert(expectation: 3, from: "((("),
            assert(expectation: 3, from: "(()(()("),
            assert(expectation: 3, from: "))((((("),
            assert(expectation: -1, from: "())"),
            assert(expectation: -1, from: "))("),
            assert(expectation: -3, from: ")))"),
            assert(expectation: -3, from: ")())())"),
        ]
    }

    static func solvePartOne(_ input: Input) async throws -> OutputPartOne {
        try input.reduce(0) {
            switch $1 {
            case "(":
                return $0 + 1
            case ")":
                return $0 - 1
            default:
                throw InputError.unexpectedInput(unrecognized: $1)
            }
        }
    }
}

// MARK: - PART 2

extension Day01 {
    static var partTwoExpectations: [any Expectation<Input, OutputPartTwo>] {
        [
            assert(expectation: 1, from: ")"),
            assert(expectation: 5, from: "()())"),
            assert(expectation: 1, from: ")()()()"),
            assert(expectation: 5, from: "()())()()()()"),
        ]
    }

    static func solvePartTwo(_ input: Input) async throws -> OutputPartTwo {
        var level = 0
        for (index, char) in input.enumerated() {
            switch char {
            case "(":
                level += 1
            case ")":
                level -= 1
            default:
                throw InputError.unexpectedInput(unrecognized: $1)
            }
            if level == -1 {
                return index + 1
            }
        }
        throw ExecutionError.unsolvable
    }
}
