//
//  WorkoutWidgetEntery.swift
//  WidgetKitsTest
//
//  Created by Mohammad Afshar on 24/01/2024.
//

import Foundation
import WidgetKit

struct WorkoutWidgetEntry: TimelineEntry {
    let date: Date
    let workouts: [WorkoutModel]
    let widgetFamily: WidgetFamily
}
