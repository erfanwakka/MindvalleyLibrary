//
//  DiscardableImageCacheItem.swift
//  MindvalleyImageLoader
//
//  Created by erfan on 4/7/1398 AP.
//  Copyright © 1398 erfan. All rights reserved.
//

import UIKit

open class DiscardableImage: NSObject, NSDiscardableContent {
    
    var count: UInt = 0
    private(set) public var image: UIImage?
    
    
    public init(image: UIImage) {
        self.image = image
    }
    
    public func beginContentAccess() -> Bool {
        if image == nil { return image == nil }
        count += 1
        return image != nil
    }
    
    public func endContentAccess() {
        count -= (count > 0) ? 1 : 0
    }
    
    public func discardContentIfPossible() {
        if count == 0 { image = nil }
    }
    
    public func isContentDiscarded() -> Bool {
        return image == nil
    }
    
}
