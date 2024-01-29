//
//  GroceryTimeline.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 28/01/2024.
//

import WidgetKit
import OSLog
import CoreData

struct GroceryTimeline: TimelineProvider {
    typealias Entry = GroceyEntry
    
    func placeholder(in context: Context) -> GroceyEntry {
        GroceyEntry()
    }
    
    func getSnapshot(in context: Context, completion: @escaping (GroceyEntry) -> Void) {
        completion(GroceyEntry())
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<GroceyEntry>) -> Void) {
        let fetchRequest = Item.fetchRequest()
        fetchRequest.fetchOffset = 0
        
        switch context.family {
            case .systemSmall:
                fetchRequest.fetchLimit = 3
                
            case .systemMedium:
                fetchRequest.fetchLimit = 4
                
            case .systemLarge:
                fetchRequest.fetchLimit = 9
                
            default:
                fetchRequest.fetchLimit = 1
        }
        
        do {
            let items = try CoreDataManager.shared.managetObjectContext.fetch(fetchRequest)
            let timeline = Timeline(entries: [GroceyEntry(items: items)], policy: .never)
            completion(timeline)
        } catch {
            Logger.grocery.error("Grocery TimelineProvide Error Fetching Data: \(error.localizedDescription)")
        }
    }
}
