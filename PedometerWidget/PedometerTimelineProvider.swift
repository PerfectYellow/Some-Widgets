//
//  PedometerTimelineProvider.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 10/02/2024.
//

import WidgetKit

struct PedometerTimelineProvider: TimelineProvider {
    typealias Entry = PedometerEntry
    
    func placeholder(in context: Context) -> PedometerEntry {
        PedometerEntry(steps: 2020)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (PedometerEntry) -> Void) {
        completion(PedometerEntry(steps: 2022))
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<PedometerEntry>) -> Void) {
        let defaults = UserDefaults(suiteName: PedometerConstant.appGroupName)
        let steps = defaults?.integer(forKey: PedometerConstant.stepsStorekey) ?? 0
        let entry = PedometerEntry(steps: steps)
        let timeline = Timeline(entries: [entry], policy: .never)
        completion(timeline)
    }
}
