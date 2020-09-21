//
//  AfricaAPI.swift
//  Africa
//
//  Created by Riccardo on 20/09/2020.
//

import Foundation
import Combine

class AfricaAPI {
    static let shared = AfricaAPI()
    
    static private let BASE_URL = "https://gist.githubusercontent.com/riccardocalligaro"
    
    private var session: URLSession
    private let decoder: JSONDecoder
    
    init() {
        decoder = JSONDecoder()
        
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        session = URLSession(configuration: AfricaAPI.makeSessionConfiguration())
    }
    
    static private func makeSessionConfiguration() -> URLSessionConfiguration {
        let configuration = URLSessionConfiguration.default
        
        // additional configuration goes here
        configuration.requestCachePolicy = .reloadRevalidatingCacheData
        
        return configuration
    }
    
    static private func makeURL(endpoint: AfricaEndpoint) -> URL {
        return URL(string: "\(self.BASE_URL)/\(endpoint.path())")!
    }
    
    func request<T: Decodable>(
        endpoint: AfricaEndpoint
    ) -> AnyPublisher<T, Error> {
        let url = Self.makeURL(endpoint: endpoint)
        
        let request = URLRequest(url: url)
        
        return session.dataTaskPublisher(for: request)
            .tryMap() {
                    guard $0.data.count > 0 else { throw URLError(.zeroByteResource) }
                    return $0.data
            }
            .decode(type: T.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
    
    
}
