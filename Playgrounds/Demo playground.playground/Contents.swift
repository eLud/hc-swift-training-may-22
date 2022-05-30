
//: # Principes de base

//Variables & constantes
let languageName = "Swift"
//languageName = "Objective-C"

var version = 5.5
version = 5.6

var versionName = "Five.Six"

let newVersion: Float = 5.7
// version = newVersion // Cannot assign value of type 'Float' to type 'Double'

let a = 5
let b: Float = 2.0
let c = Float(a) / Float(b)

let versionString = "6.1"
let converted = Float(versionString)

let initial: Character = "L"

let name: String
// print(name) // Constant 'name' used before being initialized

let changeName: Bool = version > 0
if changeName {
    name = "Swift"
} else {
    name = "Objective-C"
}

//switch

//Un autre conditionnel (guard)

// Modélisation + projet
