//
//  File.swift
//  controller-tutorial
//
//  Created by Chris Caldwell on 2/3/20.
//  Copyright © 2020 Chris Caldwell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(testView)
        view.addFormatConstraints(formatString: "V:|[v0]|", views: testView)
        view.addFormatConstraints(formatString: "H:|[v0]|", views: testView)
//        view.addFormatConstraints(formatString: "V:|-[v0(100)]-|", views: switchButton)
//        view.addFormatConstraints(formatString: "H:|-[v0(40)]-|", views: switchButton)
        setupButton()
    }
    
    func setupButton(){
        switchButton.frame = CGRect(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 2, width: 150, height: 100)
        view.addSubview(switchButton)
    }
    @objc func buttonAction(sender: UIButton!) {
        self.navigationController?.pushViewController(TestController.init(), animated: true)

    }
    
    let testView: UIView = {
        let tv = UIView()
        tv.backgroundColor = .blue
        return tv
    }()
    let switchButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.red
        button.setTitle("Name your Button ", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
}
