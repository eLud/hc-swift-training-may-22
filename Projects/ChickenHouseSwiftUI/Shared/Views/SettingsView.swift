//
//  SettingsView.swift
//  ChickenHouseSwiftUI
//
//  Created by Ludovic Ollagnier on 03/06/2022.
//

import SwiftUI

struct SettingsView: View {

    let chickenHouse: ChickenHouse

    @State private var data: String = ""
    @State private var url: String = ""

    var body: some View {
        VStack {
            Button("Save chicken house") {
                encodeChickenHouse()
            }

            Text(data)
            Spacer()
            Text(url)
        }
    }

    func encodeChickenHouse() {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        encoder.keyEncodingStrategy = .convertToSnakeCase

//        guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }

        if let data = try? encoder.encode(chickenHouse),
            let str = String(data: data, encoding: .utf8) {
            self.data = str

//            data.write(to: url)
        }

    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(chickenHouse: ChickenHouse())
    }
}
