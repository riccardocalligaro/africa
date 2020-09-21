//
//  VideoView.swift
//  Africa
//
//  Created by Riccardo on 21/09/2020.
//

import SwiftUI
import AVKit

struct VideoView: View {
    
    var name: String
    
    var body: some View {
        VideoPlayer(player: AVPlayer(
            url:  Bundle.main.url(forResource: name, withExtension: "mp4")!
        ))
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(name: "gorilla")
    }
}
