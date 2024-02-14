//
//  FocusTimerLiveWidget.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 12/02/2024.
//

import SwiftUI
import WidgetKit

struct FocusTimerLiveWidget: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: FocusTimerAttributes.self) { context in
            FocusTimerEntryView(context: context)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.center) {
                    Image(systemName: "alarm")
                }
            } compactLeading: {
                EmptyView()
            } compactTrailing: {
                EmptyView()
            } minimal: {
                EmptyView()
            }

        }

    }
}
