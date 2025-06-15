//
//  MapExample.swift
//  CursoiOS
//
//  Created by PABLO MATEOS on 14/6/25.
//

import SwiftUI
import MapKit

struct MapExample: View {
    @State var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 43.5297424, longitude: -5.6641829),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        ))
    
    var body: some View {
        ZStack {
            MapReader { proxy in
                Map(position: $position) {
                    Marker("Casa", coordinate: CLLocationCoordinate2D(latitude: 43.5297424, longitude: -5.6641829))
                    Annotation("Aparcamiento", coordinate: CLLocationCoordinate2D(latitude: 43.5297424, longitude: -5.6652500)) {
                        Image(systemName: "car.fill")
                            .foregroundColor(.red)
                    }
                }
                .mapStyle(.hybrid(elevation: .realistic))
                //                .onMapCameraChange { context in
                //                    print("Estamos en: \(context.region)")
                //                }
                .onMapCameraChange(frequency: .continuous) { context in
                    print("Contonuos location: \(context.region)")
                }
                .onTapGesture { coords in
                    if let coordinates = proxy.convert(coords, from: .local) {
                        withAnimation {
                            position = MapCameraPosition.region(
                                MKCoordinateRegion(
                                    center: CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude),
                                    span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                                ))
                        }
                    }
                }
            }
            VStack {
                Spacer()
                HStack {
                    Button("Ir a Oviedo") {
                        withAnimation {
                            position = MapCameraPosition.region(
                                MKCoordinateRegion(
                                    center: CLLocationCoordinate2D(latitude: 43.3625094, longitude: -5.8570654),
                                    span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                                ))
                        }
                    }.padding().background(.white).padding()
                    Button("Ir a Gijon") {
                        withAnimation {
                            position = MapCameraPosition.region(
                                MKCoordinateRegion(
                                    center: CLLocationCoordinate2D(latitude: 43.5297424, longitude: -5.6641829),
                                    span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                                ))
                        }
                    }.padding().background(.white).padding()
                }
            }
        }
    }
}

#Preview {
    MapExample()
}
