//
//  Services.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 20/01/2024.
//

import Foundation

struct Services {
    func getWeatherInfo() async throws -> [Weather] {
        let (data, response) = try await URLSession.shared.data(from: Api.api)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("wrong response code")
        }
        
        let decodedData = try JSONDecoder().decode(WeatherJsonModel.self, from: data)
        
        return decodedData.forecast
    }
}
