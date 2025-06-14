//
//  SuperheroDetail.swift
//  CursoiOS
//
//  Created by PABLO MATEOS on 14/6/25.
//

import SwiftUI
import SDWebImageSwiftUI
import Charts

struct SuperheroDetail: View {
    let id: String
    @State var superheroDetail: ApiNetwork.SuperheroDetail? = nil
    @State var loading = true

    var body: some View {
        VStack {
            if loading {
                ProgressView().tint(.white)
            } else if let superhero = superheroDetail {
                WebImage(url: URL(string: superhero.image.url))
                    .resizable()
                    .scaledToFill()
                    .frame(height: 250)
                    .clipped()
                Text(superhero.name).bold().font(.title).foregroundColor(.white)
                ForEach(superhero.biography.aliases, id: \.self) { alias in
                    Text(alias).foregroundColor(.gray).italic()
                }
                SuperheroStats(stats: superhero.powerstats)
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundApp)
        .onAppear{ // Para que según aparezca esta pantalla se llame al endpoint
            Task {
                do {
                    superheroDetail = try await ApiNetwork().getHeroById(id: id)
                    print(superheroDetail ?? "No se ha podido cargar el superhéroe")
                } catch {
                    superheroDetail = nil
                    print("Error")
                }
                loading = false
            }
        }
    }
}

struct SuperheroStats: View {
    var stats: ApiNetwork.Powerstats
    var body: some View {
        VStack {
            Chart {
                SectorMark(angle: .value("Count", Int(stats.combat) ?? 0),
                           innerRadius: .ratio(0.6),
                           angularInset: 2)
                .cornerRadius(5)
                .foregroundStyle(by: .value("Category", "Combat"))
                SectorMark(angle: .value("Count", Int(stats.durability) ?? 0),
                           innerRadius: .ratio(0.6),
                           angularInset: 2)
                .cornerRadius(5)
                .foregroundStyle(by: .value("Category", "Durability"))
                SectorMark(angle: .value("Count", Int(stats.intelligence) ?? 0),
                           innerRadius: .ratio(0.6),
                           angularInset: 2)
                .cornerRadius(5)
                .foregroundStyle(by: .value("Category", "Intelligence"))
                SectorMark(angle: .value("Count", Int(stats.power) ?? 0),
                           innerRadius: .ratio(0.6),
                           angularInset: 2)
                .cornerRadius(5)
                .foregroundStyle(by: .value("Category", "Power"))
                SectorMark(angle: .value("Count", Int(stats.speed) ?? 0),
                           innerRadius: .ratio(0.6),
                           angularInset: 2)
                .cornerRadius(5)
                .foregroundStyle(by: .value("Category", "Speed"))
                SectorMark(angle: .value("Count", Int(stats.strength) ?? 0),
                           innerRadius: .ratio(0.6),
                           angularInset: 2)
                .cornerRadius(5)
                .foregroundStyle(by: .value("Category", "Strength"))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 350)
        .background(.white)
        .cornerRadius(16)
        .padding(24)
    }
    
}

#Preview {
    SuperheroDetail(id: "20")
}
