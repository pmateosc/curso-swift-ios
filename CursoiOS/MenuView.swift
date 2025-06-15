//
//  MenuView.swift
//  CursoiOS
//
//  Created by PABLO MATEOS on 10/6/25.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink(destination: IMCView()) {
                    Text("IMC calculator")
                }
                NavigationLink(destination: SuperheroFinder()) {
                    Text("Superhero Finder")
                }
                NavigationLink(destination: FavPlaces()) {
                    Text("My favorite Places")
                }
                Text("Parking app")
                Text("Mis recetas")
            }
        }
    }
}

#Preview {
    MenuView()
}
