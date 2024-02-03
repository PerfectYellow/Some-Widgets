//
//  ExpenseView.swift
//  WidgetKitsTest
//
//  Created by Mohammad Afshar on 29/01/2024.
//

import SwiftUI
import WidgetKit

struct ExpenseItemView: View {
    let label: String
    let amount: Double
    let budget: Double
    let color: Color
    
    var body: some View {
        ZStack {
            ContainerRelativeShape()
                .fill(color.gradient.opacity(0.5))
            
            Text(label)
                .bold()
            
            Spacer(minLength: 0)
            
            Gauge(value: amount, in: 0...budget) {
                Text(label.split(separator: " ")[0])
            } currentValueLabel: {
                Text("\(amount, specifier: "$%.0f")")
                    .font(.system(size: 6))
                    .offset(y: 11)
            } minimumValueLabel: {
                Text("$ \(0)")
                    .font(.system(size: 4))
            } maximumValueLabel: {
                Text("\(budget, specifier: "$%.0f")")
                    .font(.system(size: 4))
            }
            .scaleEffect(2.0)
            .tint(color.gradient)
            .gaugeStyle(.accessoryCircular)
            .shadow(radius: 2)
            
            Spacer(minLength: 0)
        }
        .foregroundStyle(.white)
        .padding(5)
    }
}

struct ExpenseItemView_Preview: PreviewProvider {
    static var previews: some View {
        ExpenseItemView(label: "Cool", amount: 200.0, budget: 240.0, color: .red)
            .previewContext(WidgetPreviewContext(family: .systemSmall))
            .containerBackground(.white, for: .widget)
    }
}
