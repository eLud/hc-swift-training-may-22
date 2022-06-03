//
//  Chicken.swift
//  ChickenHouse
//
//  Created by Ludovic Ollagnier on 31/05/2022.
//

import Foundation

enum ChickenBreed: Equatable, CaseIterable, Identifiable {
    case australorp
    case maran
    case sussex
    case chantecler

    var id: ChickenBreed {
        return self
    }

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
        }
    }

}

protocol Identity {
    var vetId: String? { get }
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
    let vetId: String?
}

struct Chicken: Animal, Equatable, Identifiable {

    // Stored properties
    let vetId: String? // Optional<String>

    var id: UUID = UUID()

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
        if let unwrappedID = vetId {
            print(unwrappedID)
        } else {
            print(name)
        }
    }

    func registerMe() {
        guard let unwrappedID = vetId else { return }

        // make the registration
        print(unwrappedID)
    }

    func makeNoise() {
        print("Cotcot")
    }
}
