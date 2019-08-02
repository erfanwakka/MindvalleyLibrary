//
//  UIView+Extension.swift
//  MindvalleyImageLoader
//
//  Created by erfan on 5/11/1398 AP.
//  Copyright © 1398 erfan. All rights reserved.
//

import UIKit

extension UIView {
    func showLoading() {
        if let _ = self.viewWithTag(1001) {
            return
        }
        let loader = UIView()
        loader.tag = 1001
        loader.layer.cornerRadius = layer.cornerRadius
        loader.backgroundColor = .white
        addSubview(loader)
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.topAnchor.constraint(equalTo: topAnchor).isActive = true
        loader.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        loader.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        loader.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        let activity = UIActivityIndicatorView()
        activity.hidesWhenStopped = true
        activity.color = UIColor.darkGray
        activity.translatesAutoresizingMaskIntoConstraints = false
        loader.addSubview(activity)
        activity.centerXAnchor.constraint(equalTo: loader.centerXAnchor).isActive = true
        activity.centerYAnchor.constraint(equalTo: loader.centerYAnchor).isActive = true
        activity.startAnimating()
    }
    func hideLoading() {
        if let loadingView = self.viewWithTag(1001) {
            loadingView.removeFromSuperview()
        }
    }
}
