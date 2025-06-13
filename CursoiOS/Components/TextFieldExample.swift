//
//  TextFieldExample.swift
//  CursoiOS
//
//  Created by PABLO MATEOS on 10/6/25.
//

import SwiftUI

struct TextFieldExample: View {
    @State var email = ""
    @State var pass = ""
    var body: some View {
        VStack {
            TextField("Escribe tu email", text: $email)
                .keyboardType(.emailAddress)
                .padding(15)
                .background(.gray.opacity(0.2))
                .cornerRadius(15)
                .padding(.horizontal, 40)
                .onChange(of: email) { oldValue, newValue in
                    print("Antiguo: \(oldValue)")
                    print("Nuevo: \(newValue)")
                }
            SecureField("Escribe tu contraseña", text: $pass)
                .keyboardType(.emailAddress)
                .padding(15)
                .background(.gray.opacity(0.2))
                .cornerRadius(15)
                .padding(.horizontal, 40)
                .onChange(of: pass) { oldValue, newValue in
                    print("Antiguo: \(oldValue)")
                    print("Nuevo: \(newValue)")
                }
        }
    }
}

#Preview {
    TextFieldExample()
}
