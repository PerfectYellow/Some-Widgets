//
//  WeatherWidgetView.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 23/01/2024.
//

import SwiftUI
import WidgetKit

struct WeatherWidgetView: View {
    @Environment(\.widgetFamily) var widgetFamily
    let entry: WeatherWidgetEntry
    
    var body: some View {
        switch widgetFamily {
            case .systemSmall:
                WeatherSubview(weather: entry.weathers[0], backgroundColor: .orange, showDate: true, updateDate: entry.date)
                
            case .systemMedium:
                HStack(spacing: -10) {
                    WeatherSubview(weather: entry.weathers[0], backgroundColor: .orange, showDate: false, updateDate: entry.date)
                    WeatherSubview(weather: entry.weathers[1], backgroundColor: .orange, showDate: true, updateDate: entry.date)
                }
                
            case .systemLarge:
                VStack {
                    HStack(spacing: -10) {
                        WeatherSubview(weather: entry.weathers[0], backgroundColor: .orange, showDate: false, updateDate: entry.date)
                        WeatherSubview(weather: entry.weathers[1], backgroundColor: .orange, showDate: true, updateDate: entry.date)
                    }
                    
                    HStack(spacing: 40) {
                        VStack(spacing: 0) {
                            DailyWeatherView(weather: entry.weathers[2])
                            DailyWeatherView(weather: entry.weathers[3])
                        }
                        
                        VStack(spacing: 0) {
                            DailyWeatherView(weather: entry.weathers[4])
                            DailyWeatherView(weather: entry.weathers[5])
                        }
                        
                        VStack(spacing: 0) {
                            DailyWeatherView(weather: entry.weathers[6])
                            DailyWeatherView(weather: entry.weathers[7])
                        }
                        
                        VStack(spacing: 0) {
                            DailyWeatherView(weather: entry.weathers[8])
                            DailyWeatherView(weather: entry.weathers[9])
                        }
                    }
                }
                
            default:
                Text("oh waw")
                
                /*
            case .systemExtraLarge:
                <#code#>
            case .accessoryCorner:
                <#code#>
            case .accessoryCircular:
                <#code#>
            case .accessoryRectangular:
                <#code#>
            case .accessoryInline:
                <#code#>
                 */
        }
    }
}

struct preview: PreviewProvider {
    static var previews: some View {
        WeatherWidgetView(entry: WeatherWidgetEntry(date: Date(), weathers: WeatherMockData.weatherMock))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
            .containerBackground(.pink.gradient, for: .widget)
        
        WeatherWidgetView(entry: WeatherWidgetEntry(date: Date(), weathers: WeatherMockData.weatherMock))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
            .containerBackground(.pink.gradient, for: .widget)
        
        WeatherWidgetView(entry: WeatherWidgetEntry(date: Date(), weathers: WeatherMockData.weatherMock))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
            .containerBackground(.pink.gradient, for: .widget)
    }
}
