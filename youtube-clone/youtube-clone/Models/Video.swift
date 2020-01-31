//
//  Video.swift
//  youtube-clone
//
//  Created by Chris Caldwell on 1/29/20.
//  Copyright © 2020 Christopher Caldwell. All rights reserved.
//

import UIKit

class Video: NSObject {
    
    var thumbnailImageName: String?
    var avatarImageName: String?
    var titleOfVideo: String?
    var subTitleOfVideo: String?
    
    init(thumbnailImageName: String?, avatarImageName: String?, titleOfVideo: String?, subTitleOfVideo: String?) {
        self.thumbnailImageName = thumbnailImageName
        self.avatarImageName = avatarImageName
        self.titleOfVideo = titleOfVideo
        self.subTitleOfVideo = subTitleOfVideo
    }
}
