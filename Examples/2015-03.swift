//
//  Day03.swift
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

struct House: Hashable {
    let x: Int
    let y: Int

    static let initial = House(x: 0, y: 0)

    func go(_ direction: Direction) -> House {
        switch direction {
        case .north:
            return .init(x: x, y: y-1)
        case .south:
            return .init(x: x, y: y+1)
        case .west:
            return .init(x: x-1, y: y)
        case .east:
            return .init(x: x+1, y: y)
        }
    }
}

enum Direction: Parsable {
    case north
    case south
    case west
    case east

    static func parse(raw: String) throws -> Direction {
        switch raw {
        case "^":
            return .north
        case "v":
            return .south
        case "<":
            return .west
        case ">":
            return .east
        default:
            throw InputError.unexpectedInput(unrecognized: raw)
        }
    }
}

@main
struct Day03: Puzzle {
    typealias Input = [Direction]
    typealias OutputPartOne = Int
    typealias OutputPartTwo = Int

    // Passing nil will make the parser to explode all the string char by char
    static var componentsSeparator: InputSeparator {
        .breakAll
    }
}

// MARK: - PART 1

extension Day03 {
    static var partOneExpectations: [any Expectation<Input, OutputPartOne>] {
        [
            assert(expectation: 2, fromRaw: ">"),
            assert(expectation: 4, fromRaw: "^>v<"),
            assert(expectation: 2, fromRaw: "^v^v^v^v^v"),
        ]
    }

    static func solvePartOne(_ input: Input) async throws -> OutputPartOne {
        var current = House.initial
        var visited: Set<House> = [current]
        for direction in input {
            current = current.go(direction)
            visited.insert(current)
        }
        return visited.count
    }
}

// MARK: - PART 2

extension Day03 {
    static var partTwoExpectations: [any Expectation<Input, OutputPartTwo>] {
        [
            assert(expectation: 3, fromRaw: "^v"),
            assert(expectation: 3, fromRaw: "^>v<"),
            assert(expectation: 11, fromRaw: "^v^v^v^v^v"),
        ]
    }

    static func solvePartTwo(_ input: Input) async throws -> OutputPartTwo {
        var santa = House.initial
        var robot = House.initial
        var visited: Set<House> = [santa]
        for (index, direction) in input.enumerated() {
            if index % 2 == 0 {
                santa = santa.go(direction)
                visited.insert(santa)
            } else {
                robot = robot.go(direction)
                visited.insert(robot)
            }
        }
        return visited.count
    }
}
