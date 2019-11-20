//
//  main.swift
//  Advent-of-code-Swift-Starter
//  Forked from https://github.com/Dean151/Advent-of-code-Swift-Starter
//
//  Created by Thomas DURAND.
//  Check my computing blog on https://www.thomasdurand.fr/
//

import Foundation

if CommandLine.arguments.contains("--help"), CommandLine.arguments.count == 2 {
    AdventOfCode.explain()
    exit(0)
}
else if CommandLine.arguments.contains("--all"), CommandLine.arguments.count == 2 {
    for dayNumber in 1...25 {
        AdventOfCode.solve(day: dayNumber)
    }
    exit(0)
}
else if CommandLine.arguments.contains("--day"), CommandLine.arguments.count == 3 {
    guard let day = CommandLine.arguments.last, let dayNumber = Int(day) else {
        AdventOfCode.explain()
        exit(1)
    }
    AdventOfCode.solve(day: dayNumber)
    exit(0)
}

AdventOfCode.explain()
exit(1)
