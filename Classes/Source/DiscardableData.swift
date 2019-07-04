//
//  DiscardableImageCacheItem.swift
//  MindvalleyImageLoader
//
//  Created by erfan on 4/7/1398 AP.
//  Copyright © 1398 erfan. All rights reserved.
//

import UIKit

open class DiscardableData: NSObject, NSDiscardableContent {
    
    var count: UInt = 0
    private(set) public var data: Data?
    
    
    public init(data: Data) {
        self.data = data
    }
    
    public func beginContentAccess() -> Bool {
        if data == nil { return data == nil }
        count += 1
        return data != nil
    }
    
    public func endContentAccess() {
        count -= (count > 0) ? 1 : 0
    }
    
    public func discardContentIfPossible() {
        if count == 0 { data = nil }
    }
    
    public func isContentDiscarded() -> Bool {
        return data == nil
    }
    
}
