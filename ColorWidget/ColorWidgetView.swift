//
//  ColorWidget.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 29/01/2024.
//

import SwiftUI

struct ColorWidgetView: View {
    let backColor: ColorWidgetEntry
    
    var body: some View {
        ZStack {
            ContainerRelativeShape()
                .foregroundStyle(backgroundColor)
            
            Text("Hi im Afshar :)")
                .foregroundStyle(.white)
                .font(.title)
                .padding()
        }
    }
    
    private var backgroundColor: Color {
        switch backColor.backColor {
            case .pink:
                return .pink
                
            case .yellow:
                return .yellow
                
            case .green:
                return .green
                
            case .orange:
                return .orange
                
            default:
                return .purple
        }
    }
}

//#Preview {
//    ColorWidget()
//}
