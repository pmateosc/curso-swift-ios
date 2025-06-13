//
//  LabelExample.swift
//  CursoiOS
//
//  Created by PABLO MATEOS, Vodafone on 10/6/25.
//

import SwiftUI

struct LabelExample: View {
    var body: some View {
        Label("APARCA", systemImage: "parkingsign.radiowaves.left.and.right")
        Label(
            title: {Text("Ir a la montaña")},
            icon: {Image("mountain").resizable().scaledToFit().frame(height: 50)}
        )
    }
}

#Preview {
    LabelExample()
}
