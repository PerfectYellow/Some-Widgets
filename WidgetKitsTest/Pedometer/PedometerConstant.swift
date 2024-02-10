//
//  PedometerConstant.swift
//  WidgetKitsTest
//
//  Created by Mohammad Afshar on 10/02/2024.
//

import WidgetKit

struct PedometerConstant {
    static var stepsStorekey = "totalSteps"
    static var appGroupName = "group.RemindersWidget.com"
    static var widgetKind = "PedometerWidget"
    
    static func reloadPedometerTimeline() {
        WidgetCenter.shared.reloadAllTimelines()
//        WidgetCenter.shared.reloadTimelines(ofKind: Self.widgetKind)
    }
}
