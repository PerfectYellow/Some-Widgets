//
//  StockView.swift
//  WidgetKitsTest
//
//  Created by Mohammad Afshar on 04/02/2024.
//

import SwiftUI

struct StockView: View {
    var stock: StockObservation
    
    var body: some View {
        Text("Hello, World!")
        Button("tap me") {
            print(stock.data)
            stock.data = StockModel(stockOpen: 20.20, high: 20.20, low: 20.20, current: 20.20, previousClose: 20.20, name: "AAOP")
            print(stock.data)
        }
        .onAppear {
            stock.pupulateData()
            print(stock)
        }
        .onChange(of: stock) { oldValue, newValue in
            print(newValue)
        }
//        .task {
//            await TestServices().getTestData()
//        }
    }
}

#Preview {
    StockView(stock: StockObservation())
}
