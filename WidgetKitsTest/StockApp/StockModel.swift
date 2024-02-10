//
//  StockModel.swift
//  WidgetKitsTest
//
//  Created by Mohammad Afshar on 04/02/2024.
//  

import Foundation

struct StockModel: Codable, Equatable {
    let stockOpen, high, low, current, previousClose: Double
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case stockOpen = "open"
        case high, low, current
        case previousClose = "previous_close"
        case name
    }
}
