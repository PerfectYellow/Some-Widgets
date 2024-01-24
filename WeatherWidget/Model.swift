//
//  Model.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 23/01/2024.
//

import Foundation

enum Api {
    static let api = URL(string: "https://api.lil.software/weather?latitude=40.70&longitude=-73.95")!
}

struct WeatherJsonModel: Codable {
    var forecast: [Weather]
}

struct Weather: Codable {
    var name: String
    var temperature: Int
    var unit: String
    var description: String
}
