//
//  HelloStaticWidgetTimeLineProvider.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 17/01/2024.
//

import Foundation
import WidgetKit

class HelloStaticWidgetTimeLineProvider: TimelineProvider {
    typealias Entry = HelloStaticWidgetEntry
    
    func placeholder(in context: Context) -> HelloStaticWidgetEntry {
        HelloStaticWidgetEntry(date: Date(), imageUrl: "https://source.unsplash.com/random/?flowers")
    }
    
    func getSnapshot(in context: Context, completion: @escaping (HelloStaticWidgetEntry) -> Void) {
        completion(
            HelloStaticWidgetEntry(date: Date(), imageUrl: "https://source.unsplash.com/random/?flowers")
        )
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<HelloStaticWidgetEntry>) -> Void) {
        let url = "https://source.unsplash.com/random/?nature"
        var entries = [HelloStaticWidgetEntry]()
        let current = Date()
        let nextDate = Calendar.current.date(byAdding: .second, value: 45, to: current)
        for _ in 1...5 {
            let entry = Entry(date: Date(), imageUrl: url)
            entries.append(entry)
        }
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}
