//
//  QuoteServices.swift
//  WidgetKitsTest
//
//  Created by Mohammad Afshar on 19/01/2024.
//

import Foundation
import Observation

//@Observable
class QuoteServices {

//    @ObservationIgnored
    
    func getQuote() async throws -> QuoteModel {
        let url = URL(string: "https://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json")
        let (data, response) = try await URLSession.shared.data(from: url!)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            print("Failed in data task")
            fatalError("")
        }
        
        if let statusCode = response as? HTTPURLResponse, statusCode.statusCode == 200 {
            print("\n\nSuccess")
        } else {
            print("Failed in data task")
        }
        print(String(data: data, encoding: .utf8))
        let quote = try JSONDecoder().decode(QuoteModel.self, from: data)
        print(quote)
        return quote
    }
}
