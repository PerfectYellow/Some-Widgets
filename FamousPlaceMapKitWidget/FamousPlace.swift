//
//  FamousPlace.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 11/02/2024.
//

import MapKit
import SwiftUI
import CoreLocation

struct FamousPlace: Identifiable {
    let id = UUID()
    var image = Image("test")
    let location: CLLocationCoordinate2D
    let name: String
}

extension FamousPlace {
    static var sample: [FamousPlace] {
        [
            .init(location: CLLocationCoordinate2D(latitude: 27.173891, longitude: 78.042068), name: "Taj Mahal"),
            .init(location: CLLocationCoordinate2D(latitude: 48.858093, longitude: 2.294694), name: "Eiffel Tower")
        ]
    }
}
