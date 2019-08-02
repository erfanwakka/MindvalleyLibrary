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
    
    @IBOutlet weak var PinboardCollectionView: UICollectionView! {
        didSet {
            PinboardCollectionView.register(UINib(nibName: Constants.CellIdentifiers.regularCell, bundle: nil), forCellWithReuseIdentifier: Constants.CellIdentifiers.regularCell)
            PinboardCollectionView.register(BottomView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: Constants.CellIdentifiers.bottomView)
            PinboardCollectionView.delegate = self
            PinboardCollectionView.dataSource = self
            PinboardCollectionView.refreshControl = refreshControl
        }
    }
    
    //MARK: - Actions -
    
    //MARK: - Vars -
    
    lazy var refreshControl: UIRefreshControl = {
        var refresh = UIRefreshControl()
        refresh.tintColor = UIColor.purple
        refresh.addTarget(self, action: #selector(refreshCollection), for: .valueChanged)
        return refresh
    }()
    
    var images: [Image] = [] {
        didSet {
            PinboardCollectionView.reloadData()
        }
    }
    
    //MARK: - View LifeCycle's -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    //MARK: - Functions -
    
    @objc private func refreshCollection() {
        getData()
    }
    private func getData() {
        let req = Request(path: URLs.base, headers: nil, params: nil)
        _ = MainViewService.shared.executeRequest(dataRequest: req, onSuccess: { [weak self] (images) in
            DispatchQueue.main.async {
                self?.refreshControl.endRefreshing()
                self?.images = images
            }
        }) { [weak self] (error) in
            DispatchQueue.main.async {
                self?.refreshControl.endRefreshing()
                self?.handleError(error: error)
            }
        }
    }

    private func calculateSize(forItem index: Int) -> CGSize {
        let widht = (UIScreen.main.bounds.width - 25) / 2
        let height = widht * CGFloat.random(in: 1...2.3)
        return CGSize(width: widht, height: height)
    }
}

// MARK: -  PinboardVC collection delegate  -
extension PinboardVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.alpha = 0
        UIView.animate(withDuration: 0.3) {
            cell.alpha = 1
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Constants.CellIdentifiers.bottomView, for: indexPath) as? BottomView else { return UICollectionReusableView() }
        //check if it is not the last page load more data
//        cell.startAnimating()
        //load more items
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        // if it is the last page we return .zero if not we must show activityIndicator and request for more data
        return images.isEmpty ? CGSize.zero : CGSize(width: UIScreen.main.bounds.width, height: 40)
    }
}
// MARK: -  PinboardVC collection dataSource  -
extension PinboardVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellIdentifiers.regularCell, for: indexPath) as? RegularCell else { return UICollectionViewCell() }
        //one of the urls was not founded (404 error)
        let req = Request(path: images[indexPath.item].urls.raw, headers: nil, params: nil)
        let thumbReq = Request(path: images[indexPath.item].urls.thumb, headers: nil, params: nil)
        cell.image.image = nil
        let _ = cell.image.set(withRequest: req, placeholder: #imageLiteral(resourceName: "mindvalley"), thumbnailRequest: thumbReq, onError: { error in
            print(error.localizedDescription)
        })
        return cell
    }
}
// MARK: -  PinboardVC collection flowlayout delegate  -
extension PinboardVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return calculateSize(forItem: indexPath.item)
    }
}
