//
//  QuoteTimelineProvider.swift
//  WidgetKitsTest
//
//  Created by Mohammad Afshar on 19/01/2024.
//

import Foundation
import WidgetKit

class QuoteTimelineProvider: TimelineProvider {
    typealias Entry = QuotesTimelineEntry
    
    let placeholderQuote = QuoteModel(quoteText: "See the positive side, the potential, and make an effort.",
                           quoteAuthor: "Dalai Lama")
    
    func placeholder(in context: Context) -> QuotesTimelineEntry {
        QuotesTimelineEntry(date: Date(), quote: placeholderQuote)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (QuotesTimelineEntry) -> Void) {
        completion(
            QuotesTimelineEntry(date: Date(), quote: placeholderQuote)
        )
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<QuotesTimelineEntry>) -> Void) {
        Task {
            do {
                let quote = try await QuoteServices().getQuote()
                let entry = QuotesTimelineEntry(date: Date(), quote: quote)
                let refreshDate = Calendar.current.date(byAdding: .second, value: 10, to: Date())!
                completion(
                    Timeline(entries: [entry], policy: .after(refreshDate))
                )
            } catch {
                print(error)
            }
        }
    }
}
