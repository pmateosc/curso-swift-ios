//
//  ButtonExample.swift
//  CursoiOS
//
//  Created by PABLO MATEOS, Vodafone on 10/6/25.
//

import SwiftUI

struct ButtonExample: View {
    var body: some View {
        Button("Buscar Aparcamiento") {
            print("buscando...")
        }
        Button {
            print("buscando 2...")
        } label: {
            Text("Aparca").frame(width: 100, height: 40)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(10)
        }

    }
}

struct Counter: View {
    @State var numberOfClicks = 0
    var body: some View {
        Button {
            print("+1")
            numberOfClicks += 1
        } label: {
            Text("Añadir: \(numberOfClicks)").frame(width: 100, height: 40)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(10)
        }
    }
}

#Preview {
    Counter()
}
