//
//  MapView.swift
//  Africa
//
//  Created by Riccardo on 20/09/2020.
//

import SwiftUI
import MapKit
struct MapView: View {
    
    
    @StateObject private var viewModel: MapViewViewModel
    
    init() {
        _viewModel = StateObject(wrappedValue: MapViewViewModel())
    }
    
    
    
    var body: some View {
        
        NavigationView {
            if viewModel.locations != nil {
                MapViewMap(locations: viewModel.locations!, region: viewModel.region)
                    .edgesIgnoringSafeArea(.all)
//                Map(coordinateRegion: $viewModel.region,
//                    annotationItems: viewModel.locations!) { place in
////                    MapMarker(coordinate: place.getCoordinates(), tint: .green)
//                }.edgesIgnoringSafeArea(.all)
                
            } else {
                ProgressView()
                    .onAppear { viewModel.fetchLocations() }
                
            }
        }
        //
        //        if viewModel.locations != nil {
        //            Map(coordinateRegion: $viewModel.region,
        //                annotationItems: viewModel.locations!) { place in
        //                MapMarker(coordinate: place.getCoordinates(), tint: .green)
        //                 }.edgesIgnoringSafeArea(.all)
        //
        //        } else {
        //            Button(action: {
        //                viewModel.fetchLocations()
        //            }) {
        //                Text("fetch")
        //            }
        ////            ProgressView()
        ////                .onAppear { viewModel.fetchLocations() }
        //
        //        }
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
