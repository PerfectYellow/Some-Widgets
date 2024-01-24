//
//  WeatherWidgetWidget.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 23/01/2024.
//

import SwiftUI
import WidgetKit

struct WeatherWidgetWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: "WeatherWidgetWidget", provider: WeatherWidgetProvider()) { entry in
            WeatherWidgetView(entry: entry)
                .containerBackground(.clear, for: .widget)
        }
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
        .configurationDisplayName("Weathers")
        .description("Weather of all week days")
    }
}
