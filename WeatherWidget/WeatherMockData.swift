//
//  WeatherMockData.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 23/01/2024.
//

import Foundation

struct WeatherMockData {
    static var weatherMock: [Weather] {
        var MockData = [Weather]()
        
        for i in 0...9 {
            let mock = Weather(name: "Day \(i + 1)", temperature: 10, unit: "F", description: "Cloudy")
            
            MockData.append(mock)
        }
        
        return MockData
    }
}
