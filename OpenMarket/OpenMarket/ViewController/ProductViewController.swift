//
//  ProductViewController.swift
//  OpenMarket
//
//  Created by 주디, 재재 on 2022/07/27.
//

import UIKit

class ProductViewController: UIViewController {
    private let productView = AddProductView()
    private lazy var dataSource = [UIImage(named: "dog"), UIImage(named: "dog"), UIImage(named: "dog"), UIImage(named: "dog"), UIImage(systemName: "plus")] //getSampleImages()

    override func loadView() {
        super.loadView()
        view = productView
    }
    
    override func viewDidLoad() {
        let cancelBarButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(goBack))
        let doneBarButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(goBackWithUpdate))
        super.viewDidLoad()
        navigationItem.title = "상품등록"
        navigationItem.leftBarButtonItem = cancelBarButton
        navigationItem.rightBarButtonItem = doneBarButton
        navigationItem.setHidesBackButton(true, animated: false)
        productView.collectionView.dataSource = self
    }
    
    @objc private func goBack() {
        self.navigationController?.popViewController(animated: true)
    }

    @objc private func goBackWithUpdate() {
        self.navigationController?.popViewController(animated: true)
    }
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


