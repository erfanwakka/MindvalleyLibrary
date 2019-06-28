//
//  DownloadService.swift
//  MindvalleyImageLoader
//
//  Created by erfan on 4/7/1398 AP.
//  Copyright © 1398 erfan. All rights reserved.
//

import UIKit

class DownloadService {
    
    
    private init() {}
    static var shared = DownloadService()
    
    func downloadImage(with url: URL, completionHandler: @escaping (_ data: UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            if error == nil, let unrwappedData = data {
                let image = UIImage(data: unrwappedData)
                DispatchQueue.main.async {
                    completionHandler(image)
                }
            } else {
                DispatchQueue.main.async {
                    completionHandler(nil)
                }
            }
            }.resume()
    }
    func GetRequest(with url: URL, completionHandler: @escaping (_ response: [Image]?) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            if error == nil, let unrwappedData = data {
                let decoder = JSONDecoder()
                do {
                    let images = try decoder.decode([Image].self, from: unrwappedData)
                    DispatchQueue.main.async {
                        completionHandler(images)
                    }
                } catch {
                    DispatchQueue.main.async {
                        completionHandler(nil)
                    }
                }
            } else {
                DispatchQueue.main.async {
                    completionHandler(nil)
                }
            }
            }.resume()
    }
}
