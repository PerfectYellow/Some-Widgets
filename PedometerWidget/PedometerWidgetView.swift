//
//  PedometerView.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 10/02/2024.
//

import SwiftUI

struct PedometerWidgetView: View {
    @Environment(\.widgetFamily) private var widgetFamily
    var entry: PedometerEntry
    
    var body: some View {
        switch widgetFamily {
            case .accessoryCircular:
                ZStack {
                    Circle().stroke(lineWidth: 4)
                    Image(systemName: "figure.walk")
                    Text("\(entry.steps)")
                }
                
            default:
                VStack {
                    Text("\(entry.steps) steps")
                }
        }
    }
}
