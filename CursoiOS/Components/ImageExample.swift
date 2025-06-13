//
//  ImageExample.swift
//  CursoiOS
//
//  Created by PABLO MATEOS on 9/6/25.
//

import SwiftUI

struct ImageExample: View {
    var body: some View {
        Image("mountain").resizable().scaledToFit().frame(width: 300, height: 100)
        Image(systemName: "parkingsign.radiowaves.left.and.right").font(.largeTitle)
    }
}

#Preview {
    ImageExample()
}
