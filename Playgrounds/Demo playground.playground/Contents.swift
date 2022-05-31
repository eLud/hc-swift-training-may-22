
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

switch a {
case 0:
    print("It's 0")
case 1:
    print("It's 1")
case 5:
    print("It's 5")
    fallthrough
case 6:
    print("It's 6")
default:
    print("It's something else")
}

//Un autre conditionnel (guard)
guard version != 0 else {
    fatalError("Prevented divide by 0")
}
let result = Double(a) / version


// Modélisation + projet


func learn(language: String) -> String {
    return language
}

learn(language: "Swift")

func learn(_ language: String, insteadOf anotherLanguage: String?) {
    print("I learn " + language)
    if let anotherLanguage = anotherLanguage {
        print("Instead of " + anotherLanguage)
    }
}

learn("Swift", insteadOf: "Objective-C")
learn("Swift", insteadOf: nil)

func loadURL() -> (statusCode: Int, message: String) {
    //On essaye de charger une URL

    return (200, "OK")
}

let requestResponse = loadURL().statusCode
requestResponse

@propertyWrapper
struct Grade {

    var value: Double

    init(wrappedValue: Double) {
        value = 0
        value = cleanGrade(wrappedValue)
    }

    var wrappedValue: Double {
        get { value }
        set {
            value = cleanGrade(newValue)
        }
    }

    private func cleanGrade(_ grade: Double) -> Double {
        if grade < 0 {
            return 0
        } else if grade > 20 {
            return 20
        } else {
            return grade
        }
    }
}

struct Exam {

    @Grade var result: Double = 0

    func setGrade(@Grade grade: Double) {
        print(grade)
    }
}

var bac = Exam()
bac.result = 100
bac.result

bac.setGrade(grade: 200)
