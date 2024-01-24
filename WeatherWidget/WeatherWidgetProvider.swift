//
//  WeatherWidgetProvider.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 23/01/2024.
//

import WidgetKit

struct WeatherWidgetProvider: TimelineProvider {
    typealias Entry = WeatherWidgetEntry
    
    func placeholder(in context: Context) -> WeatherWidgetEntry {
        WeatherWidgetEntry(date: Date(), weathers: WeatherMockData.weatherMock)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (WeatherWidgetEntry) -> Void) {
        completion(
            WeatherWidgetEntry(date: Date(), weathers: WeatherMockData.weatherMock)
        )
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<WeatherWidgetEntry>) -> Void) {
        let currentDate = Date()
        let refreshDate = Calendar.current.date(byAdding: .second, value: 30, to: currentDate)!
        
        Task {
            do {
                let weathers = try await Services().getWeatherInfo()
                let entry = WeatherWidgetEntry(weathers: weathers)
                let timeLine = Timeline(entries: [entry], policy: .after(refreshDate))
                completion(timeLine)
            } catch {
                print(error)
            }
        }
    }
}
