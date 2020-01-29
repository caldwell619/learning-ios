//
//  BaseCell.swift
//  youtube-clone
//
//  Created by Christopher Caldwell on 1/29/20.
//  Copyright © 2020 Christopher Caldwell. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        
    }
}
