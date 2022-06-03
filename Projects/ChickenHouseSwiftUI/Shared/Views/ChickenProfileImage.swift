//
//  ChickenProfileImage.swift
//  ChickenHouseSwiftUI
//
//  Created by Ludovic Ollagnier on 03/06/2022.
//

import SwiftUI

struct ChickenProfileImage: View {

    let chicken: Chicken
    
    var body: some View {
        ZStack {
            Image(chicken.breed.stringValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(6)
                .shadow(color: .black, radius: 6, x: 1, y: 1)
            VStack {
                Spacer()
                Text(chicken.name)
                    .background(Color.white)
            }
        }.frame(width: 200, height: 200)
//            .rotationEffect(Angle.init(degrees: -10))
            .rotation3DEffect(.degrees(-10), axis: (x: 1, y:5 , z:9 ))
    }
}

struct ChickenProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        let chicken = Chicken(vetId: nil, name: "Preview chicken", birthDate: Date(), breed: .chantecler)
        ChickenProfileImage(chicken: chicken)
    }
}
