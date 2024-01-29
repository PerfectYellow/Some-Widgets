//
//  RemindersAppConstant.swift
//  WidgetKitsTest
//
//  Created by Mohammad Afshar on 26/01/2024.
//

import WidgetKit

struct RemindersAppConstants {
    static let storegKey = "totalReminders"
    static let groupName = "group.RemindersWidget.com"
    static let widgetKind = "RemindersWidgetWidget"
    
    static func refreshReminder() {
        WidgetCenter.shared.reloadTimelines(ofKind: Self.groupName)
//        WidgetCenter.shared.reloadAllTimelines()
    }
}
