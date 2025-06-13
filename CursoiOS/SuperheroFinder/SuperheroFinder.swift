//
//  SuperheroFinder.swift
//  CursoiOS
//
//  Created by PABLO MATEOS on 13/6/25.
//

import SwiftUI

struct SuperheroFinder: View {
    @State var superheroName: String = ""
    var body: some View {
        VStack {
            let searcNameUrl = "https://superheroapi.com/api/c7ee1967872600c8c4504a4312f746a2/search/name"
            TextField("", text: $superheroName, prompt: Text("Superhero...").font(.title2).bold().foregroundColor(.gray))
                .font(.title2)
                .bold()
                .foregroundColor(.white)
                .padding(16)
                .border(.purple, width: 2)
                .padding(16)
                .autocorrectionDisabled()
                .onSubmit {
                    print(superheroName)
                }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundApp)
    }
}

#Preview {
    SuperheroFinder()
}
