//
//  CountryListCell.swift
//  WidgetKitsTest
//
//  Created by Mohammad Afshar on 02/02/2024.
//

import SwiftUI

struct CountryListCell: View {
    let country: Country
    
    var body: some View {
        HStack {
            Text(country.flag)
                .font(.title)
                .shadow(radius: 2)
                .padding(.horizontal, 5)
                .background(Color.indigo.gradient.opacity(0.2), in: RoundedRectangle(cornerRadius: 5.0))
            
            Text(country.name)
            
            Spacer()
            
            Text(country.currencyCode)
        }
        .padding()
        .clipShape(Rectangle())
    }
}

#Preview {
    CountryListCell(country: Country.USA)
}
