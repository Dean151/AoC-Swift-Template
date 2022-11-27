//
//  Puzzle+Test.swift
//  AoC-Swift-Template
//  Forked from https://github.com/Dean151/AoC-Swift-Template
//
//  Created by Thomas DURAND.
//  Follow me on Twitter @deanatoire
//  Check my computing blog on https://www.thomasdurand.fr/
//

enum TestError: Error {
    case testFailed(message: String)
}

public struct Expectation<Input, Output> {
    public let input: Input
    public let expectation: Output

    public static func assertThat(_ input: Input, willOutput expectation: Output) -> Self {
        Self(input: input, expectation: expectation)
    }
}

extension Puzzle {
    public static var partOneExpectations: [Expectation<Input, OutputPartOne>] {
        []
    }

    public static var partTwoExpectations: [Expectation<Input, OutputPartTwo>] {
        []
    }
}

extension Puzzle where OutputPartOne: Equatable {
    public static func testPartOne() async throws {
        for test in partOneExpectations {
            let result = try await solvePartOne(test.input)
            guard test.expectation == result else {
                throw TestError.testFailed(message: "Part 1 failed: \(result) do not match expected \(test.expectation) for \(test.input)")
            }
        }
    }
}

extension Puzzle where OutputPartTwo: Equatable {
    public static func testPartTwo() async throws {
        for test in partTwoExpectations {
            let result = try await solvePartTwo(test.input)
            guard test.expectation == result else {
                throw TestError.testFailed(message: "Part 2 failed: \(result) do not match expected \(test.expectation) for \(test.input)")
            }
        }
    }
}
