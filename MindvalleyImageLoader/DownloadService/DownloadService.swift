//
//  DownloadService.swift
//  MindvalleyImageLoader
//
//  Created by erfan on 4/7/1398 AP.
//  Copyright © 1398 erfan. All rights reserved.
//

import UIKit

public typealias onSuccessHandler = (Data) -> Void
public typealias onErrorHandler = (Error) -> Void

public protocol Network {
    func request(with request: Request, onSuccess: @escaping onSuccessHandler, onError: @escaping onErrorHandler) -> URLSessionDataTask?
}
public class DownloadService: Network {
    
    
    
    //MARK: - Vars -
    
    public static var shared = DownloadService()
    private var dataCache = NSCache<NSURL, DiscardableData>()
    
    //MARK: - Init -
    
    private init() {}
    
    //MARK: - Functions -
    
    //convert a request to a URL
    private func convertRequestToURL(with request: Request) throws -> URL {
        guard let _urlComponent = URLComponents(string: request.path) else {
            throw libraryError.invalidURL
        }
        var urlComponent = _urlComponent
        
        //add url params if we had one
        if let parameters = request.params {
            var items = [URLQueryItem]()
            for (key, value) in parameters {
                items.append(URLQueryItem(name: key, value: value as? String))
            }
            urlComponent.queryItems = items
        }
        guard let url = urlComponent.url else {
            throw libraryError.invalidURL
        }
        return url
    }
    
    //check if we have cached the data
    private func checkDataCache(withKey urlKey: NSURL) -> Data? {
        return dataCache.object(forKey: urlKey)?.data
    }
    
    public func request(with request: Request, onSuccess: @escaping onSuccessHandler, onError: @escaping onErrorHandler) -> URLSessionDataTask? {
        do {
            let url = try convertRequestToURL(with: request)
            
            //urlKey is NSURL for checking NSCache
            let urlKey = url as NSURL
            
            //check cache
            if let data = checkDataCache(withKey: urlKey) {
                    onSuccess(data)
                return nil
            }
            
            //make a datatask request
            let task = URLSession.shared.dataTask(with: url) { (data, res, error) in
                    if error == nil, let unrwappedData = data {
                        if let response = res as? HTTPURLResponse {
                            switch response.validate() {
                            case .success:
                                self.dataCache.setObject(DiscardableData(data: unrwappedData), forKey: urlKey)
                                onSuccess(unrwappedData)
                                
                            case .failure(let resError):
                                onError(resError)
                            }
                        }
                    } else {
                        onError(error!)
                }
            }
            task.resume()
            return task
        } catch {
            onError(error)
            return nil
        }
    }
    
    public func downloadTask(with request: Request, onSuccess: @escaping onSuccessHandler, onError: @escaping onErrorHandler) -> URLSessionDownloadTask? {
        do {
            let url = try convertRequestToURL(with: request)
            
            //urlKey is NSURL for checking NSCache
            let urlKey = url as NSURL
            
            //check cache
            if let data = checkDataCache(withKey: urlKey) {
                    onSuccess(data)
                return nil
            }
            
            //make a datatask request
            let task = URLSession.shared.downloadTask(with: url) { (localURL, responseURL, error) in
                if localURL != nil {
                    if let string = try? String(contentsOf: localURL!) {
                        print(string)
                    }
                }
            }
            task.resume()
            return task
        } catch {
            onError(error)
            return nil
        }
    }
}
