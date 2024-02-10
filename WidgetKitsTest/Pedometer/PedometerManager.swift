//
//  PedometerManager.swift
//  WidgetKitsTest
//
//  Created by Mohammad Afshar on 10/02/2024.
//

import CoreMotion
import Observation

@Observable
final class PedometerManager {
    
    init() {
        getData()
    }
    
    func reloadData() {
        getData()
    }
    
//    @ObservationIgnored
//    @Published 
    var pedometer: PedometerModel = PedometerModel(step: 0)
    
    private let cmPedometer: CMPedometer = CMPedometer()
    
    private var isPedometerAvailable: Bool {
        CMPedometer.isPedometerEventTrackingAvailable() &&
        CMPedometer.isDistanceAvailable() &&
        CMPedometer.isStepCountingAvailable()
    }
    
    func getData() {
        if isPedometerAvailable {
            guard let startDate = Calendar.current.date(byAdding: .hour, value: -24, to: Date()) else {
                return
            }
            cmPedometer.queryPedometerData(from: startDate, to: Date()) { [weak self] data, error in
                guard let self = self, let data, error == nil else { 
                    return
                }
                DispatchQueue.main.async {
                    self.pedometer.step = data.numberOfSteps.intValue
                }
            }
        }
    }
}
