//
//  Puzzle+Test.swift
//  AoC-Swift-Template
//  Forked from https://github.com/Dean151/AoC-Swift-Template
//
//  Created by Thomas DURAND.
//  Follow me on Twitter @deanatoire
//  Check my computing blog on https://www.thomasdurand.fr/
//

public enum TestError: Error {
    case expectationFailed(message: String)
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

    static func testExpectations<Output: Equatable>(_ expectations: [Expectation<Input, Output>], callable: (Input) async throws -> Output) async throws {
        for test in expectations {
            let result = try await callable(test.input)
            guard test.expectation == result else {
                throw TestError.expectationFailed(message: "\(result) do not match expected \(test.expectation) for `\(test.input)`")
            }
        }
    }
}

extension Puzzle where OutputPartOne: Equatable {
    public static func testPartOne() async throws {
        try await testExpectations(partOneExpectations, callable: solvePartOne)
    }
}

extension Puzzle where OutputPartTwo: Equatable {
    public static func testPartTwo() async throws {
        try await testExpectations(partTwoExpectations, callable: solvePartTwo)
    }
}
