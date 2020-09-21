//
//  MapViewViewModel.swift
//  Africa
//
//  Created by Riccardo on 21/09/2020.
//

import Foundation
import Combine
import MapKit

class MapViewViewModel: ObservableObject {
    
    private var locationsCancellable: AnyCancellable?
    
    @Published var locations: Locations?
    @Published var error: String?
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 5.6194, longitude:  20.9367), span: MKCoordinateSpan(latitudeDelta: 50, longitudeDelta: 50))
    
    
    
    func fetchLocations() {
        
        locationsCancellable = Locations
            .fetch()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {  completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.error = error.localizedDescription
                }
            }, receiveValue: { [weak self] locations in
                self?.locations = locations
            })
        
    }
    
    
}
