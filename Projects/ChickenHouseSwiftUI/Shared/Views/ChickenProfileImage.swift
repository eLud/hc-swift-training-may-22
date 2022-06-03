//
//  ChickenProfileImage.swift
//  ChickenHouseSwiftUI
//
//  Created by Ludovic Ollagnier on 03/06/2022.
//

import SwiftUI

struct ChickenProfileImage: View {

    let chicken: Chicken

    @State private var angle: Angle = .degrees(-10)
    @State private var offset: Double = 0
    
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
        }
        .frame(width: 200, height: 200)
        .rotation3DEffect(angle, axis: (x: 1, y:5 , z:9 ))
        .offset(x: offset, y: 0)
        .onTapGesture {
            withAnimation {
                angle = Angle(degrees: Double.random(in: -90.0...90.0))
                offset = Double.random(in: -100...100)
            }
        }
        .animation(.easeInOut(duration: 3), value: angle)
    }
}

struct ChickenProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        let chicken = Chicken(vetId: nil, name: "Preview chicken", birthDate: Date(), breed: .chantecler)
        ChickenProfileImage(chicken: chicken)
    }
}
