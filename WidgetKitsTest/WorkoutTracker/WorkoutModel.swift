//
//  WourkoutModel.swift
//  WidgetKitsTest
//
//  Created by Mohammad Afshar on 24/01/2024.
//

import Foundation

struct WorkoutModel: Identifiable {
    let id = UUID()
    let day: String
    let minutes: Int
    
    static var samples: [WorkoutModel] {
        [
            .init(day: "Mon", minutes: Int.random(in: 0...60)),
            .init(day: "Tue", minutes: Int.random(in: 0...60)),
            .init(day: "Wen", minutes: Int.random(in: 0...60)),
            .init(day: "Thu", minutes: Int.random(in: 0...60)),
            .init(day: "Fri", minutes: Int.random(in: 0...60)),
            .init(day: "Sat", minutes: Int.random(in: 0...60)),
            .init(day: "Sun", minutes: Int.random(in: 0...60))
        ]
    }
}
