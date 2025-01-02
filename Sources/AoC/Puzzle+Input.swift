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

public enum InputError: Error, CustomStringConvertible {
    case unexpectedInput(unrecognized: (any StringProtocol&Sendable)? = nil)
    case couldNotCast(target: Any.Type)

    public var description: String {
        switch self {
        case .unexpectedInput(unrecognized: let string):
            guard let string else {
                return "Input transform encountered an unexpected substring"
            }
            return "Input transform encountered unexpected `\(string)`"
        case .couldNotCast(target: let type):
            return "Could not cast input to target type `\(type)`"
        }
    }
}

public enum InputSeparator {
    /// Will break the input character per character
    case breakAll
    /// Will break the input using the provided character set
    case characterSet(set: CharacterSet)
    /// Will break the input using the exact string provided
    case string(string: any StringProtocol)
}

public enum RawInputTrimMode {
    /// Will not trim anything
    case none
    /// Will trim using the given character set
    case trim(set: CharacterSet)
}

extension Puzzle {
    public static var componentsSeparator: InputSeparator { .characterSet(set: .newlines) }
    public static var rawInputTrimMode: RawInputTrimMode { .trim(set: .whitespacesAndNewlines) }
}

extension Puzzle {
    static var inputFile: URL {
        Bundle.main.bundleURL.appending(path: "AdventOfCode_\(self.self).bundle/Contents/Resources/input.txt")
    }

    /// Get the input file content as a unique string
    public static func rawInput() throws -> String {
        let raw = try String(contentsOf: inputFile)
        switch rawInputTrimMode {
        case .none:
            return raw
        case .trim(set: let set):
            return raw.trimmingCharacters(in: set)
        }
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
        let components: [String]
        switch componentsSeparator {
        case .breakAll:
            components = raw.map({ String($0) })
        case .characterSet(set: let set):
            components = raw.components(separatedBy: set)
        case .string(string: let separator):
            components = raw.components(separatedBy: separator)
        }
        return try components.map {
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
            throw InputError.couldNotCast(target: Int.self)
        }
        return integer
    }
}

extension Double: Parsable {
    public static func parse(raw: String) throws -> Double {
        guard let double = Double(raw) else {
            throw InputError.couldNotCast(target: Double.self)
        }
        return double
    }
}
