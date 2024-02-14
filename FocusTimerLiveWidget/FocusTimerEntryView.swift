//
//  FocusTimerEntryView.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 12/02/2024.
//

import SwiftUI
import WidgetKit

struct FocusTimerEntryView: View {
    let context: ActivityViewContext<FocusTimerAttributes>
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.orange.gradient.opacity(0.5))
            
            HStack {
                Text(context.state.endDate, style: .timer)
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                Text(context.attributes.timerName)
                    .font(.body)
            }
            .padding()
        }
    }
}
