//
//  ViedeosView.swift
//  Africa
//
//  Created by Riccardo on 20/09/2020.
//

import SwiftUI

struct ViedeosView: View {
    
    @State private var videos = ["Lion", "Zebra"]
    var body: some View {
        Text("Hello videos")
    }
}

struct ViedeosView_Previews: PreviewProvider {
    static var previews: some View {
        ViedeosView()
    }
}
