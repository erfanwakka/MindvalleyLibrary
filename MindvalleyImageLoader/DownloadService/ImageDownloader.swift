//
//  UIImageExtension.swift
//  MindvalleyImageLoader
//
//  Created by erfan on 4/8/1398 AP.
//  Copyright © 1398 erfan. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func set(withRequest request: Request, placeholder: UIImage?, thumbnailRequest thumbnailReq: Request?, onError: @escaping onErrorHandler) -> URLSessionDataTask? {
        showLoading()
        if image == nil {
            image = placeholder
        }
        
        if thumbnailReq != nil {
            return downloadThumbnail(withRequest: thumbnailReq!, withPlaceholder: placeholder, onError: onError)
        }
        
        return DownloadService.shared.request(with: request, onSuccess: { [weak self] (data) in
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    self?.image = image
                    self?.hideLoading()
                }
            }
        }) { [weak self] (error) in
            onError(error)
            DispatchQueue.main.async {
                self?.image = placeholder
                self?.hideLoading()
            }
        }
    }
    private func downloadThumbnail(withRequest request: Request, withPlaceholder placeholder: UIImage?, onError: @escaping onErrorHandler) -> URLSessionDataTask? {
        return DownloadService.shared.request(with: request, onSuccess: { [weak self] (data) in
            DispatchQueue.main.async {
                if self?.image == nil || self?.image == placeholder {
                    if let imageData = UIImage(data: data) {
                        self?.image = imageData
                        self?.hideLoading()
                    }
                }
            }
        }) { [weak self] (error) in
            onError(error)
            DispatchQueue.main.async {
                self?.image = placeholder
                self?.hideLoading()
            }
        }
    }
}


