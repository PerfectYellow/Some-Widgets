//
//  FocuTimerAppView.swift
//  WidgetKitsTest
//
//  Created by Mohammad Afshar on 12/02/2024.
//

import SwiftUI
import ActivityKit

struct FocuTimerAppView: View {
    @State private var activity: Activity<FocusTimerAttributes>? = nil
    @State private var timerName: String = "Focuse Timer"
    @State private var focusTime: Double = 20.0
    @State private var timerState: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                if timerState {
                    Text("Timer in Progress.")
                } else {
                    VStack {
                        TextField("Enter Timer name", text: $timerName)
                            .textFieldStyle(.roundedBorder)
                        
                        Text("Focus Time: \(focusTime.formatted())")
                            .font(.title3)
                        
                        Stepper("Adjust Focus Time", value: $focusTime, in: 5...60, step: 5)
                    }
                    .padding()
                    .navigationTitle("Focus Timer")
                }
                
                HStack {
                    Button("Start Timer") {
                        startTimer()
                    }
                    
                    Button("Stop Timer") {
                        stopTimer()
                    }
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.regular)
            }
            .padding()
            .navigationTitle("Focus Timer")
        }
    }
    
    private func startTimer() {
        let attribute = FocusTimerAttributes(timerName: timerName)
        let state = FocusTimerAttributes.ContentState(endDate: Date().addingTimeInterval(60 * focusTime))
        let activityContent = ActivityContent(state: state, staleDate: nil)
        activity = try? Activity<FocusTimerAttributes>.request(attributes: attribute,
                                                          content: activityContent,
                                                          pushType: nil)
        timerState = true
    }
    
    private func stopTimer() {
        let state = FocusTimerAttributes.ContentState(endDate: .now)
        let activityContent = ActivityContent(state: state, staleDate: nil)
        
        Task {
            await activity?.end(activityContent, dismissalPolicy: .immediate)
        }
        timerState = false
    }
}

