//
//  TextExample.swift
//  CursoiOS
//
//  Created by PABLO MATEOS, Vodafone on 9/6/25.
//

import SwiftUI

struct TextExample: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).font(.headline)
            Text("Pablo Mateos").font(.system(size: 40, weight: .light, design: .monospaced)).italic().foregroundColor(.gray)
        }
    }
}

#Preview {
    TextExample()
}
