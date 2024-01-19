//
//  SimpleStaticWidgetBundle.swift
//  SimpleStaticWidget
//
//  Created by Mohammad Afshar on 17/01/2024.
//

import WidgetKit
import SwiftUI

@main
struct SimpleStaticWidgetBundle: WidgetBundle {
    var body: some Widget {
//        SimpleStaticWidget()
        HelloStaticWidgetWidget()
        
        TodayInfoWidget()
    }
}
