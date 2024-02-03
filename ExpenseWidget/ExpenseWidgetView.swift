//
//  ExpenseWidgetView.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 29/01/2024.
//

import SwiftUI
import WidgetKit

struct ExpenseWidgetView: View {
    let category: ExpenseCategory
    
    var body: some View {
        switch category {
            case .all:
                ExpenseItemView(label: "All Expense", amount: 120.0, budget: 140.0, color: .red)
            case .food:
                ExpenseItemView(label: "Food Expense", amount: 120.0, budget: 140.0, color: .red)
            case .grocery:
                ExpenseItemView(label: "Grocey Expense", amount: 120.0, budget: 140.0, color: .red)
            case .gas:
                ExpenseItemView(label: "Gas Expense", amount: 120.0, budget: 140.0, color: .red)
            case .rent:
                ExpenseItemView(label: "Rent Expense", amount: 120.0, budget: 140.0, color: .red)
        }
    }
}

struct ExpenseWidgetView_Preview: PreviewProvider {
    static var previews: some View {
        ExpenseWidgetView(category: .all)
            .previewContext(WidgetPreviewContext(family: .systemSmall))
            .containerBackground(.blue, for: .widget)
    }
}
