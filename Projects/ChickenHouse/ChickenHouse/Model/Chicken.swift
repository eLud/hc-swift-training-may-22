//
//  Chicken.swift
//  ChickenHouse
//
//  Created by Ludovic Ollagnier on 31/05/2022.
//

import Foundation

enum ChickenBreed: Equatable {
    case australorp
    case maran
    case sussex
    case chantecler
    case other(name: String) // Associated value

    var stringValue: String {
        switch self {
        case .australorp:
            return "Australorp"
        case .maran:
            return "Maran"
        case .sussex:
            return "Sussex"
        case .chantecler:
            return "Chantecler"
        case .other(name: let name):
            return "Other" + name
        }
    }

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

protocol Identity {
    var id: String? { get }
}

protocol Animal: Identity {

    var name: String { get set }
    var birthDate: Date { get }

    func makeNoise()
}

extension Animal {
    func makeNoise() {
        print("Bouuhhouu")
    }
}

struct Rabbit: Animal {
    var name: String
    let birthDate: Date
    let id: String?
}

struct Chicken: Animal, Equatable {

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

    func makeNoise() {
        print("Cotcot")
    }
}
