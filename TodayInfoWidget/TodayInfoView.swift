//
//  TodayInfoView.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 17/01/2024.
//

import SwiftUI
import WidgetKit

struct TodayInfoView: View {
    let entryDate: TodayInfoTimeLineEntry
    
    var body: some View {
        VStack(spacing: 14) {
            Text(entryDate.date, format: .dateTime.month(.wide))
                .font(.title)
                .foregroundStyle(.white)
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
                .background(Color.pink.gradient)
            
            Text(entryDate.date, format: .dateTime.day())
                .font(.largeTitle)
            
            Text(entryDate.date, style: .time)
                .font(.title3)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white.gradient.opacity(0.5), in: ContainerRelativeShape())
        .shadow(radius: 10)
    }
}


struct TodayInfoView_Preview: PreviewProvider {
    static var previews: some View {
        TodayInfoView(entryDate: TodayInfoTimeLineEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
            .containerBackground(for: .widget) {
                VStack(spacing: 0) {
                    Color.yellow
                    Color.blue
                    Color.green
                }
            }
    }
}

//#Preview("test", as: .systemSmall) {
//    TodayInfoView(entryDate: TodayInfoTimeLineEntry(date: Date()))
//        .previewContext(WidgetPreviewContext(family: .systemSmall))
//} timeline: {
//    TodayInfoTimeLineEntry(date: Date())
//}
