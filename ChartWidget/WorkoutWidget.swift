//
//  WorkoutWidget.swift
//  WidgetKitsTest
//
//  Created by Mohammad Afshar on 24/01/2024.
//

import SwiftUI
import WidgetKit

struct WorkoutWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: "WorkoutWidget", provider: WorkoutTimelineProvider()) { entry in
            WorkoutView(workouts: entry.workouts, showLinearChart: entry.widgetFamily == .systemMedium)
                .containerBackground(.cyan.gradient, for: .widget)
        }
        .supportedFamilies([.systemMedium, .systemLarge])
        .configurationDisplayName("Workout Widget")
        .description("Track your workout")
    }
}
