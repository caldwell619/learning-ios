//
//  ViewController.swift
//  http-requests
//
//  Created by Chris Caldwell on 2/6/20.
//  Copyright © 2020 Chris Caldwell. All rights reserved.
//

import UIKit

class DeleteRequestController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Delete"
        self.tabBarItem.image = UIImage(named: "home")
        self.view.backgroundColor = .red
    }
}

