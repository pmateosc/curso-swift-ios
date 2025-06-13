//
//  Ejercicio1.swift
//  CursoiOS
//
//  Created by PABLO MATEOS on 9/6/25.
//

import SwiftUI

struct Ejercicio1: View {
    var body: some View {
        VStack {
            HStack {
                Rectangle()
                    .foregroundColor(.blue)
                Rectangle()
                    .foregroundColor(.orange)
                Rectangle()
                    .foregroundColor(.yellow)
            }
            Rectangle()
                .foregroundColor(.orange)
            HStack {
                Circle()
                    .foregroundColor(.green)
                Rectangle()
                Circle()
                    .foregroundColor(.blue)
            }.frame(height: 300)
            Rectangle()
                .foregroundColor(.orange)
            HStack {
                Rectangle()
                    .foregroundColor(.blue)
                Rectangle()
                    .foregroundColor(.orange)
                Rectangle()
                    .foregroundColor(.yellow)
            }
        }
        .background(.red)
        .padding(.top)
        .padding(.bottom)
    }
}


#Preview {
    Ejercicio1()
}
