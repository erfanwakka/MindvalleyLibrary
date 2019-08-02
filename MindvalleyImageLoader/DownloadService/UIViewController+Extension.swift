//
//  UIViewController+Extension.swift
//  MindvalleyImageLoader
//
//  Created by erfan on 5/11/1398 AP.
//  Copyright © 1398 erfan. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    func handleError(error: Error) {
        if let err = error as? libraryError {
            showAlert(withTitle: "Error", withMessage: err.errorDescription)
        }
    }
    private func showAlert(withTitle title: String?, withMessage message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
}
