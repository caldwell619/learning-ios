//
//  Extensions.swift
//  youtube-clone
//
//  Created by Chris Caldwell on 1/25/20.
//  Copyright © 2020 Christopher Caldwell. All rights reserved.
//

import UIKit


extension UIView {
    func addFormatConstraints(formatString: String, views: UIView...){
        var viewDictionary = [String: UIView]()
        for (index, view) in views.enumerated(){
            let key = "v\(index)"
            // allows for auto layout
            view.translatesAutoresizingMaskIntoConstraints = false
            viewDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: formatString, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewDictionary))
    }
}
