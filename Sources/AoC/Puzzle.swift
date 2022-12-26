//
//  Puzzle.swift
//  AoC-Swift-Template
//  Forked from https://github.com/Dean151/AoC-Swift-Template
//
//  Created by Thomas DURAND.
//  Follow me on Twitter @deanatoire
//  Check my computing blog on https://www.thomasdurand.fr/
//

import Foundation

public protocol Puzzle<Input, OutputPartOne, OutputPartTwo> {
    associatedtype Input
    associatedtype OutputPartOne
    associatedtype OutputPartTwo

    /// Should provide raw input for the given puzzle
    /// A default implementation are provided for when the file input.txt exists
    static func rawInput() async throws -> String

    /// Should transform the raw string input into the required Input
    static func transform(raw: String) async throws -> Input

    /// The trimming method to use on the input
    static var rawInputTrimMode: RawInputTrimMode { get }

    /// The separator to use for the component separation
    static var componentsSeparator: InputSeparator { get }

    static var partOneExpectations: [any Expectation<Input, OutputPartOne>] { get }
    static var partTwoExpectations: [any Expectation<Input, OutputPartTwo>] { get }

    /// Should solve the first part of the puzzle
    static func solvePartOne(_ input: Input) async throws -> OutputPartOne

    /// Should solve the second part of the puzzle
    static func solvePartTwo(_ input: Input) async throws -> OutputPartTwo
}
