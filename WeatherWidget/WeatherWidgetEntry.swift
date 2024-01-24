//
//  WeatherWidgetEntry.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 23/01/2024.
//

import Foundation
import WidgetKit

struct WeatherWidgetEntry: TimelineEntry {
    var date: Date = Date()
    var weathers: [Weather]
}
