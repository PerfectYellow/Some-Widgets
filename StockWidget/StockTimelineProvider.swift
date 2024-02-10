//
//  StockTimelineProvider.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 09/02/2024.
//

import WidgetKit

struct StockTimelineProvider: IntentTimelineProvider {
    typealias Entry = StockTimelineEntry
    typealias Intent = StockConfigurationIntent
    
    func placeholder(in context: Context) -> StockTimelineEntry {
        StockTimelineEntry(stock: nil, configuration: StockConfigurationIntent())
    }
    
    func getSnapshot(for configuration: StockConfigurationIntent, in context: Context, completion: @escaping (StockTimelineEntry) -> Void) {
        completion(StockTimelineEntry(stock: nil, configuration: StockConfigurationIntent()))
    }
    
    func getTimeline(for configuration: StockConfigurationIntent, in context: Context, completion: @escaping (Timeline<StockTimelineEntry>) -> Void) {
        Task {
            do {
                let stock = try await StockServices().getStockData(for: configuration.customStockSymbol?.identifier ?? "")
                let entry = StockTimelineEntry(stock: stock, configuration: configuration)
                let timeline = Timeline(entries: [entry], policy: .atEnd)
                completion(timeline)
            } catch {
                print(error)
            }
        }
    }
}
