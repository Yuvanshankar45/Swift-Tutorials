import UIKit

//MARK: - CLOSURES without Inputs and Outputs

// Define a simple closure
let helloClosures = {
  print("Hello closures!")
}

// helloClosures()


//MARK: - CLOSURES with Inputs and Outputs

let add: (Int, Int) -> Int = { intOne, intTwo in
    return intOne + intTwo
}

//print(add(2,2))

//MARK: - Passing a closure to a function

// Closures are first-class citizens in Swift. This means they can be assigned to variables and passed as arguments to functions.

/*
   What is higher order function?
   A function that accepts the closure as an arguement that known as higher-order function
*/

// Example - 1
let animalSkill: (String) -> Void = { animal in
  switch animal {
  case "Eagle":
    print("EyeSight")
  case "Cheetah":
    print("Running")
  case "Puma":
    print("Jumping")
  case "Sharks":
    print("Electroreception")
  default:
    print("Unknown Animal")
  }
}

func description(for animal: String, descriptionClosure: (String) -> Void) {
  descriptionClosure(animal)
}

//description(for: "Puma", descriptionClosure: animalSkill)

// Example - 2
// For this exercise we will create a game that calculates the sum of a hand of cards. We will make the game configurable such that it accepts a closure defining the rules for how cards are counted.

let cards = [8,2,5,3,4]

func handValue(cards: [Int], scoringRules: (Int) -> Int) -> Int {
    var totalValue = 0
    for card in cards {
        totalValue += scoringRules(card)
    }
    return totalValue
}

let allCards = { (card: Int) -> Int in
    return card
}

//print(handValue(cards: cards, scoringRules: allCards))

let onlyEvens = { (card: Int) -> Int in
    if card.isMultiple(of: 2) {
        return card
    } else {
        return 0
    }
}

//print(handValue(cards: cards, scoringRules: onlyEvens))

//MARK: - Closure expressions and trailing closure syntax

// Inline Closure
/*
   If a function’s last argument is a closure, the function
   can be called using trailing closure syntax. Omit the last
   argument from the method call and close the
   parentheses. Then, define the closure immediately
   after the parentheses are closed.
*/

func bake(ingredient: String, completionAction: (String) -> Void) {
    print(ingredient)
    completionAction(ingredient)
}

/*
bake(ingredient: "bread") { ingredient in
    print("Finished baking \(ingredient)")
}
*/

//MARK: - Shorthand Argument Names
/*
 When defining a closure, the arguments in parentheses,
 return type, and the keyword in can be omitted in
 exchange for shorthand argument labels. $0 refers to
 the first argument and $1 refers to the second
 argument.
*/

// We have a function that transforms an array of strings.

let strings = ["remit", "spans", "level"]

func transform(strings: [String], transformer: (String) -> String) -> [String] {
  var transformedStrings = [String]()
  for string in strings {
    transformedStrings.append(transformer(string))
  }
  return transformedStrings
}
/*
 
print(transform ( strings: strings ) { (str: String) -> String in
  return String(str.reversed())
})

print(transform ( strings: strings ) { str in
  String(str.reversed())
})
print(transform(strings: strings) { String($0.reversed()) })
 
*/

//MARK: - Built-in Higher-Order Functions
// The most common are filter, sort, map and reduce.

var names = ["Jason", "Kimberly", "Zach", "Austin", "Sarah", "Adam", "Kathy"]

let aNames = names.filter { $0.starts(with: ["A"]) }
//print(aNames)

let sortedNames = names.sorted(by: <)
//print(sortedNames)

//MARK: - Escaping Closures

// It is possible for a closure to be called after the function it was passed into returns. This is called an escaping closure and is wrapped with the @escaping keyword.

struct NumberPrinter {
    var startAction: () -> Void
    var completeAction: () -> Void
    
    mutating func setStartAction(to action: @escaping () -> Void) {
        self.startAction = action
    }
    
    mutating func setCompleteAction(to action: @escaping () -> Void) {
        self.completeAction = action
    }
    
    func printNumber(using numberGenerator: () -> Int) {
        startAction()
        print(numberGenerator())
        completeAction()
    }
}

let printer = NumberPrinter(startAction: { print("Starting!") }, completeAction: { print("Finished!") })

//printer.printNumber(using: { Int.random(in: 1..<100) })
//printer.printNumber(using: { Int.random(in: 1..<5) })

//MARK: - Capturing Values

// Closures are refernce types

// Example 1
func makeFriendAdder() -> (String) -> [String] {
  var friends = [String]()
  let addFriend: (String) -> [String] = { name in
    friends.append(name)
    return friends
  }
  return addFriend
}

let friendAdder = makeFriendAdder()
friendAdder("Jake")
//print(friendAdder("Kate")) // prints ["Jake", "Kate"]

// Example 2
func createMultiplier(factor: Int) -> () -> Int {
  var value = 1
  let multiplier: () -> Int = {
    value *= factor
    return value
  }
  return multiplier
}

let multiplier = createMultiplier(factor: 3)
//print(multiplier())
//print(multiplier())
//print(multiplier())

//MARK: - @Autoclosure

/*
 What is an @autoclosure?
 
 It’s all in the name: @autoclosure automatically creates a closure from an argument passed to a function. Turning an argument into a closure allows us to delay the actual request of the argument.
*/

func printTest1(_ result: () -> Void) {
    print("Before")
    result()
    print("After")
}

//printTest1({print("Hello")})

func printTest2(_ result: @autoclosure () -> Void) {
    print("Before")
    result()
    print("After")
}

//printTest2(print("Hello"))
