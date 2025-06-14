//
//  SuperheroFinder.swift
//  CursoiOS
//
//  Created by PABLO MATEOS on 13/6/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct SuperheroFinder: View {
    @State var superheroName: String = ""
    @State var apiResponse: ApiNetwork.ApiResponseParser? = nil
    @State var loading: Bool = false
    var body: some View {
        VStack {
            TextField("", text: $superheroName, prompt: Text("Superhero...").font(.title2).bold().foregroundColor(.gray))
                .font(.title2)
                .bold()
                .foregroundColor(.white)
                .padding(8)
                .border(.purple, width: 2)
                .padding(16)
                .autocorrectionDisabled()
                .onSubmit {
                loading = true
                    print(superheroName)
                    Task { // Task permite ejecutar procesos asincronos
                        do {
                            apiResponse = try await ApiNetwork().getHeroeByName(name: superheroName)
                            print(apiResponse!)
                        } catch {
                            print("Error")
                        }
                        loading = false
                    }
                }
            if loading {
                ProgressView().tint(.white)
            }
            NavigationStack {
                List(apiResponse?.results ?? []) {superhero in
                    ZStack {
                        SuperheroItem(superhero: superhero)
                        NavigationLink(destination: SuperheroDetail(id: superhero.id)) {EmptyView()}.opacity(0)
                    }.listRowBackground(Color.backgroundApp)
                }.listStyle(.plain)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundApp)
    }
}

struct SuperheroItem: View {
    let superhero: ApiNetwork.SuperheroProps
    var body: some View {
        ZStack {
            Rectangle()
            WebImage(url: URL(string: superhero.image.url))
                .resizable()
                .indicator(.activity)
                .scaledToFill()
                .frame(height: 200)
            VStack {
                Spacer()
                Text(superhero.name)
                    .font(.title)
                    .bold()
                    .padding(8)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .background(.white.opacity(0.6))
                
            }
        }
        .frame(height: 200)
        .cornerRadius(24)
        .listRowBackground(Color.backgroundApp)
    }
}

#Preview {
    SuperheroFinder()
}
