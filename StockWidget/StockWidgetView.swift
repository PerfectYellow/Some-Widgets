//
//  StockWidgetView.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 09/02/2024.
//

import SwiftUI

struct StockWidgetView: View {
    let entry: StockTimelineEntry
    
    var body: some View {
        VStack {
            if let stock = entry.stock {
                Text(stock.name)
                    .bold()
                
                Spacer()
                
                Text(stock.current.formatted(.currency(code: "USD")))
                    .font(.title2.bold())
                    .foregroundStyle(stock.current < stock.previousClose ? .red : .green)
                
                Text("Prev Close: \(stock.previousClose.formatted(.currency(code: "USD")))")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
                
                Spacer()
            } else {
                ContentUnavailableView("No Way :0", image: "person")
            }
        }
    }
}

//#Preview {
//    StockWidgetView()
//}
