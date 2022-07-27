//
//  ProductViewController.swift
//  OpenMarket
//
//  Created by 주디, 재재 on 2022/07/27.
//

import UIKit

class ProductViewController: UIViewController {
    private let productView = AddProductView()
    private lazy var dataSource = [UIImage.add, UIImage(named: "dog"), UIImage(named: "dog"), UIImage(named: "dog"), UIImage(named: "dog")] //getSampleImages()

    override func loadView() {
        super.loadView()
        view = productView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productView.collectionView.dataSource = self
    }
    
//    func getSampleImages() -> [UIImage?] {
//        (1...5).map { _ in return UIImage(named: "dog") }
//    }
}

extension ProductViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AddProductViewCell.id, for: indexPath) as? AddProductViewCell ?? AddProductViewCell()
        cell.productImageButton.setImage(dataSource[indexPath.item], for: .normal)
        return cell
    }
}


