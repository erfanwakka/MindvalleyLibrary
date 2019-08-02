//
//  HTTPResponseExtension.swift
//  MindvalleyImageLoader
//
//  Created by erfan on 4/8/1398 AP.
//  Copyright © 1398 erfan. All rights reserved.
//

import Foundation

extension HTTPURLResponse {
    
    func validate() -> ValidationResult {
        
        switch self.statusCode {
        case 400:
            return .failure(error: libraryError.badRequest)
        case 401:
            return .failure(error: libraryError.unAuthorized)
        case 403:
            return .failure(error: libraryError.forbiden)
        case 404:
            return .failure(error: libraryError.notFound)
        case 400..<500:
            return .failure(error: libraryError.notFound)
        case 503:
            return .failure(error: libraryError.maintenance)
        case 500 ..< 600:
            return .failure(error: libraryError.serverUnAvailable)
        default:
            return .success
        }
    }
}
