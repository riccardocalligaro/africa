//
//  RichLink.swift
//  Africa
//
//  Created by Riccardo on 21/09/2020.
//

import Foundation
import UIKit
import SwiftUI
import LinkPresentation


struct RichLink: UIViewRepresentable {
    
    var url: URL
    
    @Binding var redraw: Bool
    
    func makeUIView(context: Context) -> some UIView {
        let view = LPLinkView(url: url)
        view.showsLargeContentViewer = false
        
        let provider = LPMetadataProvider()
        
        provider.startFetchingMetadata(for: url) { metadata, error in
            if let md = metadata {
                DispatchQueue.main.async {
                    md.imageProvider = nil
                    view.metadata = md
                    view.sizeToFit()
                    
                    
                    self.redraw.toggle()
                }
            }
        }
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    
}
