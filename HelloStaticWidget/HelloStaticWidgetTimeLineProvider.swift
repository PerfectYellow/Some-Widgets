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
        HelloStaticWidgetEntry(date: Date())
    }
    
    func getSnapshot(in context: Context, completion: @escaping (HelloStaticWidgetEntry) -> Void) {
        completion(
            HelloStaticWidgetEntry(date: Date())
        )
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<HelloStaticWidgetEntry>) -> Void) {
        completion(
            Timeline(entries: [
                HelloStaticWidgetEntry(date: Date())
            ],
                     policy: .never)
        )
    }
}
