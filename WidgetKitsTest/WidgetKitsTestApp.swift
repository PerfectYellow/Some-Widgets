//
//  WidgetKitsTestApp.swift
//  WidgetKitsTest
//
//  Created by Mohammad Afshar on 17/01/2024.
//

import SwiftUI

@main
struct WidgetKitsTestApp: App {
    let context = CoreDataManager.shared.managetObjectContext
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, context)
        }
    }
}
