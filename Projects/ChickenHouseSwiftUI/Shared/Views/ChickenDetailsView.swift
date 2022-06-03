//
//  ChickenDetailsView.swift
//  ChickenHouseSwiftUI
//
//  Created by Ludovic Ollagnier on 03/06/2022.
//

import SwiftUI

struct ChickenDetailsView: View {

    let chicken: Chicken

    var body: some View {
        VStack {
            ChickenProfileImage(chicken: chicken)
            Text(chicken.name)
            Text(chicken.vetId ?? "This chicken is not identified")
        }.navigationTitle(Text(chicken.name))
    }

}

struct ChickenDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let chicken = Chicken(vetId: nil, name: "Preview chicken", birthDate: Date(), breed: .chantecler)
        Group {
            ChickenDetailsView(chicken: chicken)
            NavigationView {
                ChickenDetailsView(chicken: chicken)
            }
        }
    }
}
