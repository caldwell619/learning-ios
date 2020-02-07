//
//  ViewController.swift
//  http-requests
//
//  Created by Chris Caldwell on 2/6/20.
//  Copyright © 2020 Chris Caldwell. All rights reserved.
//

import UIKit

class PostRequestController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Post"
        self.tabBarItem.image = UIImage(named: "home")
        self.view.backgroundColor = .green
    }
}

