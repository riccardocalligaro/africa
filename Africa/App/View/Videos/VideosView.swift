//
//  VideosView.swift
//  Africa
//
//  Created by Riccardo on 21/09/2020.
//

import SwiftUI
import AVKit

struct VideosView: View {
    
    @StateObject private var viewModel = VideosViewViewModel()
    
    var body: some View {
        NavigationView {
            
            if viewModel.videos != nil {
                List {  
                    ForEach(viewModel.videos!) { video in
                        
                        NavigationLink(destination: VideoView(name: video.id)) {
                            HStack {
                                
                                ZStack {
                                    Image("video-\(video.id)")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 100, height:100)
                                        .cornerRadius(8)
                                    
                                    Image(systemName: "play.circle")
                                        .font(.system(size: 45))
                                }

                                VStack(alignment: .leading) {
                                    Text(video.name)
                                        .foregroundColor(.accentColor)
                                        .font(.title3)
                                        .fontWeight(.bold)
                                    
                                    Text(video.headline)
                                        .foregroundColor(.white)
                                        .lineLimit(3)
   
                                    Spacer()
                                }
                                .padding(.leading)
                            }
                        }
                    }
                }
                .navigationTitle("Videos")
            } else {
                ProgressView()
            }
            
        }
        .onAppear { viewModel.fetchVideos() }
    }
}

struct VideosView_Previews: PreviewProvider {
    static var previews: some View {
        VideosView()
    }
}
