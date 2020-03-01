//
//  ViewController.swift
//  http-requests
//
//  Created by Chris Caldwell on 2/6/20.
//  Copyright © 2020 Chris Caldwell. All rights reserved.
//

import UIKit

class GetRequestController: BaseController {

    var items: [Item] = []
    var identifier: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Get"
//        view.addSubview(inputGroupView)
        view.addSubview(sendRequestButton)
        
//        view.addFormatConstraints(formatString: "H:|-[v0]-|", views: inputGroupView)
        view.addFormatConstraints(formatString: "H:|-[v0]-|", views: sendRequestButton)
        view.addFormatConstraints(formatString: "V:|-100-[v0]", views: sendRequestButton)
//        setupInputGroup()
    }
    
    @objc func buttonAction(){
        let itemController = ItemsTableController()
        self.navigationController?.pushViewController(itemController, animated: true)
        print("button has been pressed")
    }
    @objc func textFieldEditingDidChange(){
        print("button has been pressed")
    }
    
    let sendRequestButton: UIButton = {
       let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        button.setTitle("Send Request", for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    let inputGroupView = UIView()
    
    func setupInputGroup(){
        inputGroupView.addSubview(inputLabel)
        inputGroupView.addSubview(inputField)
        inputGroupView.addFormatConstraints(formatString: "H:|-10-[v0]", views: inputField)
        inputGroupView.addFormatConstraints(formatString: "H:|-10-[v0]", views: inputLabel)
        inputGroupView.addFormatConstraints(formatString: "V:|[v0]-20-[v1]", views: inputLabel, inputField)
        inputField.delegate = self
    }
    
    let inputField: UITextField = {
        let sampleTextField =  UITextField(frame: CGRect(x: 20, y: 100, width: 300, height: 40))
        sampleTextField.placeholder = "Enter text here"
        sampleTextField.font = UIFont.systemFont(ofSize: 15)
        sampleTextField.borderStyle = UITextField.BorderStyle.roundedRect
        sampleTextField.autocorrectionType = UITextAutocorrectionType.no
        sampleTextField.keyboardType = UIKeyboardType.default
        sampleTextField.returnKeyType = UIReturnKeyType.done
        sampleTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        sampleTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return sampleTextField
    }()
    
    let inputLabel: UILabel = {
        let label = UILabel()
        label.text = "Identifier"
        return label
    }()
}

class ItemsTableController: UITableViewController {
    var items = [Item]()
    
    fileprivate func fetchItems(){
        Service.shared.fetchItems {
            print("running from table view cont")
        }
    }
    
    override func viewDidLoad() {
        fetchItems()
        navigationItem.title = "Items Returned "
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        return cell
    }

}
