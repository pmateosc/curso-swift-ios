//
//  FavPlaces.swift
//  CursoiOS
//
//  Created by PABLO MATEOS on 15/6/25.
//

import SwiftUI
import MapKit

struct FavPlaces: View {
    @State var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 43.5297424, longitude: -5.6641829),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        ))
    @State var place: [Place] = []
    @State var showPopup: Bool = false
    @State var name: String = ""
    @State var isFav: Bool = false

    
    var body: some View {
        ZStack {
            MapReader { proxy in
                Map(position: $position)
                    .onTapGesture {
                        showPopup = true
                    }
            }
            
            if showPopup {
                
                let view = VStack {
                    Text("Añadir localizacion").font(.title2).bold()
                    Spacer()
                    TextField("Nombre", text: $name).padding(.bottom, 8)
                    Toggle("¿Marcar como favorito?", isOn: $isFav)
                    Spacer()
                    Button("Guardar"){}
                }
                CustomDialogue(closeDialogue: {showPopup = false}, onDismissOutside: false, content: view)
            }
        }
    }
}

#Preview {
    FavPlaces()
}
