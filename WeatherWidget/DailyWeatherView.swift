//
//  DailyWeatherView.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 23/01/2024.
//

import SwiftUI

struct DailyWeatherView: View {
    let weather: Weather
    
    var body: some View {
        VStack(spacing: 0) {
            Text(weather.name.lowercased().contains("night") ? "🌙" : "🌞")
            Text("\(weather.temperature)° \(weather.unit)")
            Text(WeatherUtil.weatherIcon(by: weather.description))
        }
        .padding(5)
    }
}

//#Preview {
//    DailyWeatherView()
//}
