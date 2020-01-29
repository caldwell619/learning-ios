//
//  MenuCell.swift
//  youtube-clone
//
//  Created by Chris Caldwell on 1/29/20.
//  Copyright © 2020 Christopher Caldwell. All rights reserved.
//

import UIKit

class MenuCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let iconView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    func setupViews(){
        backgroundColor = .blue
        addSubview(iconView)
        addFormatConstraints(formatString: "H:|[v0]|", views: iconView)
        addFormatConstraints(formatString: "V:|[v0]|", views: iconView)
    }
}
