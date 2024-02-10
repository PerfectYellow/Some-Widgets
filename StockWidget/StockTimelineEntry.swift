//
//  StockTimelineEntry.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 09/02/2024.
//

import WidgetKit

struct StockTimelineEntry: TimelineEntry {
    let date = Date()
    let stock: StockModel?
    let configuration: StockConfigurationIntent
}
