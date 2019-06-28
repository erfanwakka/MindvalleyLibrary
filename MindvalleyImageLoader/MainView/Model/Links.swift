//
//  Links.swift
//  MindvalleyImageLoader
//
//  Created by erfan on 4/7/1398 AP.
//  Copyright © 1398 erfan. All rights reserved.
//

import Foundation


struct Links: Decodable {
    var own: String
    var html: String
    var photos: String
    var likes: String
    
    enum customKeys: String, CodingKey {
        case own = "self"
        case html
        case photos
        case likes
    }
}
