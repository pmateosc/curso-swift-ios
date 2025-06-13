//
//  ListExample.swift
//  CursoiOS
//
//  Created by PABLO MATEOS on 12/6/25.
//

import SwiftUI

var pokemons = [
    Pokemon(name: "Pikachu"),
    Pokemon(name: "Charmander"),
    Pokemon(name: "Charizard"),
    Pokemon(name: "Bulbasur"),
]

var pokemons2 = [
    PokemonIDs(name: "Pikachu"),
    PokemonIDs(name: "Charmander"),
    PokemonIDs(name: "Charizard"),
    PokemonIDs(name: "Bulbasur"),
    PokemonIDs(name: "Bulbasur"),
]

struct ListExample: View {
    var body: some View {
        List {
            Section("Pokemons") {
                ForEach(pokemons, id: \.name) { pokemon in
                    Text(pokemon.name)}
            }
            Section("PokemonsIds") {
                ForEach(pokemons2) { pokemon in
                    Text(pokemon.name)
                    
                }
            }
        }
    }
}

struct Pokemon {
    let name: String
}

struct PokemonIDs: Identifiable {
    let id =  UUID()
    let name: String
}

#Preview {
    ListExample()
}
