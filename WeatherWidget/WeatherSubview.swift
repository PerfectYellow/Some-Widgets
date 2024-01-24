//
//  WeatherSubview.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 23/01/2024.
//

import SwiftUI

struct WeatherSubview: View {
    let weather: Weather
    let backgroundColor: Color
    let showDate: Bool
    let updateDate: Date
    
    var body: some View {
        ZStack {
            ContainerRelativeShape()
                .fill(backgroundColor.gradient)
            
            VStack {
                Text(weather.name)
                Text("\(weather.temperature)° \(weather.unit)")
                    .font(.largeTitle.bold())
                
                Text(WeatherUtil.weatherIcon(by: weather.description))
                Text(weather.description)
                    .font(.caption2)
            }
            .padding()
            
            if showDate {
                VStack {
                    Spacer()
                    
                    Text("Updated " + updateDate.formatted(date: .omitted, time: .shortened))
                        .foregroundStyle(.secondary)
                }
                .font(.caption )
            }
        }
    }
}

//#Preview {
//    WeatherSubview()
//}
