//
//  MenuCell.swift
//  youtube-clone
//
//  Created by Chris Caldwell on 1/29/20.
//  Copyright © 2020 Christopher Caldwell. All rights reserved.
//

import UIKit
import ColorCompatibility

class MenuCell: BaseCell {
    let iconView: UIImageView = {
        let iv = UIImageView()
        iv.tintColor = ColorCompatibility.systemGray5
        return iv
    }()
    
    override var isSelected: Bool {
        didSet {
          iconView.tintColor = super.isSelected
              ? ColorCompatibility.label
            : ColorCompatibility.systemGray5
        }
    }
    
    override func setupViews() {
        backgroundColor = ColorCompatibility.systemGray2
        addSubview(iconView)
        addFormatConstraints(formatString: "H:[v0(28)]", views: iconView)
        addFormatConstraints(formatString: "V:[v0(28)]", views: iconView)
        addConstraint(NSLayoutConstraint(item: iconView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: iconView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
}
