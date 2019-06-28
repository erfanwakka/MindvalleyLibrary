//
//  ViewController.swift
//  MindvalleyImageLoader
//
//  Created by erfan on 4/7/1398 AP.
//  Copyright © 1398 erfan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    func downloadImage(with url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil, let unrwappedData = data {
                print(unrwappedData)
            }
        }.resume()
    }


}

