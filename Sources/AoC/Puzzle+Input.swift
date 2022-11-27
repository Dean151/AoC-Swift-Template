//
//  Puzzle+Input.swift
//  AoC-Swift-Template
//  Forked from https://github.com/Dean151/AoC-Swift-Template
//
//  Created by Thomas DURAND.
//  Follow me on Twitter @deanatoire
//  Check my computing blog on https://www.thomasdurand.fr/
//

import Foundation

public enum InputError: Error {
    case unexpectedInput
}

extension Puzzle {
    /// The separator to use for the first component separation
    public static var componentsSeparator: CharacterSet { .newlines }

    /// The separator to use for the secondary component separation
    public static var subcomponentsSeparator: CharacterSet { .whitespaces }

    private static var inputFile: URL {
        Bundle.main.bundleURL.appending(path: "AdventOfCode_\(self.self).bundle/Contents/Resources/input.txt")
    }

    /// Get the input file content as a unique string
    public static func inputFileContent() throws -> String {
        try String(contentsOf: inputFile).trimmingCharacters(in: .whitespacesAndNewlines)
    }

    /// Get the input file content components separated by `mainSeparator` character set
    public static func inputFileComponents() throws -> [String] {
        try inputFileContent().components(separatedBy: componentsSeparator)
    }

    /// Get the input file content components as array of components separated by `mainSeparator` character set and then `secondarySeparator`
    public static func inputFileSubcomponents() throws -> [[String]] {
        try inputFileContent().components(separatedBy: componentsSeparator).map({ $0.components(separatedBy: subcomponentsSeparator )})
    }
}

// MARK: Public helpers on strings

extension String {
    public func toInt() throws -> Int {
        guard let integer = Int(self) else {
            throw InputError.unexpectedInput
        }
        return integer
    }
    public func toDouble() throws -> Double {
        guard let double = Double(self) else {
            throw InputError.unexpectedInput
        }
        return double
    }
}

// MARK: Default input implementations

extension Puzzle where Input == String {
    public static func input() async throws -> Input {
        try inputFileContent()
    }
}

extension Puzzle where Input == [String] {
    public static func input() async throws -> Input {
        try inputFileComponents()
    }
}

extension Puzzle where Input == [[String]] {
    public static func input() async throws -> Input {
        try inputFileSubcomponents()
    }
}

extension Puzzle where Input == Int {
    public static func input() async throws -> Input {
        try inputFileContent().toInt()
    }
}

extension Puzzle where Input == [Int] {
    public static func input() async throws -> Input {
        try inputFileComponents().map { try $0.toInt() }
    }
}

extension Puzzle where Input == [[Int]] {
    public static func input() async throws -> Input {
        try inputFileSubcomponents().map { try $0.map { try $0.toInt() } }
    }
}

extension Puzzle where Input == Double {
    public static func input() async throws -> Input {
        try inputFileContent().toDouble()
    }
}

extension Puzzle where Input == [Double] {
    public static func input() async throws -> Input {
        try inputFileComponents().map { try $0.toDouble() }
    }
}

extension Puzzle where Input == [[Double]] {
    public static func input() async throws -> Input {
        try inputFileSubcomponents().map { try $0.map { try $0.toDouble() } }
    }
}
