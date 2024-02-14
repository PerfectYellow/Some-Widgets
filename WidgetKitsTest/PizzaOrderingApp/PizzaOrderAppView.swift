///
//  PizzaOrderAppView.swift
//  WidgetKitsTest
//
//  Created by Mohammad Afshar on 13/02/2024.
//

import SwiftUI
import ActivityKit

struct PizzaOrderAppView: View {
    @State private var currentID: String = ""
    @State private var pizzaType: PizzaType = .cheese
    @State private var quantity: Int = 1
    @State private var activity: Activity<PizzaOrderingAttribute>?
    @State private var isOrdered: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Picker("Choose a Pizza Type", selection: $pizzaType) {
                        ForEach(PizzaType.allCases) { pizza in
                            Text(pizza.rawValue)
                                .tag(pizza)
                        }
                    }
                    
                    Stepper("Number of Pizza", value: $quantity, in: 1...20)
                    
                    Section {
                        Text("Ordred \(quantity) Large \(pizzaType.rawValue) Pizza(s)")
                        HStack {
                            Button("Order") {
                                orderPlace(orderString: "Ordered \(quantity) Large \(pizzaType.rawValue) Pizza(s)")
                            }
                        }
                    } header: {
                        Text("Summery")
                    }
                    
                    if !currentID.isEmpty {
                        Section {
                            Button("Update Order in Progress") {
                                updateOrder(with: .inProgress)
                            }
                            .frame(width: 400)
                            
                            Button("Update order in oven") {
                                updateOrder(with: .onOven)
                            }
                            .frame(width: 400)
                            
                            Button("Update Order in Progress") {
                                updateOrder(with: .inProgress)
                            }
                            .frame(width: 400)
                            
                            Button("Update Order on the Way") {
                                updateOrder(with: .onTheWay)
                            }
                            .frame(width: 400)
                            
                            Button("Complete Order") {
                                orderCompleted()
                            }
                            .frame(width: 400)
                        } header: {
                            Text("Admin Section")
                        }
                    } else {
                        
                    }
                }
            }
        }
    }
    
    private func getActivity(from id: String) -> Activity<PizzaOrderingAttribute>? {
        guard let activity = Activity.activities.first(where: { (activity: Activity<PizzaOrderingAttribute>) in
            activity.id == id
        }) else {
            return nil
        }
        
        return activity
    }
    
    private func updateOrder(with: OrderStatus) {
        guard let activity = getActivity(from: currentID) else { return }
        //        DispatchQueue.main.async {
        var updateState = activity.content.state
        updateState.orderStatus = with
        
        Task { [updateState] in
            await activity.update(using: updateState)
        }
        //        }
    }
    
    private func orderPlace(orderString: String) {
        let attributes = PizzaOrderingAttribute(orderNumber: quantity, orderedItem: orderString)
        let state = PizzaOrderingAttribute.ContentState(orderStatus: .recived)
        let content = ActivityContent(state: state, staleDate: nil)
        
        do {
            let activity = try Activity<PizzaOrderingAttribute>.request(
                attributes: attributes,
                content: content,
                pushType: nil
            )
            currentID = activity.id
        } catch {
            print(error)
        }
    }
    
    private func orderCompleted() {
        guard let activity = getActivity(from: currentID) else { return }
        
        Task {
            await activity.end(activity.content, dismissalPolicy: .immediate)
            currentID = ""
        }
    }
}
