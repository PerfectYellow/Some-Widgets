//
//  HelloStaticWidgetView.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 17/01/2024.
//

import SwiftUI
import WidgetKit

struct HelloStaticWidgetView: View {
    var entry: HelloStaticWidgetEntry

    var body: some View {
        ZStack {
//            ContainerRelativeShape()
//                .inset(by: 5)
//                .fill(.pink)
//                .padding(9)
            
//            RoundedRectangle(cornerRadius: 12)
//                .fill(.red)
            
            let path = entry.imageUrl
            
            NetworkImageView(url: URL(string: path)!)
                .scaledToFill()
            
            VStack(spacing: 10) {
                Text("Hello")
                    .font(.title)
                    .foregroundStyle(.black.gradient)
                
                Text("Im Mohamad :)")
                    .font(.caption)
                    .bold()
                    .foregroundStyle(.yellow.gradient)
            }
            .containerBackground(.orange.gradient, for: .widget)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


struct HelloStaticWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        let entry = HelloStaticWidgetEntry(date: Date(), imageUrl: "https://source.unsplash.com/random/?flowers")
        HelloStaticWidgetView(entry: entry)
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        //            .containerBackground(.red.gradient, for: .widget)
    }
}

//#Preview {
//    HelloStaticWidgetView()
//        .previewContext(WidgetPreviewContext(family: .systemSmall))
//}
