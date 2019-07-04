//
//  squareCell.swift
//  MindvalleyImageLoader
//
//  Created by erfan on 4/7/1398 AP.
//  Copyright © 1398 erfan. All rights reserved.
//

import UIKit

class RegularCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView! {
        didSet {
            image.layer.cornerRadius = 8
            image.layer.masksToBounds = true
        }
    }

}
