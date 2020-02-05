//
//  File.swift
//  controller-tutorial
//
//  Created by Chris Caldwell on 2/3/20.
//  Copyright © 2020 Chris Caldwell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let homeView: Home = {
        let hv = Home()
        hv.backgroundColor = .blue
        return hv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(homeView)
        view.addFormatConstraints(formatString: "V:|[v0]|", views: homeView)
        view.addFormatConstraints(formatString: "H:|[v0]|", views: homeView)
    }
}
