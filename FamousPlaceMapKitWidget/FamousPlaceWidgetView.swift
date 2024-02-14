//
//  FamousPlaceWidgetView.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 11/02/2024.
//

import SwiftUI

struct FamousPlaceWidgetView: View {
    let entry: FamousPlaceTimelineEntry
    
    var body: some View {
        ZStack(alignment: .bottom) {
            entry.place.image
            
            Text(entry.place.name)
                .foregroundStyle(.white)
                .font(.caption.bold())
                .frame(maxWidth: .infinity)
                .frame(height: 20)
                .background(.orange.gradient.opacity(0.5))
        }
    }
}
