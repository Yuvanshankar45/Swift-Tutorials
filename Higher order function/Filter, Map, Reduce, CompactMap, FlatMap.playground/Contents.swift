import UIKit

struct Youtuber {
    let name: String
    let subscribers: Int
    let monthlyRev: Double
}

let youtuber = [Youtuber(name: "MKBHD", subscribers: 15000, monthlyRev: 20100.20),
                Youtuber(name: "MRWHOSETHEBOSS", subscribers: 10000, monthlyRev: 15000.80),
                Youtuber(name: "DEVE2D", subscribers: 8000, monthlyRev: 12500.80)]

//MARK: - Filter
let belowTenkSubs = youtuber.filter({$0.subscribers <= 10000})
//print(belowTenkSubs)

//MARK: - Maps
// Common use of map is pull out all of a specific property
let youtuberNames = youtuber.map {$0.name}.sorted()
//print(youtuberNames)

let increaseSubs = youtuber.map {$0.subscribers * 2}
//print(increaseSubs)

//MARK: - Reduce
// simple example
let numbers = [2, 8, 10]
let sum = numbers.reduce(100, +)
//print(sum)

let totalSubs = youtuber.reduce(0, {$0 + $1.subscribers})
//print(totalSubs)

//MARK: - Compact map
// Removes nil from an array

// let numbersWithNil: [Int] = [1, nil, 3, nil, 5, nil, 7]
// let numbersWithoutNil = numbersWithNil.compactMap { $0 }

//MARK: - Flat Map
// Arrays of arrays flaten into the single array
let arrayOfArrays: [[Int]] = [[1,2,3],
                              [4,5,6],
                              [7,8,9]]

let singleArray = arrayOfArrays.flatMap { $0 }
//print(singleArray)
