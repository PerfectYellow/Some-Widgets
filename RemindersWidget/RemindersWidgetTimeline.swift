//
//  RemindersWidgetTimeline.swift
//  WidgetKitsTest
//
//  Created by Mohammad Afshar on 25/01/2024.
//

import WidgetKit

struct RemindersWidgetTimeline: TimelineProvider {
    typealias Entry = RemindersWidgetEntry
    
    func placeholder(in context: Context) -> RemindersWidgetEntry {
        RemindersWidgetEntry(date: Date(), remindersCount: 5)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (RemindersWidgetEntry) -> Void) {
        completion(RemindersWidgetEntry(date: Date(), remindersCount: 5))
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<RemindersWidgetEntry>) -> Void) {
        let entry = RemindersWidgetEntry(date: Date(), remindersCount: getNumberOfReminders())
        
        completion(
            Timeline(entries: [entry], policy: .atEnd)
        )
    }
    
    func getNumberOfReminders() -> Int {
        let defaults = UserDefaults(suiteName: RemindersAppConstants.groupName)
//        return defaults?.integer(forKey: RemindersAppConstants.storegKey) ?? 0 // as? Int ?? 0
        return defaults?.value(forKey: RemindersAppConstants.groupName) as? Int ?? 0
    }
}
