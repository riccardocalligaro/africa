//
//  Video.swift
//  Africa
//
//  Created by Riccardo on 21/09/2020.
//

import Foundation
import Combine

//"id" : "cheetah",
//"name" : "Cheetah",
//"headline" : "Cheetah walking in the savannah"

typealias Videos = [Video]

struct Video: Codable, Identifiable {
    let id, name, headline: String
}

extension Videos {
    static func fetch() -> AnyPublisher<Videos, Error> {
        return AfricaAPI
            .shared
            .request(endpoint: .videos)
            .subscribe(on: DispatchQueue.global())
            .eraseToAnyPublisher()
    }
}

extension Video {
    static func getMock() -> Video {
        return Video(id: "cheetah", name: "Cheetah", headline: "Cheetah walking in the savannah")
    }
}


