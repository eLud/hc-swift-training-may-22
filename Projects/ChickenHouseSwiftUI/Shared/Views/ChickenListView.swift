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

    @State private var searchTerms: String = ""

    var body: some View {
        List(chickenHouse.list()) { c in
            NavigationLink(destination: ChickenDetailsView(chicken: c)) {
                ChickenCell(chicken: c)
            }
        }
        .searchable(text: $searchTerms)
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
