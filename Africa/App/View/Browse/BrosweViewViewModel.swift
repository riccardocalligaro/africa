//
//  BrosweViewViewModel.swift
//  Africa
//
//  Created by Riccardo on 20/09/2020.
//

import Foundation
import Combine

class BrosweViewViewModel: ObservableObject {
    
    private var animalsCancellable: AnyCancellable?
    private var coversCancellable: AnyCancellable?

    @Published var covers: Covers?
    @Published var animals: Animals?
    @Published var error: String?
    
    
    func fetchAnimals() {
        
        coversCancellable = Covers
            .fetch()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {  completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.error = error.localizedDescription
                }
            }, receiveValue: { [weak self] covers in
                self?.covers = covers
            })
        
        animalsCancellable = Animals
            .fetch()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {  completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.error = error.localizedDescription
                }
            }, receiveValue: { [weak self] animals in
                self?.animals = animals
            })
        
    }
    
    
}
