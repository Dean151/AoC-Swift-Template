//
//  main.swift
//  Advent-of-code-Swift-Starter
//  Forked from https://github.com/Dean151/Advent-of-code-Swift-Starter
//
//  Created by Thomas DURAND.
//  Check my computing blog on https://www.thomasdurand.fr/
//

import Foundation

if CommandLine.arguments.count == 1 || CommandLine.arguments.count == 2 && CommandLine.arguments.last == "--all" {
    for dayNumber in 1...25 {
        AdventOfCode.solve(day: dayNumber)
    }
    exit(0)
}

if CommandLine.arguments.count == 2 && CommandLine.arguments.last == "--help" {
    AdventOfCode.explain()
    exit(0)
}

if CommandLine.arguments.count == 3 && CommandLine.arguments[1] == "--day" {
    guard let day = CommandLine.arguments.last, let dayNumber = Int(day) else {
        print("Error: Day number should be between within the range [1-25]")
        AdventOfCode.explain()
        exit(1)
    }
    AdventOfCode.solve(day: dayNumber)
    exit(0)
}

print("Error: unrecognized arguments")
AdventOfCode.explain()
exit(1)
