//
//  Models.swift
//  http-requests
//
//  Created by Chris Caldwell on 2/7/20.
//  Copyright © 2020 Chris Caldwell. All rights reserved.
//

import UIKit

class Item: Decodable {
    
    var id: String?
    var descriptionType: String?
    
    init(id: String?, descriptionType: String?){
        self.id = id
        self.descriptionType = descriptionType
    }
}
