//
//  WorkoutTimelineProvider.swift
//  WidgetKitsTest
//
//  Created by Mohammad Afshar on 24/01/2024.
//

import Foundation
import WidgetKit

struct WorkoutTimelineProvider: TimelineProvider {
    typealias Entry = WorkoutWidgetEntry
    let sample = WorkoutModel.samples
    
    func placeholder(in context: Context) -> WorkoutWidgetEntry {
        WorkoutWidgetEntry(date: Date(), workouts: sample, widgetFamily: context.family)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (WorkoutWidgetEntry) -> Void) {
        completion(
            WorkoutWidgetEntry(date: Date(), workouts: sample, widgetFamily: context.family)
        )
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<WorkoutWidgetEntry>) -> Void) {
        let current = Date()
        let refreshDate = Calendar.current.date(byAdding: .minute, value: 1, to: current)!
        let entry = WorkoutWidgetEntry(date: current, workouts: sample, widgetFamily: context.family)
        let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
        completion(timeline)
    }
}
