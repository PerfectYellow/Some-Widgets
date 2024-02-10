//
//  PedometerWidget.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 10/02/2024.
//

import WidgetKit
import SwiftUI

struct PedometerWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: PedometerConstant.widgetKind, provider: PedometerTimelineProvider(), content: { entry in
            PedometerWidgetView(entry: entry)
                .containerBackground(.clear, for: .widget)
        })
        .supportedFamilies([.accessoryCircular])
        .configurationDisplayName("Step Counter")
        .description("A Widget to Count your steps")
    }
}
