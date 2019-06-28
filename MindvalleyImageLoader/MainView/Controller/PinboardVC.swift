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
    
    //MARK: - View LifeCycle's -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    //MARK: - Functions -
    
    private func configView() {
        PinboardCollectionView.delegate = self
        PinboardCollectionView.dataSource = self
        PinboardCollectionView.register(UINib(nibName: Constants.CellIdentifiers.regularCell, bundle: nil), forCellWithReuseIdentifier: Constants.CellIdentifiers.regularCell)
    }
}

// MARK: -  PinboardVC collection delegate  -
extension PinboardVC: UICollectionViewDelegate {
    
}
// MARK: -  PinboardVC collection dataSource  -
extension PinboardVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellIdentifiers.regularCell, for: indexPath) as? RegularCell else { return UICollectionViewCell() }
        return cell
    }
}
