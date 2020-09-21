//
//  AnimalView.swift
//  Africa
//
//  Created by Riccardo on 20/09/2020.
//

import SwiftUI
import MapKit

struct AnimalView: View {
    
    private var animal: Animal
    
    @State var redrawPreview = false
    @State var index = 0
    
    
    init(animal: Animal) {
        self.animal = animal
    }
    
    var body: some View {
        ScrollView {
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(.all)
            
            
            VStack {
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding(.bottom, 4)
                
                Text(animal.headline)
                    
                    .foregroundColor(.accentColor)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
                    .fixedSize(horizontal: false, vertical: true)
                
                
                HStack {
                    Image(systemName: "photo.on.rectangle")
                        .foregroundColor(.accentColor)
                    
                    Text("Wilderness in pictures")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                }
                
                
                
            }
            .padding()
            
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 32) {
                    ForEach(animal.gallery, id: \.self) { photo in
                        Image(photo)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height:200)
                            .cornerRadius(8)
                        
                        
                    }
                }
            }
            .frame(height: 200)
            .padding(.leading)
            
            HStack {
                Image(systemName: "questionmark.circle")
                    .foregroundColor(.accentColor)
                
                Text("Did you know?")
                    .font(.title3)
                    .fontWeight(.bold)
                
            }
            .padding()
            
            PagingView(index: $index.animation(), maxIndex: animal.fact.count - 1) {
                ForEach(animal.fact, id: \.self) { fact in
                        Text(fact)
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                }
            }
            .padding()
            .frame(height: 200)
            .background(Color(.systemGray5))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding([.horizontal, .bottom])
            
            
            HStack {
                Image(systemName: "info.circle")
                    .foregroundColor(.accentColor)
                
                Text("All about \(animal.name.lowercased())")
                    .font(.title3)
                    .fontWeight(.bold)
                
            }
            .padding()
            
            Text(animal.animalDescription)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.horizontal)
            
            
            HStack {
                Image(systemName: "book")
                    .foregroundColor(.accentColor)
                
                Text("Learn more")
                    .font(.title3)
                    .fontWeight(.bold)
                
            }
            .padding()
            
            RichLink(url: URL(string: animal.link)!, redraw: self.$redrawPreview)
                .padding([.horizontal, .bottom])
            
            
            
            
            
        }
        
        .navigationBarTitle("Learn about \(animal.name)", displayMode: .inline)
        
        
    }
}

struct AnimalView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalView(animal: Animal.getMock())
    }
}
