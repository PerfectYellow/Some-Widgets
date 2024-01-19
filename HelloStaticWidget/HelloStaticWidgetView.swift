//
//  HelloStaticWidgetView.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 17/01/2024.
//

import SwiftUI
import WidgetKit

struct HelloStaticWidgetView: View {
    var body: some View {
        ZStack {
//            ContainerRelativeShape()
//                .inset(by: 5)
//                .fill(.pink)
//                .padding(9)
            RoundedRectangle(cornerRadius: 12)
                .fill(.red)
            
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
    }
}


struct HelloStaticWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        HelloStaticWidgetView()
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        //            .containerBackground(.red.gradient, for: .widget)
    }
}

//#Preview {
//    HelloStaticWidgetView()
//        .previewContext(WidgetPreviewContext(family: .systemSmall))
//}
