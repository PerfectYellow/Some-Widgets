//
//  ColorWidgetTimelineProvider.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 29/01/2024.
//

import WidgetKit
import SwiftUI

struct ColorWidgetTimelineProvider: IntentTimelineProvider {
    typealias Entry = ColorWidgetEntry
    typealias Intent = ColorSelectionIntent
    
    func placeholder(in context: Context) -> ColorWidgetEntry {
        ColorWidgetEntry(backColor: .orange)
    }
    
    func getSnapshot(for configuration: ColorSelectionIntent, in context: Context, completion: @escaping (ColorWidgetEntry) -> Void) {
        completion(
            ColorWidgetEntry(backColor: .pink)
        )
    }
    
    func getTimeline(for configuration: ColorSelectionIntent, in context: Context, completion: @escaping (Timeline<ColorWidgetEntry>) -> Void) {
        completion(
            Timeline(entries: [ColorWidgetEntry(backColor: configuration.backColor)], policy: .never)
        )
    }
}
