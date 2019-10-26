//
//  Post.swift
//  lasttest
//
//  Created by Juan Cabral on 26/10/19.
//  Copyright © 2019 Juan Cabral. All rights reserved.
//

import Foundation

class Post {
    var userName:String?
    var userImage:String?
    var postImage:String?
    var date:Date?
    
    init(userName:String, userImage:String, postImage:String) {
        self.userName = userName
        self.userImage = userImage
        self.postImage = postImage
        date = Date()
    }
}
