//
//  GroceyConstant.swift
//  WidgetKitsTest
//
//  Created by Mohammad Afshar on 26/01/2024.
//

import SwiftUI
import WidgetKit

struct GroceryConstants {
    static let appGroupContainerUrl = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.RemindersWidget.com")
    let popo = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)
    static var randomColor: Color {
        Color(
            red: Double.random(in: 0...1),
            green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1)
        )
    }
    
    static let widgetKind = "com.groceryWidget"
    
    static func reloadGroceryTimeline() {
//        WidgetCenter.shared.reloadTimelines(ofKind: Self.widgetKind)
        WidgetCenter.shared.reloadAllTimelines()
    }
}
