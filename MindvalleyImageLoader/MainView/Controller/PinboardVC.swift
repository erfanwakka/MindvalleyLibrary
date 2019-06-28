//
//  ViewController.swift
//  MindvalleyImageLoader
//
//  Created by erfan on 4/7/1398 AP.
//  Copyright © 1398 erfan. All rights reserved.
//

import UIKit

class PinboardVC: UIViewController {
    
    //MARK: - Outlets -
    
    @IBOutlet weak var PinboardCollectionView: UICollectionView!
    
    //MARK: - Actions -
    
    //MARK: - Vars -
    
    var images: [Image]? {
        didSet {
            PinboardCollectionView.reloadData()
        }
    }
    
    //MARK: - View LifeCycle's -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        getDatas()
    }
    
    //MARK: - Functions -
    
    private func configView() {
        PinboardCollectionView.delegate = self
        PinboardCollectionView.dataSource = self
        PinboardCollectionView.register(UINib(nibName: Constants.CellIdentifiers.regularCell, bundle: nil), forCellWithReuseIdentifier: Constants.CellIdentifiers.regularCell)
    }
    private func getDatas() {
        DownloadService.shared.GetRequest(with: URL(string: URLs.base)!) { (images) in
            self.images = images
        }
    }
    private func downloadImage(with fileName: String, completionHandler: @escaping (_ image: UIImage?) -> Void) {
        DownloadService.shared.downloadImage(with: URL(string: fileName)!) { (image) in
            completionHandler(image)
        }
    }
}

// MARK: -  PinboardVC collection delegate  -
extension PinboardVC: UICollectionViewDelegate {
    
    
}
// MARK: -  PinboardVC collection dataSource  -
extension PinboardVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellIdentifiers.regularCell, for: indexPath) as? RegularCell else { return UICollectionViewCell() }
        downloadImage(with: (images![indexPath.item].urls?.regular)!) { (image) in
            cell.image.image = image
        }
        return cell
    }
}
