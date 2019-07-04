//
//  Category.swift
//  MindvalleyImageLoader
//
//  Created by erfan on 4/7/1398 AP.
//  Copyright © 1398 erfan. All rights reserved.
//

import Foundation

struct Category: Decodable {
    var id: Int?
    var title: String?
    var photo_count: Int?
    var links: Links
}
