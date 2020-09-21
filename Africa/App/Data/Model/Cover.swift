//
//  Cover.swift
//  Africa
//
//  Created by Riccardo on 21/09/2020.
//

import Foundation
import Combine

typealias Covers = [Cover]

struct Cover: Codable, Identifiable {
    let id: Int
    let name: String
}

extension Cover {
    static func getMock() -> Cover {
        return Cover(id: 1, name: "cover-lion")
    }
}

extension Covers {
    static func fetch() -> AnyPublisher<Covers, Error> {
        return AfricaAPI
            .shared
            .request(endpoint: .covers)
            .subscribe(on: DispatchQueue.global())
            .eraseToAnyPublisher()
    }
}
