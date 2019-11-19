//
//  main.swift
//  AdventOfCode-Swift
//
//  Created by Thomas Durand on 19/11/2019.
//  Copyright © 2019 Thomas Durand. All rights reserved.
//

import Foundation

func explain() {
    print("Expected usage: `./AdventOfCode-Swift Day1`")
}

guard let className = CommandLine.arguments.last, CommandLine.arguments.count == 2 else {
    explain()
    exit(0)
}

switch className {
case "Day1":
    Day1.solve()
case "Day2":
    Day2.solve()
case "Day3":
    Day3.solve()
case "Day4":
    Day4.solve()
case "Day5":
    Day5.solve()
case "Day6":
    Day6.solve()
case "Day7":
    Day7.solve()
case "Day8":
    Day8.solve()
case "Day9":
    Day9.solve()
case "Day10":
    Day10.solve()
case "Day11":
    Day11.solve()
case "Day12":
    Day12.solve()
case "Day13":
    Day13.solve()
case "Day14":
    Day14.solve()
case "Day15":
    Day15.solve()
case "Day16":
    Day16.solve()
case "Day17":
    Day17.solve()
case "Day18":
    Day18.solve()
case "Day19":
    Day19.solve()
case "Day20":
    Day20.solve()
case "Day21":
    Day21.solve()
case "Day22":
    Day22.solve()
case "Day23":
    Day23.solve()
case "Day24":
    Day24.solve()
case "Day25":
    Day25.solve()
default:
    explain()
}
