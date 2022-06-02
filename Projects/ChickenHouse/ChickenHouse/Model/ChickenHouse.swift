//
//  ChickenHouse.swift
//  ChickenHouse
//
//  Created by Ludovic Ollagnier on 31/05/2022.
//

import Foundation

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
