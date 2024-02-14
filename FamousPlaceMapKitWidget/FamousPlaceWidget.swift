//
//  FamousPlaceWidget.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 11/02/2024.
//

import SwiftUI
import WidgetKit

struct FamousPlaceWidget: Widget {
    var body: some WidgetConfiguration {
        
        StaticConfiguration(kind: "FamousPlaceWidget", provider: FamousPlaceTimelineProvider()) { entry in
            FamousPlaceWidgetView(entry: entry)
                .containerBackground(.clear, for: .widget)
        }
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
        .configurationDisplayName("Famous Place Map")
        .description("A widget to show famous place on the word")
    }
}
