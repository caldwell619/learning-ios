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
        let controller = HomeController()
        return controller
    }()
    
    let getRequestController: GetRequestController = {
        let controller = GetRequestController()
        return controller
    }()
    
    let postRequestController: PostRequestController = {
        let controller = PostRequestController()
        return controller
    }()
    
    let deleteRequestController: DeleteRequestController = {
        let controller = DeleteRequestController()
        return controller
    }()
    
    let putRequestController: PutRequestController = {
        let controller = PutRequestController()
        return controller
    }()
}
