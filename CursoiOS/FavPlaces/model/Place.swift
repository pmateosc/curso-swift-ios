//
//  Place.swift
//  CursoiOS
//
//  Created by PABLO MATEOS on 15/6/25.
//

import Foundation
import MapKit

struct Place {
    let id = UUID()
    var name: String
    var coordinates: CLLocationCoordinate2D
    var fav: Bool
}
