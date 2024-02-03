//
//  ExpenseWidget.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 29/01/2024.
//

import SwiftUI
import WidgetKit

struct ExpenseWidget: Widget {
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: "ExpenseWidget", intent: MonthlyExpenseIntent.self, provider: ExpenseWidgetTimelineProvider()) { entry in
            ExpenseWidgetView(category: entry.expense)
                .containerBackground(.clear, for: .widget)
        }
        .contentMarginsDisabled()
        .configurationDisplayName("Expense Widget")
        .description("A Widget to show howmuch you expensed")
    }
}
