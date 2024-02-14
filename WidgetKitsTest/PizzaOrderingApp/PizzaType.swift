//
//  PizzaType.swift
//  WidgetKitsTest
//
//  Created by Mohammad Afshar on 13/02/2024.
//

import Foundation

enum PizzaType: String, Identifiable & CaseIterable {
    case cheese = "Cheese"
    case chicken = "Chicken"
    case neapolitan = "Neapolitan"
    case hawaiian = "Hawaiian"
    case greek = "Greek"
    
    var id: UUID {
        return UUID()
    }
}
