//
//  ChickenListView.swift
//  ChickenHouseSwiftUI
//
//  Created by Ludovic Ollagnier on 02/06/2022.
//

import SwiftUI

struct ChickenListView: View {

    @State private var chickens: [Chicken] = [
        Chicken(vetId: "DGJHEG", name: "Poule1", birthDate: Date(), breed: .chantecler),
        Chicken(vetId: "KJHFGKJ", name: "Poule2", birthDate: Date(), breed: .maran),
    ]

    var body: some View {
        VStack {
            Button("Add chicken") {
                chickens.append(Chicken(vetId: nil, name: "New chicken", birthDate: Date(), breed: .australorp))
            }
            List(chickens) { chicken in
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
    }
}

struct ChickenListView_Previews: PreviewProvider {
    static var previews: some View {
        ChickenListView()
    }
}
