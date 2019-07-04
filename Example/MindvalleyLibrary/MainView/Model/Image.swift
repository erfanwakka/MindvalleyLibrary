//
//  Image.swift
//  MindvalleyImageLoader
//
//  Created by erfan on 4/7/1398 AP.
//  Copyright © 1398 erfan. All rights reserved.
//

import Foundation


struct Image: Decodable {
    var id: String?
    var created_at: String?
    var width: Int?
    var height: Int?
    var color: String?
    var likes: Int?
    var liked_by_user: Bool?
    var user: user
    var current_user_collections: [String] // all of the arrays was empty so I assume it is an array of string
    var urls: UrlProfile?
    var categories: [Category]
    var links: Links
}
