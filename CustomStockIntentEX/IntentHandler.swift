//
//  IntentHandler.swift
//  CustomStockIntentEX
//
//  Created by Mohammad Afshar on 09/02/2024.
//

import Intents

class IntentHandler: INExtension, StockConfigurationIntentHandling {
    func provideCustomStockSymbolOptionsCollection(for intent: StockConfigurationIntent) async throws -> INObjectCollection<CustomStockSymbol> {
        let stocks: [CustomStockSymbol] = [
            .init(identifier: "AAPL", display: "Apple"),
            .init(identifier: "MSFT", display: "Microsoft"),
            .init(identifier: "RIVN", display: "Rivian"),
            .init(identifier: "AMNZ", display: "Amazon"),
            .init(identifier: "NFLX", display: "Netflix"),
            .init(identifier: "TWTR", display: "Twitter"),
            .init(identifier: "TWLO", display: "Twilio")
        ]
        
        return INObjectCollection(items: stocks)
    }
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return self
    }
}
