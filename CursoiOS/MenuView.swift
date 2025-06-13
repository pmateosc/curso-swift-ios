//
//  MenuView.swift
//  CursoiOS
//
//  Created by PABLO MATEOS, Vodafone on 10/6/25.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: IMCView()) {
                    Text("IMC calculator")
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
