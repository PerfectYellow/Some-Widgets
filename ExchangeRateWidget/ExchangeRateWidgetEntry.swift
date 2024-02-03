//
//  ExchangeRateWidgetEntry.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 03/02/2024.
//

import WidgetKit

struct ExchangeRateWidgetEntry: TimelineEntry {
    let date = Date()
    let countries: [Country]
    let widgetFamily: WidgetFamily
}
