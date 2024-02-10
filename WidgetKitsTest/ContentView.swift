//
//  ContentView.swift
//  WidgetKitsTest
//
//  Created by Mohammad Afshar on 17/01/2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    var body: some View {
//        RemindersView()
        
//        GroceryView()
        
//        ExchangeRateAppView()
        
        StockView(stock: StockObservation())
    }
}

extension ViewBuilder {
    public static func buildBlock() -> EmptyView {
        EmptyView()
    }
}

#Preview {
    ContentView()
}
