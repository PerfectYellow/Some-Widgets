//
//  PedometerView.swift
//  WidgetKitsTest
//
//  Created by Mohammad Afshar on 10/02/2024.
//

import SwiftUI

struct PedometerView: View {
    @AppStorage(PedometerConstant.stepsStorekey, store: UserDefaults(suiteName: PedometerConstant.appGroupName))
    private var stepsStorage: Int = 0
    
    @State private var manager: PedometerManager = PedometerManager()
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(.orange.gradient)
                .frame(width: 300, height: 300)
            
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.gray.gradient.opacity(0.5))
                .frame(width: 250, height: 100)
            
            withObservationTracking {
                Text("\(manager.pedometer.step) steps")
            } onChange: {
                stepsStorage = manager.pedometer.step
                PedometerConstant.reloadPedometerTimeline()
            }
        }
        .onAppear {
            manager.getData()
        }
        //        .onReceive(manager.objectWillChange) { _ in
        //            stepsStorage = manager.pedometer.step
        //            PedometerConstant.reloadPedometerTimeline()
        //        }
    }
}

//#Preview {
//    PedometerView()
//}
