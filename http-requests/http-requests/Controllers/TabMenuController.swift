//
//  TabMenuController.swift
//  http-requests
//
//  Created by Chris Caldwell on 2/6/20.
//  Copyright © 2020 Chris Caldwell. All rights reserved.
//

import UIKit

class TabMenuController: UITabBarController {
    override func viewDidLoad() {
        viewControllers = [homeController, getRequestController, postRequestController, deleteRequestController, putRequestController]
    }
    
    let homeController: HomeController = {
        let constroller = HomeController()
        return constroller
    }()
    
    let getRequestController: GetRequestController = {
        let constroller = GetRequestController()
        return constroller
    }()
    
    let postRequestController: PostRequestController = {
        let constroller = PostRequestController()
        return constroller
    }()
    
    let deleteRequestController: DeleteRequestController = {
        let constroller = DeleteRequestController()
        return constroller
    }()
    
    let putRequestController: PutRequestController = {
        let constroller = PutRequestController()
        return constroller
    }()
}
