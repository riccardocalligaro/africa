//
//  AfricaApp.swift
//  Africa
//
//  Created by Riccardo on 20/09/2020.
//

import SwiftUI

@main
struct AfricaApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                
                BrowseView()
                    .tabItem {
                        Image(systemName: "square.grid.2x2")
                        Text("Browse")
                    }
                
                VideosView()
                    .tabItem {
                        Image(systemName: "play.rectangle")
                        Text("Watch")
                    }
                
                MapView()
                    .tabItem {
                        Image(systemName: "map")
                        Text("Locations")
                    }
                
                GalleryView()
                    .tabItem {
                        Image(systemName: "photo")
                        Text("Gallery")
                    }
            
            }
        }
    }
}
