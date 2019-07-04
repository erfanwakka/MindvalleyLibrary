//
//  Request.swift
//  MindvalleyImageLoader
//
//  Created by erfan on 4/7/1398 AP.
//  Copyright © 1398 erfan. All rights reserved.
//

import UIKit

public struct Request {
    
    public let path: String
    public let headers: [String: String]?
    public let params: [String: Any?]?
}
