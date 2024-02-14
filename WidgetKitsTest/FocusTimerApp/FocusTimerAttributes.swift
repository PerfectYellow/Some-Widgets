//
//  FocusTimerAttributes.swift
//  WidgetKitsTest
//
//  Created by Mohammad Afshar on 12/02/2024.
//

import ActivityKit
import Foundation

struct FocusTimerAttributes: ActivityAttributes {
    var timerName: String
    
    public struct ContentState: Codable & Hashable {
        var endDate: Date
    }
    
//    func checkContentStateSpace() {
//        let data = try? JSONEncoder().encode(ContentState())
//        print(data?.count ?? "Error: nil")
//    }
}
