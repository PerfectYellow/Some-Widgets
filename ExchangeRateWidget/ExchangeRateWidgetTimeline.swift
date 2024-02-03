//
//  ExchangeRateWidgetTimeline.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 03/02/2024.
//

import WidgetKit

struct ExchangeRateWidgetTimeline: TimelineProvider {
    typealias Entry = ExchangeRateWidgetEntry
    
    func placeholder(in context: Context) -> ExchangeRateWidgetEntry {
        ExchangeRateWidgetEntry(countries: Country.samples, widgetFamily: .systemMedium)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (ExchangeRateWidgetEntry) -> Void) {
        completion(
            ExchangeRateWidgetEntry(countries: Country.samples, widgetFamily: context.family)
        )
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<ExchangeRateWidgetEntry>) -> Void) {
        let entry = ExchangeRateWidgetEntry(countries: Country.samples, widgetFamily: context.family)
        let timeline = Timeline(entries: [entry], policy: .never)
        
        completion(timeline)
    }
}
