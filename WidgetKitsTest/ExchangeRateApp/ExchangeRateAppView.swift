//
//  ExchangeRateApp.swift
//  WidgetKitsTest
//
//  Created by Mohammad Afshar on 03/02/2024.
//

import SwiftUI

struct ExchangeRateAppView: View {
    @State var selectedCountry: Country?
    
    var body: some View {
        NavigationStack {
            VStack {
                List(Country.samples) { country in
                    CountryListCell(country: country)
                        .onTapGesture {
                            selectedCountry = country
                        }
                        .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
            }
            .sheet(item: $selectedCountry) { country in
                CountryExchangeRateView(country: country)
            }
            .onOpenURL { url in
                guard url.scheme == "exchangeWidget", url.host(percentEncoded: true) == "country" else {
                    return
                }
                selectedCountry = Country.samples.first {
                    $0.currencyCode == url.pathComponents[1]
                }
            }
            .navigationTitle("Exchange")
        }
    }
}

#Preview {
    ExchangeRateAppView()
}
