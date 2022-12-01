# AoC-Swift-Template

Attempting the Advent of Code using Swift?

Don't bother finding the input files ; or hard-coding the puzzle input, use this template intead to start quickly!

![Project screenshot](https://raw.githubusercontent.com/Dean151/AoC-Swift-Template/main/Screenshot.png)

## Features

- Built using latest Swift technologies: async, await & generics
- Don't think on how to parse your input, just parse it!
- Easy to write tests assertions that are often provided in the puzzle description
- Execution timer to know how you perform

## Acknoledgements

- Thanks [@ericwastl](https://twitter.com/ericwastl) for creating Advent of Code and keeping it alive!
- Thanks [@franklefebvre](https://github.com/franklefebvre) for an help on a Swift Generic syntax

## Get Started

1. Choose your day in the target selector of Xcode ; and open the DayXX.swift
2. Either copy your input in corresponding `input.txt` file, or override `static func rawInput() async throws -> String`
```
static func rawInput() async throws -> String {
    "iwrupvqb"
}
```
3. Add the Input & Output types depending on the Puzzle ; Keep Never for Part2 until you get there, since type might change between Part 1 and 2
```
struct Day01: Puzzle {
    typealias Input = String
    typealias OutputPartOne = Int
    typealias OutputPartTwo = Int
}
```
4. Add assertions with expected results for the first part of the puzzle using the API, and now tests (⌘+U) are failing
```
static var partOneExpectations: [any Expectation<Input, OutputPartOne>] {
    [
        assert(expectation: 1, from: ")"),
        assert(expectation: 5, from: "()())"),
        ...
    ]
}
```
5. Resolve part1 puzzle by implementing `static func solvePartOne(_ input: Input) async throws` until tests are passing
6. Run (⌘+R) ; and puzzle solution will be printed in console
7. Do the same for part2 with `static var partTwoExpectations` and `static func solvePartTwo(_ input: Input) async throws`

### Use your own types

Often, you'll require your own types.
This will require to make them "Parsable"

Simply implement the Parsable protocol, and then use your type as an Input:
```
struct Box: Parsable { ... }

struct Day02: Puzzle {
    typealias Input = Box
}
```

Your parsable type can also be implicitly passed in an array. In that case, the separation of the input will use `static var componentsSeparator: CharacterSet` to separate the Input before calling `static parse(raw: String)`:
```
struct Box: Parsable { ... }

struct Day02: Puzzle {
    typealias Input = [Box]
}
```

To test your parsing code, you can also use assertion to use "raw" input instead of parsed input:
```
static var partOneExpectations: [any Expectation<Input, OutputPartOne>] {
    [
        // Either provide the fully parsed input (your type))
        assert(expectation: 58, from: [.init(small: 2, medium: 3, large: 4)],
        // Or a raw string that should be parsed (this will allow to test your parsing code as well)
        assert(expectation: 43, fromRaw: "1x1x10"),
        ...
    ]
}
```

### Provided errors:

- When an input is not parsable: `throw InputError.unexpectedInput` or `throw InputError.couldNotCast(target: Double.self)`
- When a puzzle has no solution (should not happen, but prevent returning a default value): `throw ExecutionError.unsolvable`

## Examples:

The first four days of 2015 have been solved, and hare in the Examples folder.
They give some input on what your solution could look like when using this template.

![Example screenshot](https://raw.githubusercontent.com/Dean151/AoC-Swift-Template/main/Example.png)

## Contribute

Help the project improve itself with your suggestions, issues and pull requests!
