//
//  ContentView.swift
//  CursoiOS
//
//  Created by PABLO MATEOS, Vodafone on 8/6/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(.blue)
                .frame(height: 50)
            Rectangle()
                .foregroundColor(.blue)
                .frame(height: 50)
            Rectangle()
                .foregroundColor(.blue)
                .frame(width: 150, height: 50)
                .padding(20)
        }
        .padding()
    }
}

struct Example: View {
    var body: some View {
        Text("Hola pepe")
    }
}

#Preview {
    ContentView()
}

#Preview {
    Example()
}
