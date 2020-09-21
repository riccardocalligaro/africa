//
//  BrowseView.swift
//  Africa
//
//  Created by Riccardo on 20/09/2020.
//

import SwiftUI

struct BrowseView: View {
    
    @StateObject private var viewModel: BrosweViewViewModel = BrosweViewViewModel()
    @State var index = 0

    
    var body: some View {
        
        NavigationView {
            if viewModel.animals != nil && viewModel.covers != nil {
                
                List {
                    
                    // image carousel for the covers
                    PagingView(index: $index.animation(), maxIndex: viewModel.covers!.count - 1) {
                        ForEach(viewModel.covers!) { cover in
                            Image(cover.name)
                                .resizable()
                                .scaledToFill()
                        }
                    }
                    .aspectRatio(4/3, contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding(.bottom)
                
                    // animals list
                    ForEach(viewModel.animals!) { animal in
                        NavigationLink(destination: AnimalView(animal: animal)) {
                            HStack {
                                Image(animal.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height:100)
                                    .cornerRadius(8)
                                
                                VStack(alignment: .leading) {
                                    Text(animal.name)
                                        .foregroundColor(.accentColor)
                                        .font(.title3)
                                        .fontWeight(.bold)
                                    
                                    Text(animal.headline)
                                        .foregroundColor(.white)
                                        .lineLimit(3)
   
                                    Spacer()
                                }
                                .padding(.leading)
                            }
                        }
                    }
                    
                }
                .padding()
                .navigationBarTitle("Broswe")
            } else {
                ProgressView()
            }
        }
        // fetch the animals from the view model
        .onAppear { viewModel.fetchAnimals() }
        
        
        
        
        
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView()
    }
}
