//
//  TodayInfoWidget.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 17/01/2024.
//

import SwiftUI
import WidgetKit

struct TodayInfoWidget: Widget {
    let kind = "TodayInfoWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: TodayInfoTimeLineProvider()) { entry in
            TodayInfoView(entryDate: entry)
                .containerBackground(for: .widget) {
                    VStack(spacing: 0) {
                        Color.yellow
                        Color.blue
                        Color.green
                    }
                }
        }
        .supportedFamilies([.systemSmall])
        .contentMarginsDisabled()
        .configurationDisplayName("Today Date")
        .description("Show todat day and hour and month")
    }
}

#Preview("Today Info", as: .systemSmall) {
    TodayInfoWidget()
} timeline: {
    TodayInfoTimeLineEntry(date: Date())
}
