import Foundation

enum ChickenBreed: Equatable {
    case australorp
    case maran
    case sussex
    case chantecler
    case other(name: String) // Associated value

    // Computed property
    var firstLayAge: Float {
        switch self {
        case .australorp:
            return 0.5
        case .maran:
            return 0.6
        case .sussex:
            return 0.4
        case .chantecler:
            return 0.45
        case .other:
            return 0.4
        }
    }

    var lastLayAge: Float {
        switch self {
        case .australorp:
            return 6
        case .maran:
            return 6
        case .sussex:
            return 6
        case .chantecler:
            return 6
        case .other:
            return 6
        }
    }

}

struct Chicken: Equatable {

    // Stored properties
    let id: String? // Optional<String>

    var name: String
    let birthDate: Date
    let breed: ChickenBreed

    // Get-only computed property
    var couldLayEggs: Bool {
        let age = birthDate.timeIntervalSinceNow
        // Compute age as a year from seconds
        if Float(age) > self.breed.firstLayAge && Float(age) < self.breed.lastLayAge {
            return true
        }
        return false
    }

    func sayHello() {
//        print(id!) // Force unwrap operator
        if let unwrappedID = id {
            print(unwrappedID)
        } else {
            print(name)
        }
    }

    func registerMe() {
        guard let unwrappedID = id else { return }

        // make the registration
        print(unwrappedID)
    }
}

let myChicken = Chicken(id: nil,
                        name: "Poule1",
                        birthDate: Date(),
                        breed: .other(name: "HumanCoderix"))

let myChicken2 = Chicken(id: "12R-87U-986",
                        name: "Poule2",
                        birthDate: Date(),
                        breed: .other(name: "HumanCoderix"))

if myChicken.id == nil {
    print("Bon appétit")
}

myChicken.sayHello()
myChicken2.registerMe()

if let uppercasedID = myChicken.id?.uppercased() {
    print(uppercasedID)
} else {
    print("No ID for this chicken")
}

class ChickenHouse {

    init(chickens: [Chicken] = []) {
        self.chickens = chickens
    }

    // Collection de Truc
    private var chickens: [Chicken]

    // Fonction pour ajouter un truc
    func add(_ chicken: Chicken) {
        guard !chickens.contains(chicken) else { return }
        chickens.append(chicken)
    }

    // Un moyen de lister les trucs
    func list() -> [Chicken] {

        for chicken in chickens {
            print(chicken)
        }

        chickens.forEach { c in
            print(c)
        }

        return chickens
    }

    //Bonus
    // Un moyen de supprimer un truc
    func cook(_ chicken: Chicken) {
        guard let indexToRemove = chickens.firstIndex(of: chicken) else { return }
        chickens.remove(at: indexToRemove)
    }
}

let house = ChickenHouse()
house.add(myChicken)
house.add(myChicken2)
house.add(myChicken)

house.list()


Set<String>().contains("Toto")
