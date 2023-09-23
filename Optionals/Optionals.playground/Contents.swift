import UIKit

/*
 What are optional types?
 
 Optionals either contain a value or nil which
 represents the absence of a value.
 
 Optionals types are declared with a ? after the type
 name.
 
*/

struct User {
    let name: String
    let age: Int?
}

let user = User(name: "Yuvan", age: nil)


//MARK: - Optional Binding or Unwrapping - IF LET

// Note: The disadvantage of using if let is that we must write the logic inside the if let block, which results in the pyramid of doom.

if let age = user.age {
  //  print("User's age is \(age)")
} else {
  //  print ("User did not enter an age")
}

//MARK: - Optional Binding or Unwrapping - GUARD LET

// Note: Use guard let to prevent the pyramid of doom which means you can use the variable to the entire scope of the funtion and for early exit.

func checkAge(age: Int?) {
    guard let age = age else {
     //   print("Age is nil")
        return
    }
    
    if age > 18 {
        print("Eligible to get a driving license")
    }
}

checkAge(age: user.age)

//MARK: - Nil-Coalescing Operator

// Note: The nil-coalescing operator ?? unwraps an optional value and provides a default if the optional is nil.

var email: String? = nil

//print("Welcome! Your email is \(email ?? "unknown").")

//MARK: - Force Unwrapping Optionals

// Note: The ! operator force unwraps an optional. If the underlying value is not nil, it can then be used. If the underlying value is nil, then the program will crash.

var name: String? = "Codey"
var emailID: String? = nil

//print("The user's name is \(name!)") // Prints "The user's name is Codey"
//print("The user's email is \(emailID!)") // Crashes!

//MARK: - Multiple Optional Bindings

/*
Multiple optionals can be bound in the same if let
statement, separating each binding with “,”. if let
statements can also check to see if a boolean
expression evaluates to true
*/

var userName: String? = "Yuvan"
var userEmail: String? = "yuvan5@icloud.com"

if let name = userName, let email = userEmail, email.contains("@") {
 //   print("Welcome back \(name)! Your userEmail address is \(email)")
} else {
 //   print("Name is nil, email is nil, or the userEmail is invalid")
}
// Prints "Welcome back Yuvan! Your email address is yuvan3@icloud.com"


class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

let john = Person()

let roomCount = john.residence?.numberOfRooms

john.residence = Residence()

john.residence?.numberOfRooms


if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
