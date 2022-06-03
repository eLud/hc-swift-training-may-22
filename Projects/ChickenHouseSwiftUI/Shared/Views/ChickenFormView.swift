//
//  ChickenFormView.swift
//  Shared
//
//  Created by Ludovic Ollagnier on 02/06/2022.
//

import SwiftUI

struct ChickenFormView: View {

    @State var name: String = ""
    @State var id: String?
    @State var isAwake: Bool = false
    @State var birthDate: Date = Date()
    @State var breed: ChickenBreed = .australorp

    @Binding var showForm: Bool

    let chickenHouse: ChickenHouse

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Chicken name", text: $name)
                    DatePicker("Birth date", selection: $birthDate, displayedComponents: .date)
                    Picker(selection: $breed, label: Text("Breed")) {
                        ForEach(ChickenBreed.allCases) { breed in
                            Text(breed.stringValue)
                                .tag(breed)
                        }
                    }
                }
                Section {
                    if let id = id {
                        Text(id)
                    } else {
                        Button("Generate ID") {
                            id = UUID().uuidString
                        }
                    }
                }
                Section {
                    Button("Save", action: {
                        createChicken(with: name, birthDate: birthDate, breed: breed, id: id)
                    })
                }
            }
        }
    }

    private func createChicken(with name: String, birthDate: Date, breed: ChickenBreed, id: String?) {
        let chicken = Chicken(vetId: id, name: name, birthDate: birthDate, breed: breed)
        chickenHouse.add(chicken)
        showForm = false
    }
}

extension Text {
    func megaCustomText() -> some View {
        return self.font(.title3)
            .fontWeight(.medium)
            .foregroundColor(Color.white)
            .padding()
            .background(Color.green)
            .cornerRadius(15)
            .padding()
            .background(Color.red)
            .cornerRadius(15)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let house = ChickenHouse()
        Group {
            ChickenFormView(showForm: .constant(true), chickenHouse: house)
            ChickenFormView(showForm: .constant(true), chickenHouse: house)
                .preferredColorScheme(.dark)
            ChickenFormView(showForm: .constant(true), chickenHouse: house)
                .environment(\.sizeCategory, .extraExtraExtraLarge)
                .previewInterfaceOrientation(.landscapeLeft)
                .preferredColorScheme(.dark)
        }
    }
}
