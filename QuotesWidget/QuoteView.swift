//
//  QuoteView.swift
//  WidgetKitsTest
//
//  Created by Mohammad Afshar on 19/01/2024.
//

import SwiftUI
import WidgetKit

struct QuoteView: View {
    var entry: QuotesTimelineEntry
    
    var body: some View {
        VStack(alignment: .center) {
            Text(entry.quote.quoteText)
                .minimumScaleFactor(7.0)
                .padding(.bottom, 15)
                .font(.subheadline)
            
            Text("-  " + entry.quote.quoteAuthor)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .italic()
                .font(.footnote)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct QuoteView_Preview: PreviewProvider {
    
    static var previews: some View {
        let placeholderQuote = QuotesTimelineEntry(date: Date(), quote: QuoteModel(quoteText: "See the positive side, the potential, and make an effort.", quoteAuthor: "Dalai Lama"))
        
        QuoteView(entry: placeholderQuote)
            .previewContext(WidgetPreviewContext(family: .systemMedium))
            .containerBackground(.orange.gradient.opacity(0.5), for: .widget)
    }
}
