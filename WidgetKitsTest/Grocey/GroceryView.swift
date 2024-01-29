//
//  GroceryView.swift
//  WidgetKitsTest
//
//  Created by Mohammad Afshar on 27/01/2024.
//

import SwiftUI
import CoreData
import OSLog

struct GroceryView: View {
    @Environment(\.managedObjectContext) 
    private var context
    
    @FetchRequest(entity: Item.entity(), sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)])
    private var items: FetchedResults<Item>
    
    @State private var newItem = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                List(items, id: \.id) { item in
                    HStack {
                        Color(hex: item.color ?? "#FF5732")
                            .frame(width: 5, height: 20)
                        
                        Text(item.name ?? "?...")
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                
                Spacer()
                
                TextField("Add new item...", text: $newItem)
                    .textFieldStyle(.roundedBorder)
                    .onSubmit {
                        saveNewItem()
                    }
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Delete All") {
                        deleteAllItems()
                    }
                }
            }
        }
    }
    
    private func saveNewItem() {
        if !newItem.isEmpty {
            let item = Item(context: context)
            item.name = newItem
            item.color = Color.randomHexColorCode
            item.id = UUID()
            
            CoreDataManager.shared.saveWorkingContext(context: context)
            GroceryConstants.reloadGroceryTimeline()
            
            newItem = ""
        }
    }
    
    private func deleteAllItems() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try CoreDataManager.shared.managetObjectContext.executeAndMergeChanges(deleteRequest)
            GroceryConstants.reloadGroceryTimeline()
        } catch {
            Logger.grocery.error("Error in handeling Batch Delete Request: \(error.localizedDescription)")
        }
    }
}

#Preview {
    GroceryView()
}
