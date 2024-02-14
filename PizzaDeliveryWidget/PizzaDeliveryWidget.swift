//
//  PizzaDeliveryWidget.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 14/02/2024.
//

import WidgetKit
import SwiftUI

struct PizzaDeliveryWidget: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(
            for: PizzaOrderingAttribute.self) { activityContext in
                ZStack {
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .fill(.orange.gradient)
                    
                    VStack {
                        HStack {
                            Text("Pizza Ordering")
                                .foregroundStyle(.white.opacity(0.6))
                            
                            Spacer()
                            
                            Text("\(activityContext.attributes.orderedItem) Status")
                                .foregroundStyle(.white.opacity(0.8))
                        }
                        
                        HStack(alignment: .bottom, spacing: 0) {
                            Image(systemName: activityContext.state.orderStatus.rawValue)
                                .font(.largeTitle)
                            
                            Text(orderStatusMessage(status: activityContext.state.orderStatus))
                        }
                        .foregroundStyle(.white)
                    }
                    .padding()
                }
            } dynamicIsland: { activityContext in
                DynamicIsland {
                    DynamicIslandExpandedRegion(.leading) {
                        Image("Logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(.circle)
                    }
                    DynamicIslandExpandedRegion(.trailing) {
                        Text("\(activityContext.attributes.orderNumber)")
                            .font(.largeTitle)
                            .foregroundStyle(.orange.gradient)
                            .padding(.trailing, 10)
                    }
                    DynamicIslandExpandedRegion(.center) {
                        Text("\(activityContext.attributes.orderedItem)")
                    }
                    DynamicIslandExpandedRegion(.bottom) {
                        HStack(alignment: .bottom, spacing: 0) {
                            Image(systemName: activityContext.state.orderStatus.rawValue)
                                .font(.title)
                            
                            Text(orderStatusMessage(status: activityContext.state.orderStatus))
                                .font(.title3)
                        }
                    }
                } compactLeading: {
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(.circle)
                } compactTrailing: {
                    Image(systemName: activityContext.state.orderStatus.rawValue)
                } minimal: {
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(.circle)
                }

            }

    }
    
    private func orderStatusMessage(status: OrderStatus) -> String {
        switch status {
            case .recived:
                return "Got the Order"
            case .inProgress:
                return "We are working on it."
            case .onOven:
                return "Pizza is basking in oven!"
            case .onTheWay:
                return "It's ready and on the way!!!"
        }
    }
}
