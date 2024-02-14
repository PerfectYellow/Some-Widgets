//
//  PizzaOrderingAttribute.swift
//  WidgetKitsTest
//
//  Created by Mohammad Afshar on 13/02/2024.
//

import ActivityKit
import Foundation

enum OrderStatus: String, Codable & CaseIterable & Equatable {
    case recived = "takeoutbag.and.cup.and.straw.fill"
    case inProgress = "hourglass"
    case onOven = "flame.fill"
    case onTheWay = "car.fill"
}

struct PizzaOrderingAttribute: ActivityAttributes {    
    struct ContentState: Codable & Hashable {
        var orderStatus: OrderStatus = .recived
    }
    
    var orderNumber: Int
    var orderedItem: String
}
