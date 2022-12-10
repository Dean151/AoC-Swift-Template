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

public protocol Expectation<Input, Output> {
    associatedtype Input
    associatedtype Output

    var expectation: Output { get }
    func getInput() async throws -> Input
}

extension Puzzle {
    /// Basic assertion from Input -> Output
    public static func assert<Output>(expectation: Output, from input: Input) -> SimpleExpectation<Input, Output> {
        SimpleExpectation(input: input, expectation: expectation)
    }

    public static func assert<Output>(expectation: Output, fromRaw raw: String) -> TransformExpectation<Input, Output> {
        TransformExpectation(raw: raw, expectation: expectation, transformer: transform)
    }
}

public struct SimpleExpectation<Input, Output>: Expectation {
    let input: Input
    public let expectation: Output

    public func getInput() -> Input {
        input
    }
}

public struct TransformExpectation<Input, Output>: Expectation {
    let raw: String
    public let expectation: Output
    let transformer: (String) async throws -> Input

    public func getInput() async throws -> Input {
        do {
            return try await transformer(raw)
        } catch {
            throw TestError.expectationFailed(message: "Could not parse raw input: `\(raw)` with error: \(error)")
        }
    }
}

extension Puzzle {
    public static var partOneExpectations: [any Expectation<Input, OutputPartOne>] {
        []
    }

    public static var partTwoExpectations: [any Expectation<Input, OutputPartTwo>] {
        []
    }

    static func testSolving<Output>(_ expectations: [any Expectation<Input, Output>], callable: (Input) async throws -> Output) async throws {
        for test in expectations {
            let input = try await test.getInput()
            let _ = try await callable(input)
        }
    }

    static func testExpectations<Output: Equatable>(_ expectations: [any Expectation<Input, Output>], callable: (Input) async throws -> Output) async throws {
        for test in expectations {
            let input = try await test.getInput()
            let result = try await callable(input)
            guard test.expectation == result else {
                throw TestError.expectationFailed(message: "\(result) do not match expected \(test.expectation) for `\(input)`")
            }
        }
    }
}

extension Puzzle {
    public static func testPartOne() async throws {
        try await testSolving(partOneExpectations, callable: solvePartOne)
    }

    public static func testPartTwo() async throws {
        try await testSolving(partTwoExpectations, callable: solvePartTwo)
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
