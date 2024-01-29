//
//  RemindersWidgetWidget.swift
//  WidgetKitsTest
//
//  Created by Mohammad Afshar on 25/01/2024.
//

import WidgetKit
import SwiftUI

struct RemindersWidgetWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: RemindersAppConstants.widgetKind, provider: RemindersWidgetTimeline()) { entry in
            RemindersWidgetView(remindersCount: entry.remindersCount)
                .containerBackground(.purple.gradient, for: .widget)
        }
        .supportedFamilies([.systemSmall])
        .configurationDisplayName("Reminder Counter")
        .description("A Widget that count all reminder available in our reminder app")
        .contentMarginsDisabled()
    }
    
}
