//
//  MenuCell.swift
//  youtube-clone
//
//  Created by Chris Caldwell on 1/29/20.
//  Copyright © 2020 Christopher Caldwell. All rights reserved.
//

import UIKit

class MenuCell: BaseCell {
    let iconView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "home-icon")
        return iv
    }()
    
    override func setupViews() {
        backgroundColor = .blue
        addSubview(iconView)
        addFormatConstraints(formatString: "H:|[v0]|", views: iconView)
        addFormatConstraints(formatString: "V:|[v0]|", views: iconView)
    }
}
