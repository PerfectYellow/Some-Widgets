//
//  CountryExchangeRateView.swift
//  WidgetKitsTest
//
//  Created by Mohammad Afshar on 02/02/2024.
//

import SwiftUI

struct CountryExchangeRateView: View {
    var country: Country
    @State var currentPrice: Double = 0.0
    
    var body: some View {
        VStack {
            Text("\(country.flag) \(country.name)")
                .font(.title.bold())
            
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text(Country.USA.flag)
                            .font(.title)
                        Text(Country.USA.currencyCode)
                    }
                    
                    Text(1.0.formatted(.currency(code: Country.USA.currencyCode)))
                }
                
                Spacer()
                
                Image(systemName: "arrow.left.arrow.right")
                
                Spacer()
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(country.flag)
                            .font(.title)
                        Text(country.currencyCode)
                    }
                    
                    Text(currentPrice.formatted(.currency(code: country.currencyCode)))
                }
            }
        }
        .padding()
        .task {
            do {
                let exchangeRate = try await ExchangeRateServices().getCurrentRate(from: Country.USA.currencyCode, to: country.currencyCode, amount: 1)
                currentPrice = exchangeRate.resault
            } catch let DecodingError.typeMismatch(errorType, errorContext) {
                print("Decode ERROR: \(errorType) \n \(errorContext)")
            } catch let DecodingError.keyNotFound(key, context) {
                print("Key ERROR: \(key) \n \(context)")
            } catch {
                print("Generic Error: \(error)")
            }
        }
    }
}

#Preview {
    CountryExchangeRateView(country: Country.samples[2], currentPrice: 10.0)
}
