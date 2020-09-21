//
//  MapViewMap.swift
//  Africa
//
//  Created by Riccardo on 21/09/2020.
//

import Foundation
import UIKit
import MapKit
import SwiftUI



struct MapViewMap: UIViewRepresentable {
    
    var locations: Locations
    var region: MKCoordinateRegion
    
    func makeUIView(context: UIViewRepresentableContext<MapViewMap>) -> MKMapView {
        let mapView = MKMapView()
        
        mapView.setRegion(region, animated: false)
        
        locations.forEach { location in
            let annotation = MKPointAnnotation()
            
            annotation.coordinate = location.getCoordinates()
            annotation.title = location.name
            
            mapView.addAnnotation(annotation)
        }
        
        return mapView
    }

    func updateUIView(_ view: MKMapView, context: UIViewRepresentableContext<MapViewMap>) {
    }
    
    
    
    
    
}

