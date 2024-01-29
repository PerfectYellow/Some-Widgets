//
//  RemindersWidgetView.swift
//  WidgetKitsTest
//
//  Created by Mohammad Afshar on 25/01/2024.
//

import SwiftUI
import WidgetKit

struct RemindersWidgetView: View {
    let remindersCount: Int
    
    var body: some View {
        Text(remindersCount.formatted(.number))
            .font(.largeTitle.bold())
            .foregroundStyle(.white)
        
        Text("Reminder\(remindersCount > 1 ? "s" : "")")
    }
}


struct Preview_Reminders: PreviewProvider {
    static var previews: some View {
        RemindersWidgetView(remindersCount: 5)
            .previewContext(WidgetPreviewContext(family: .systemSmall))
            .containerBackground(.purple.gradient, for: .widget)
    }
}
