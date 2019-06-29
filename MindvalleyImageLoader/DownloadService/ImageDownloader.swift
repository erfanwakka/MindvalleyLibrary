//
//  UIImageExtension.swift
//  MindvalleyImageLoader
//
//  Created by erfan on 4/8/1398 AP.
//  Copyright © 1398 erfan. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func set(withRequest request: Request, placeholder: UIImage?, thumbnailRequest thumbnailReq: Request?) {
        
        if image == nil {
            image = placeholder
        }
        
        if thumbnailReq != nil {
            DownloadService.shared.request(with: thumbnailReq!, onSuccess: { (data) in
                if self.image == nil || self.image == placeholder {
                    if let imageData = UIImage(data: data) {
                        self.image = imageData
                    }
                }
            }) { (error) in
                self.image = placeholder
            }
        }
        
        DownloadService.shared.request(with: request, onSuccess: { (data) in
            if let image = UIImage(data: data) {
                self.image = image
            }
        }) { (error) in
            self.image = placeholder
        }
    }
    
}

