//
//  ColorWidgetWidget.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 29/01/2024.
//

import WidgetKit
import SwiftUI

struct ColorWidgetWidget: Widget {
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: "ColorWidgetWidget", intent: ColorSelectionIntent.self, provider: ColorWidgetTimelineProvider()) { entry in
            ColorWidgetView(backColor: entry)
        }
    }
}
