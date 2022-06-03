//
//  ChickenHouseSwiftUIApp.swift
//  Shared
//
//  Created by Ludovic Ollagnier on 02/06/2022.
//

import SwiftUI

@main
struct ChickenHouseSwiftUIApp: App {

    @StateObject private var chickenHouse = ChickenHouse(chickens: [
        Chicken(vetId: "DGJHEG", name: "Poule1", birthDate: Date(), breed: .chantecler),
        Chicken(vetId: "KJHFGKJ", name: "Poule2", birthDate: Date(), breed: .maran),
    ])

    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    ChickenListView(chickenHouse: chickenHouse)
                }.tabItem {
                    Text("Chickens")
                    Image(systemName: "list.star")
                }
                SettingsView(chickenHouse: chickenHouse)
                    .tabItem {
                        Text("Settings")
                        Image(systemName: "gearshape")
                    }
                Color.green
                    .tabItem {
                        Text("Green")
                        Image(systemName: "leaf")
                    }
            }
        }
    }
}
