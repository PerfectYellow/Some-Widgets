//
//  FamousPlaceTimelineProvider.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 11/02/2024.
//

import WidgetKit
import MapKit
import SwiftUI

struct FamousPlaceTimelineProvider: TimelineProvider {
    typealias Entry = FamousPlaceTimelineEntry
    @Environment(\.colorScheme) var colorSchema
    
    func placeholder(in context: Context) -> FamousPlaceTimelineEntry {
        FamousPlaceTimelineEntry(place: FamousPlace.sample[0])
    }
    
    func getSnapshot(in context: Context, completion: @escaping (FamousPlaceTimelineEntry) -> Void) {
        completion(FamousPlaceTimelineEntry(place: FamousPlace.sample[1]))
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<FamousPlaceTimelineEntry>) -> Void) {
        var randomPlace = FamousPlace.sample.randomElement() ?? .sample[0]
        let region = MKCoordinateRegion(center: randomPlace.location, latitudinalMeters: 5000, longitudinalMeters: 5000)
        let mapSnapshot = makeSnapshotter(for: region, size: context.displaySize)
        
        mapSnapshot.start { snapshot, error in
            guard let snapshot, error == nil else {
                return
            }
            
            let reloadTimeline = Calendar.current.date(byAdding: .minute, value: 1, to: Date())!
            randomPlace.image = Image(uiImage: snapshot.image)
            let entry = FamousPlaceTimelineEntry(place: randomPlace)
            let timeline = Timeline(entries: [entry], policy: .after(reloadTimeline))
            completion(timeline)
        }
        
    }
    
    private func makeSnapshotter(for region: MKCoordinateRegion, size: CGSize) -> MKMapSnapshotter {
        let options = MKMapSnapshotter.Options()
        options.size = size
        options.region = region
        
        let trait = UITraitCollection()
        let customTrait = trait.modifyingTraits { mutableTraits in
            mutableTraits.userInterfaceStyle = UIUserInterfaceStyle(colorSchema)
//            mutableTraits.userInterfaceStyle = UIUserInterfaceStyle(UIScreen.main.traitCollection.userInterfaceStyle)
        }
        
        options.traitCollection = customTrait
        
        return MKMapSnapshotter(options: options)
//        options.traitCollection = UITraitCollection(traitsFrom: [options.traitCollection, UITraitCollection(userInterfaceStyle: .dark)])
        
        /*
        let trait = UITraitCollection(mutations: { mutableTraits in
            <#code#>
        })
        trait.modifyingTraits { mutableTraits in
            mutableTraits.userInterfaceStyle = .dark
        }
         */
    }
}
