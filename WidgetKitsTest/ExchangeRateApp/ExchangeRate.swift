//
//  ExchangeRate.swift
//  WidgetKitsTest
//
//  Created by Mohammad Afshar on 31/01/2024.
//

import Foundation

struct ExchangeRate: Codable {
    let success: Bool
    let query: Query?
    let info: Info?
    let resault: Double
    let date: String
}

struct Query: Codable {
    let from, to: String
    let amount: Int
}

struct Info: Codable {
    let rate: Double
}
