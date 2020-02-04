//
//  File.swift
//  controller-tutorial
//
//  Created by Chris Caldwell on 2/3/20.
//  Copyright © 2020 Chris Caldwell. All rights reserved.
//

import UIKit

class TestController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(testView)
        view.addFormatConstraints(formatString: "V:|[v0]|", views: testView)
        view.addFormatConstraints(formatString: "H:|[v0]|", views: testView)
        setupButton()
    }
    
    func setupButton(){
        
        switchButton.frame = CGRect(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 2, width: 150, height: 100)
        view.addSubview(switchButton)
    }
    @objc func buttonAction(sender: UIButton!) {
        self.navigationController?.popToViewController(ViewController.init(), animated: true)
    }
    
    let testView: UIView = {
        let tv = UIView()
        tv.backgroundColor = .green
        return tv
    }()
    let switchButton: UIButton = {
        let button = UIButton()
        button.setTitle("Switch to green", for: .normal)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
}
