//
//  ExchangeRateWidget.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 03/02/2024.
//

import WidgetKit
import SwiftUI

struct ExchangeRateWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: "ExchangeRateWidget", provider: ExchangeRateWidgetTimeline()) { entry in
            ExchangeRateWidgetView(entry: entry)
                .containerBackground(.white, for: .widget)
        }
        .supportedFamilies([.systemMedium, .systemLarge])
        .contentMarginsDisabled()
    }
}
