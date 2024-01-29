//
//  Logger.swift
//  WidgetKitsTest
//
//  Created by Mohammad Afshar on 28/01/2024.
//

import Foundation
import OSLog

extension Logger {
    private static let subsystem = Bundle.main.bundleIdentifier!
    
    static var grocery = Logger(subsystem: subsystem, category: "Grocery")
}
