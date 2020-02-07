//
//  ViewController.swift
//  http-requests
//
//  Created by Chris Caldwell on 2/6/20.
//  Copyright © 2020 Chris Caldwell. All rights reserved.
//

import UIKit

class HomeController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let titleLabel = UILabel(frame: CGRect( x: 0, y: 0, width: view.frame.height - 32, height: view.frame.height))
        titleLabel.text = "  Yo Mama"
        navigationItem.titleView = titleLabel
        navigationController?.navigationBar.isTranslucent = false
        self.title = "Home"
        self.tabBarItem.image = UIImage(named: "home")
        self.view.backgroundColor = .blue
    }
}

