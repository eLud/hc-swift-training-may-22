//
//  ChickenCell.swift
//  ChickenHouseSwiftUI
//
//  Created by Ludovic Ollagnier on 03/06/2022.
//

import SwiftUI

struct ChickenCell: View {

    let chicken: Chicken

    var body: some View {
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

struct ChickenCell_Previews: PreviewProvider {
    static var previews: some View {
        ChickenCell(chicken: Chicken(vetId: "DGJHEG", name: "Poule1", birthDate: Date(), breed: .chantecler))
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/300.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/))
    }
}
