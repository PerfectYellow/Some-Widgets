//
//  File.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 17/01/2024.
//

import WidgetKit
import SwiftUI

struct HelloStaticWidgetWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: "HelloStaticWidgetWidget", provider: HelloStaticWidgetTimeLineProvider()) { entry in
            HelloStaticWidgetView(entry: entry)
        }
        .supportedFamilies([.systemLarge])
        .contentMarginsDisabled()
    }
}
