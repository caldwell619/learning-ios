//
//  MenuBar.swift
//  youtube-clone
//
//  Created by Chris Caldwell on 1/28/20.
//  Copyright © 2020 Christopher Caldwell. All rights reserved.
//

import UIKit
import ColorCompatibility

class MenuBar: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = ColorCompatibility.systemGray2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
