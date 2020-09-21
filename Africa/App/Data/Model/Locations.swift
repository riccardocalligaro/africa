//
//  Coordinates.swift
//  Africa
//
//  Created by Riccardo on 21/09/2020.
//

import Foundation
import MapKit
import Combine

//"id" : "serengeti",
//"name" : "Serengeti National Park",
//"image" : "map-serengeti",
//"latitude" : -2.3333333,
//"longitude" : 34.8333333

typealias Locations = [Location]

struct Location: Codable, Identifiable {
    let id, name, image: String
    let latitude, longitude: Double
}


extension Locations {
    static func fetch() -> AnyPublisher<Locations, Error> {
        return AfricaAPI
            .shared
            .request(endpoint: .locations)
            .subscribe(on: DispatchQueue.global())
            .eraseToAnyPublisher()
    }
}


extension Location {
    static func getMock() -> Location {
        return Location(id: "serengeti", name: "Serengeti National Park", image: "map-serengeti", latitude: -2.3333333, longitude:  34.8333333)
    }
    
    func getCoordinates() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
    }
}
