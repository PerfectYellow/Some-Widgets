//
//  Country.swift
//  WidgetKitsTest
//
//  Created by Mohammad Afshar on 31/01/2024.
//

import Foundation

struct Country: Identifiable {
    let id = UUID()
    let name: String
    let flag: String
    var currencyCode: String
}

extension Country {
    static var USA: Country {
        .init(name: "United State of America", flag: "🇺🇸", currencyCode: "USD")
    }
    
    static var samples: [Country] {[
        .init(name: "Indaia", flag: "🇮🇳", currencyCode: "INR"),
        .init(name: "Canada", flag: "🇨🇦", currencyCode: "CAD"),
        .init(name: "Australia", flag: "🇦🇺", currencyCode: "AUD"),
        .init(name: "Mexico", flag: "🇲🇽", currencyCode: "MXN"),
        .init(name: "Iran", flag: "🇮🇷", currencyCode: "IRR")
    ]}
}
