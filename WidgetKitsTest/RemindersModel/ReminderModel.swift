//
//  ReminderModel.swift
//  WidgetKitsTest
//
//  Created by Mohammad Afshar on 25/01/2024.
//

import Foundation

struct ReminderModel: Identifiable {
    let id = UUID()
    let title: String
    let dueOn: Date
}
