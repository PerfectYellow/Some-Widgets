//
//  File.swift
//  WidgetKitsTest
//
//  Created by Mohammad Afshar on 04/02/2024.
//  "https://api.lil.software/stocks?symbol=AAPL"

import Foundation

@MainActor
@Observable
class StockObservation: Equatable {
    static func == (lhs: StockObservation, rhs: StockObservation) -> Bool {
        return lhs.data == rhs.data
    }
    
    var data: StockModel? = nil
    
    func pupulateData() {
        Task {
            do {
                data = try await StockServices().getStockData(for: "AAPL")
            } catch {
                print("Ops")
            }
        }
    }
    
}

struct StockServices {
    func getStockData(for symbol: String) async throws -> StockModel {
        guard let url = URL(string: "https://api.lil.software/stocks?symbol=\(symbol)") else {
            fatalError("url problem")
        }
        let data = try Data(contentsOf: url)
        print(String(data: data, encoding: .utf8))
        
        return try JSONDecoder().decode(StockModel.self, from: data)
    }
}
