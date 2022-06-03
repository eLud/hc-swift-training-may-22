//
//  ChickenListView.swift
//  ChickenHouseSwiftUI
//
//  Created by Ludovic Ollagnier on 02/06/2022.
//

import SwiftUI

struct ChickenListView: View {

    @ObservedObject var chickenHouse: ChickenHouse
    @State private var showForm = false

    var body: some View {
        VStack {
            List(chickenHouse.list()) { chicken in
                VStack(alignment: .leading) {
                    Text(chicken.name)
                    if let vetId = chicken.vetId {
                        Text(vetId)
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
        .navigationTitle("Chicken List")
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Button {
                    showForm = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showForm) {
            ChickenFormView(showForm: $showForm, chickenHouse: chickenHouse)
        }
    }
}

struct ChickenListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChickenListView(chickenHouse: ChickenHouse(chickens: [
                Chicken(vetId: "DGJHEG", name: "Poule1", birthDate: Date(), breed: .chantecler),
                Chicken(vetId: "KJHFGKJ", name: "Poule2", birthDate: Date(), breed: .maran),
            ]))
        }
    }
}
