//
//  WorkoutView.swift
//  WidgetKitsTest
//
//  Created by Mohammad Afshar on 24/01/2024.
//

import SwiftUI
import Charts

struct WorkoutView: View {
    var workouts: [WorkoutModel] = WorkoutModel.samples
    var showLinearChart: Bool = true
    
    var body: some View {
        VStack {
            Chart(workouts) { workout in
                if showLinearChart {
                    AreaMark(
                        x: .value("Day", workout.day),
                        y: .value("Mins", workout.minutes)
                    )
                    .interpolationMethod(.catmullRom)
                    .foregroundStyle(Gradient(colors: [
                        .blue.opacity(0.4), .clear
                    ]))
                    
                    LineMark(
                        x: .value("Day", workout.day),
                        y: .value("Mins", workout.minutes)
                    )
                    .interpolationMethod(.catmullRom)
                    
                    PointMark(
                        x: .value("Day", workout.day),
                        y: .value("Mins", workout.minutes)
                    )
                    .foregroundStyle(.red)
                    .annotation(position: .leading) {
                        Text(workout.minutes.formatted())
                            .font(.caption2)
                    }
                } else {
                    BarMark(
                        x: .value("Day", workout.day),
                        y: .value("Mins", workout.minutes)
                    )
                    .foregroundStyle(by: .value("Day", workout.day))
                    .annotation {
                        Text("\(workout.minutes)")
                            .font(.caption2)
                    }
                }
            }
        }
        .padding()
    }
}

struct Preview_Workout: PreviewProvider {
    static var previews: some View {
        WorkoutView()
    }
}
