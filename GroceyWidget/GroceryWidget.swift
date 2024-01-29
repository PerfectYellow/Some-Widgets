//
//  GroceryWidget.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 28/01/2024.
//

import WidgetKit
import SwiftUI

struct GroceryWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: GroceryConstants.widgetKind, provider: GroceryTimeline()) { entry in
            GroceryWidgetView(groceryEntry: entry)
                .containerBackground(.white.gradient, for: .widget)
        }
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
        .configurationDisplayName("Grocery List")
        .description("A Widget to display last grocery items from grocery list app.")
    }
}
