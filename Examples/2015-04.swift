//
//  Day04.swift
//  AoC-Swift-Template
//  Forked from https://github.com/Dean151/AoC-Swift-Template
//
//  Created by Thomas DURAND.
//  Follow me on Twitter @deanatoire
//  Check my computing blog on https://www.thomasdurand.fr/
//

import Foundation
import Crypto

import AoC
import Common

@main
struct Day04: Puzzle {
    typealias Input = String
    typealias OutputPartOne = Int
    typealias OutputPartTwo = Int

    static func rawInput() async throws -> String {
        "iwrupvqb"
    }

    static func findValue(_ maximal: UInt8, input: String) throws -> Int {
        for value in 1...9999999 {
            var algo = Insecure.MD5()
            algo.update(data: "\(input)\(value)".data(using: .utf8).unsafelyUnwrapped)
            let hash = algo.finalize()
            let prefix = hash.withUnsafeBytes({ Array($0.prefix(3)) })
            if prefix[0] == 0 && prefix[1] == 0 && prefix[2] <= maximal {
                return value
            }
        }
        throw ExecutionError.notSolved
    }
}

// MARK: - PART 1

extension Day04 {
    static var partOneExpectations: [any Expectation<Input, OutputPartOne>] {
        [
            assert(expectation: 609043, from: "abcdef"),
            assert(expectation: 1048970, from: "pqrstuv"),
        ]
    }

    static func solvePartOne(_ input: Input) async throws -> OutputPartOne {
        try findValue(15, input: input) // 15 is 0x09
    }
}

// MARK: - PART 2

extension Day04 {
    static func solvePartTwo(_ input: Input) async throws -> OutputPartTwo {
        try findValue(0, input: input) // 0 is 0x00
    }
}
