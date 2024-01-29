//
//  CoreDataManager.swift
//  WidgetKitsTest
//
//  Created by Mohammad Afshar on 28/01/2024.
//

import Foundation
import CoreData
import OSLog

final class CoreDataManager {
    static let shared = CoreDataManager()
    
    private init() {}
    
    private var persistentContainer: NSPersistentContainer {
        let storeUrl = GroceryConstants.appGroupContainerUrl?.appending(path: "GroceyDataModel.sqlite", directoryHint: .notDirectory)
        let container = NSPersistentContainer(name: "GroceyDataModel")
        guard let storeUrl else { fatalError("Cannot") }
        container.persistentStoreDescriptions = [NSPersistentStoreDescription(url: storeUrl)]
        
        Logger.grocery.info("Default Persistent Store Descriptions: \(NSPersistentContainer.defaultDirectoryURL(), align: .left(columns: 10))")
        Logger.grocery.info("Custom Persistent Store Descriptions: \(container.persistentStoreDescriptions)")
        
        container.loadPersistentStores { storeDescription, error in
            if let error = error as? NSError {
                Logger.grocery.error("Error in Loading DataBase - \(error.localizedDescription, privacy: .public)")
            }
        }
        
        Logger.grocery.info("Database Loaded Successfully")
        
        return container
    }
    
    var managetObjectContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    var managetObjectContextForSave: NSManagedObjectContext {
        let context = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        context.parent = managetObjectContext
        return context
    }
    
    func saveContext() {
        managetObjectContext.performAndWait {
            if managetObjectContext.hasChanges {
                do {
                    try managetObjectContext.save()
                    Logger.grocery.info("Save Successfully")
                } catch {
                    Logger.grocery.error("Error in save Context: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func saveWorkingContext(context: NSManagedObjectContext) {
        do {
            try context.save()
            saveContext()
        } catch {
            Logger.grocery.error("Error in save working directory \(error.localizedDescription, privacy: .public)")
        }
    }
}


extension NSManagedObjectContext {
    public func executeAndMergeChanges(_ batchDeleteRequest: NSBatchDeleteRequest) throws {
        batchDeleteRequest.resultType = .resultTypeObjectIDs
        let resault = try execute(batchDeleteRequest) as? NSBatchDeleteResult
        let changes: [AnyHashable : Any] = [NSDeletedObjectsKey : resault?.result as? [NSManagedObjectID] ?? []]
        
        NSManagedObjectContext.mergeChanges(fromRemoteContextSave: changes, into: [self])
    }
}
