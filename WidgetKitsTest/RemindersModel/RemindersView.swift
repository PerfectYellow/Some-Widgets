//
//  RemindersView.swift
//  WidgetKitsTest
//
//  Created by Mohammad Afshar on 25/01/2024.
//

import SwiftUI

struct RemindersView: View {
    @State var Reminders = [ReminderModel]()
    @State var newReminder = ""
    
    @AppStorage(RemindersAppConstants.storegKey, store: UserDefaults(suiteName: RemindersAppConstants.groupName))
    private var userDefault: Int = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                List(Reminders) { reminder in
                    VStack(alignment: .leading) {
                        Text(reminder.title)
                            .font(.title)
                        
                        Text("Due on: " + reminder.dueOn.formatted(date: .abbreviated, time: .omitted))
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
                
                Spacer()
                
                TextField("Reminder", text: $newReminder)
                    .onSubmit {
                        if !newReminder.isEmpty {
                            Reminders.append(.init(title: newReminder, dueOn: Date()))
                            newReminder = ""
                            
                            userDefault = Reminders.count
                            print(userDefault)
                            RemindersAppConstants.refreshReminder()
                        }
                    }
                    .textFieldStyle(.roundedBorder)
                    .padding()
            }
        }
        .navigationTitle("Reminders")
    }
}

#Preview {
    RemindersView()
}
