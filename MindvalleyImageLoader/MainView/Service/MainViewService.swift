//
//  MainViewService.swift
//  MindvalleyImageLoader
//
//  Created by erfan on 4/8/1398 AP.
//  Copyright © 1398 erfan. All rights reserved.
//

import Foundation


class MainViewService: RequestProtocol {
    
    typealias CodableType = [Image]
    
    private init() {}
    
    static var shared = MainViewService()
}
