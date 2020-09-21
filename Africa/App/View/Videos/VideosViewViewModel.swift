//
//  VideosViewViewModel.swift
//  Africa
//
//  Created by Riccardo on 21/09/2020.
//

import Foundation
import Combine


class VideosViewViewModel: ObservableObject {
    
    private var videosCancellable: AnyCancellable?

    @Published var videos: Videos?
    @Published var error: String?

   
    
    func fetchVideos() {
        
        videosCancellable = Videos
            .fetch()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {  completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.error = error.localizedDescription
                }
            }, receiveValue: { [weak self] videos in
                self?.videos = videos
            })
    
    }
    
    
}

