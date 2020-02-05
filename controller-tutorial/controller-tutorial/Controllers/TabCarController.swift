//
//  TabCarController.swift
//  controller-tutorial
//
//  Created by Chris Caldwell on 2/4/20.
//  Copyright © 2020 Chris Caldwell. All rights reserved.
//

import UIKit

class TabCarController: UITabBarController {
    override func viewDidLoad() {
        let homeController = UINavigationController(rootViewController: HomeController(collectionViewLayout: layout))
        homeController.title = "Home"
        homeController.navigationItem.title = "Home"
        homeController.tabBarItem.image = UIImage(named: "home")
        // has access to all properties of a UITab..
        viewControllers = [ homeController, profileController, addController, notificationsController, settingsController]
    }
    let layout: UICollectionViewFlowLayout = {
        let lo = UICollectionViewFlowLayout()
        lo.scrollDirection = .horizontal
        lo.minimumLineSpacing = 0
        return lo
    }()
        
    let profileController: UINavigationController = {
        let tc: UINavigationController = UINavigationController(rootViewController: TestController())
        tc.title = "Profile"
        tc.tabBarItem.image = UIImage(named: "person")
        return tc
    }()
    let addController: UINavigationController = {
        let ac: UINavigationController = UINavigationController(rootViewController: TestController())
        ac.title = "Add Pet"
        ac.tabBarItem.image = UIImage(named: "add")
        return ac
    }()
    let notificationsController: UINavigationController = {
        let nc: UINavigationController = UINavigationController(rootViewController: TestController())
        nc.title = "Notifications"
        nc.tabBarItem.image = UIImage(named: "notifications")
        return nc
    }()
    let settingsController: UINavigationController = {
        let sc: UINavigationController = UINavigationController(rootViewController: TestController())
        sc.title = "Settings"
        sc.tabBarItem.image = UIImage(named: "settings")
        return sc
    }()
    
}
