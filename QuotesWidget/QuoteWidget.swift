//
//  QuoteWidget.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 20/01/2024.
//

import SwiftUI
import WidgetKit

struct QuoteWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: "QuoteWidget", provider: QuoteTimelineProvider()) { entry in
            QuoteView(entry: entry)
                .containerBackground(.orange.gradient.opacity(0.5), for: .widget)
        }
        .supportedFamilies([.systemMedium])
        .configurationDisplayName("Quote")
        .description("widget to display famous quotes")
    }
}

#Preview("Quote", as: .systemMedium) {
    QuoteWidget()
} timeline: {
    let placeholderQuote = QuoteModel(quoteText: "See the positive side, the potential, and make an effort.", quoteAuthor: "Dalai Lama")
    
    QuotesTimelineEntry(date: Date(), quote: placeholderQuote)
}
