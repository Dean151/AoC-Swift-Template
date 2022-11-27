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
    /// The separator to use for the component separation
    public static var componentsSeparator: CharacterSet { .newlines }

    static var inputFile: URL {
        Bundle.main.bundleURL.appending(path: "AdventOfCode_\(self.self).bundle/Contents/Resources/input.txt")
    }

    /// Get the input file content as a unique string
    public static func rawInput() throws -> String {
        try String(contentsOf: inputFile).trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

// MARK: Parsable

public protocol Parsable {
    static func parse(raw: String) throws -> Self
}

extension Puzzle where Input: Parsable {
    public static func transform(raw: String) throws -> Input {
        try .parse(raw: raw)
    }
}

// Thanks @franklefebvre for this generic constraint syntax :)
extension Puzzle where Input: Sequence, Input.Element: Parsable {
    public static func transform(raw: String) throws -> [Input.Element] {
        try raw.components(separatedBy: componentsSeparator).map {
            try .parse(raw: $0)
        }
    }
}

extension String: Parsable {
    public static func parse(raw: String) throws -> String {
        return raw
    }
}

extension Int: Parsable {
    public static func parse(raw: String) throws -> Int {
        guard let integer = Int(raw) else {
            throw InputError.unexpectedInput
        }
        return integer
    }
}

extension Double: Parsable {
    public static func parse(raw: String) throws -> Double {
        guard let double = Double(raw) else {
            throw InputError.unexpectedInput
        }
        return double
    }
}
