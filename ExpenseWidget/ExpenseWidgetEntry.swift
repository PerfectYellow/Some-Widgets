//
//  ExpenseWidgetEntry.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 29/01/2024.
//

import WidgetKit

struct ExpenseWidgetEntry: TimelineEntry {
    let date = Date()
    let expense: ExpenseCategory
}
