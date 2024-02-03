//
//  ExchangeRateWidgetView.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 03/02/2024.
//

import SwiftUI
import WidgetKit

struct ExchangeRateWidgetView: View {
    let entry: ExchangeRateWidgetEntry
    
    var body: some View {
        let row = entry.widgetFamily == .systemMedium ? 2 : 4
        
        VStack {
            ForEach(entry.countries.prefix(row)) { county in
                Link(
                    destination: URL(string: "exchangeWidget://country/\(county.currencyCode)")!,
                    label: {
                        CountryListCell(country: county)
                })
            }
        }
    }
}

struct ExchangeRateWidgetView_Preview: PreviewProvider {
    static var previews: some View {
        ExchangeRateWidgetView(entry: ExchangeRateWidgetEntry(countries: Country.samples, widgetFamily: .systemMedium))
            .containerBackground(.white, for: .widget)
            .previewContext(WidgetPreviewContext(family: .systemMedium))
        
        ExchangeRateWidgetView(entry: ExchangeRateWidgetEntry(countries: Country.samples, widgetFamily: .systemLarge))
            .containerBackground(.white, for: .widget)
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
