//
//  StockWidget.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 09/02/2024.
//

import WidgetKit
import SwiftUI

struct StockWidget: Widget {
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: "StockWidget", intent: StockConfigurationIntent.self, provider: StockTimelineProvider()) { entry in
            StockWidgetView(entry: entry)
                .containerBackground(.clear, for: .widget)
        }
        .supportedFamilies([.systemSmall])
        .configurationDisplayName("Stock Widget")
        .description("A Dynamic Widget to show Stock")
    }
}
