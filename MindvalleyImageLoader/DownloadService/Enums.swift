//
//  Error.swift
//  MindvalleyImageLoader
//
//  Created by erfan on 4/7/1398 AP.
//  Copyright © 1398 erfan. All rights reserved.
//

import Foundation

public enum ValidationResult {
    case success
    case failure(error: Error)
}
public enum libraryError: Error {
    case invalidURL
    case noNetworkConnectivity
    case connectionTimeout
    case unAuthorized
    case forbiden
    case notFound
    case badRequest
    case serverUnAvailable
    case maintenance
    case unKnownError(statusCode: Int)
    
    var errorDescription: String? {
        switch self {
        case .noNetworkConnectivity, .unKnownError:
            return "No internet connection"
        case .connectionTimeout:
            return "Connection time out"
        case .unAuthorized:
            return "unAuthorized"
        case .notFound:
            return "Not Found"
        case .badRequest:
            return "Bad Request"
        case .serverUnAvailable:
            return "Server is temprory out of reach"
        case .forbiden:
            return "forbidden"
        case .maintenance:
            return "maintenance"
        case .invalidURL:
            return "invalidURL"
        }
    }
}
