//
//  RequestProtocol.swift
//  MindvalleyImageLoader
//
//  Created by erfan on 4/8/1398 AP.
//  Copyright © 1398 erfan. All rights reserved.
//

import UIKit

public protocol RequestProtocol {
    
    associatedtype CodableType: Decodable
}

public extension RequestProtocol {
    
    func executeRequest(dataRequest: Request, requestManager: Network = DownloadService.shared, onSuccess: @escaping (CodableType) -> (), onError: @escaping (Error) -> ()) -> URLSessionDataTask? {
        return requestManager.request(with: dataRequest, onSuccess: { (data) in
            let decoder = JSONDecoder()
            do {
                let object = try decoder.decode(CodableType.self, from: data)
                onSuccess(object)
            } catch {
                onError(error)
            }
        }) { (error) in
            onError(error)
        }
    }
}


