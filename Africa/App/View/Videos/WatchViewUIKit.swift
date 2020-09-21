//
//  WatchViewUIKIT.swift
//  Africa
//
//  Created by Riccardo on 21/09/2020.
//

import Foundation
import UIKit
import SwiftUI

struct WatchViewUIKit: UIViewRepresentable, UITableViewDataSource {
    
    @Binding var videos: [String]
    
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> some UIView {
        let tableView = UITableView()
        
        tableView.register(UITableView.self, forCellReuseIdentifier: "cell")
        
        

        return tableView
    }
    
}


