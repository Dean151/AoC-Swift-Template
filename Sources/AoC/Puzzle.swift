//
//  Puzzle.swift
//  AoC-Swift-Template
//  Forked from https://github.com/Dean151/AoC-Swift-Template
//
//  Created by Thomas DURAND.
//  Follow me on Twitter @deanatoire
//  Check my computing blog on https://www.thomasdurand.fr/
//

public protocol Puzzle<Input, OutputPartOne, OutputPartTwo> {
    associatedtype Input
    associatedtype OutputPartOne
    associatedtype OutputPartTwo

    /// Should provide input for the given puzzle
    /// Some default implementation are provided for when the file input.txt exists
    static func input() async throws -> Input

    static var partOneExpectations: [Expectation<Input, OutputPartOne>] { get }
    static var partTwoExpectations: [Expectation<Input, OutputPartTwo>] { get }

    /// Should solve the first part of the puzzle
    static func solvePartOne(_ input: Input) async throws -> OutputPartOne

    /// Should solve the second part of the puzzle
    static func solvePartTwo(_ input: Input) async throws -> OutputPartTwo
}
