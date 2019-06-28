//
//  User.swift
//  MindvalleyImageLoader
//
//  Created by erfan on 4/7/1398 AP.
//  Copyright © 1398 erfan. All rights reserved.
//

import Foundation


struct user: Decodable {
    var id: String
    var username: String
    var name: String
    var profile_image: ImageProfile
    var links: Links
}
