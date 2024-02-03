//
//  ExpenseWidgetView.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 29/01/2024.
//

import Foundation

enum ExpenseCategory: Int {
    case all = 1
    case food
    case grocery
    case gas
    case rent
    
    var desc: String {
        switch self {
            case .all:
                return "All Expense"
            case .food:
                return "Food Expense"
            case .grocery:
                return "Grocery Expense"
            case .gas:
                return "Gas Expense"
            case .rent:
                return "Rent Expense"
        }
    }
}
