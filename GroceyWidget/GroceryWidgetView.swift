//
//  GroceryWidgetView.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 28/01/2024.
//

import SwiftUI
import WidgetKit

struct GroceryWidgetView: View {
    let groceryEntry: GroceyEntry
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Image(systemName: "list.bullet.circle.fill")
                    .foregroundStyle(.orange)
                
                Text("Grocery")
                    .font(.title2)
            }
            
            Rectangle()
                .foregroundStyle(Color.orange.gradient.opacity(0.4))
                .frame(height: 1)
            
            VStack(alignment: .leading) {
                ForEach(groceryEntry.items) { item in
                    HStack {
                        Color(hex: item.color ?? "#FF5733")
                            .frame(width: 5, height: 20)
                        
                        Text(item.name ?? "?...")
                            .lineLimit(1)
                    }
                    .font(.subheadline)
                }
            }
            .padding()
            Spacer(minLength: 0)
        }
        .padding()
    }
}

#Preview {
    GroceryWidgetView(groceryEntry: GroceyEntry())
        .previewContext(WidgetPreviewContext(family: .systemSmall))
}
