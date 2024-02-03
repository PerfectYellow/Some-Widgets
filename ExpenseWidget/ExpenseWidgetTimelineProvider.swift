//
//  ExpenseWidgetTimelineProvider.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 29/01/2024.
//

import WidgetKit

struct ExpenseWidgetTimelineProvider: IntentTimelineProvider {
    typealias Entry = ExpenseWidgetEntry
    typealias Intent = MonthlyExpenseIntent
    
    func placeholder(in context: Context) -> ExpenseWidgetEntry {
        ExpenseWidgetEntry(expense: .all)
    }
    
    func getSnapshot(for configuration: MonthlyExpenseIntent, in context: Context, completion: @escaping (ExpenseWidgetEntry) -> Void) {
        completion(ExpenseWidgetEntry(expense: .all))
    }
    
    func getTimeline(for configuration: MonthlyExpenseIntent, in context: Context, completion: @escaping (Timeline<ExpenseWidgetEntry>) -> Void) {
        let entry = ExpenseWidgetEntry(expense: category(category: configuration))
        let timeline = Timeline(entries: [entry], policy: .never)
        completion(timeline)
    }
    
    private func category(category: MonthlyExpenseIntent) -> ExpenseCategory {
        switch category.category {
            case .all:
                return .all
                
            case .food:
                return .food
                
            case .grocery:
                return .grocery
                
            case .gas:
                return .gas
                
            case .rent:
                return .rent
                
            case .unknown:
                return .all
                
            @unknown default:
                return .all
        }
    }
}
