//
//  TodayInfoTimeLineProvider.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 17/01/2024.
//

import Foundation
import WidgetKit

struct TodayInfoTimeLineProvider: TimelineProvider {
    typealias Entry = TodayInfoTimeLineEntry
    
    func placeholder(in context: Context) -> TodayInfoTimeLineEntry {
        TodayInfoTimeLineEntry(date: Date())
    }
    
    func getSnapshot(in context: Context, completion: @escaping (TodayInfoTimeLineEntry) -> Void) {
        completion(
            TodayInfoTimeLineEntry(date: Date())
        )
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<TodayInfoTimeLineEntry>) -> Void) {
        var timeLines = [TodayInfoTimeLineEntry]()
        let currentDateTime = Date()
        
        for minuteOffset in 1...5 {
            let entryDate = Calendar.current.date(byAdding: .minute, value: minuteOffset, to: currentDateTime)!
            timeLines.append(TodayInfoTimeLineEntry(date: entryDate))
        }
        
        completion(
            Timeline(entries: timeLines, policy: .atEnd)
        )
    }
}
