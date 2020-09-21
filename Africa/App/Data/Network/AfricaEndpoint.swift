//
//  AfricaEndpoint.swift
//  Africa
//
//  Created by Riccardo on 20/09/2020.
//

import Foundation

enum AfricaEndpoint {
    case animals
    case videos
    case covers
    case locations
    
    func path() -> String {
        switch self {
        case .animals:
            return "6acb07835e3f0eb72d53db0a9161da37/raw/6d509da4ce7565990b89aaeb7be728ea6991e78c/animals.json"
        case .covers:
            return "12a6d2df0e2fdafc7700fa1aff263fbb/raw/bffaf9eed990ab82a6471564c9ace1642b068abc/covers.json"
        case .videos:
            return "80e4cdc31a92cb84f373ded57397ba98/raw/3931ec906729d4ec980a4bbd3ac5cef2b1063304/videos.json"
        case .locations:
            return "0fa1855e06dae46e74b56623bff32ac4/raw/4cd9558b68f8b8009309975f24909212af944630/locations.json"
        }
    }
    
}
