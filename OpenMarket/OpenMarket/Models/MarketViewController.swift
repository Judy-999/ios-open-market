//
//  MarketViewcontroller.swift
//  OpenMarket
//
//  Created by 변재은 on 2022/07/17.
//

import UIKit

final class MarketViewController: UIViewController {
    var collectionView: UICollectionView = {
       let collectionView = UICollectionView(frame: <#T##CGRect#>, collectionViewLayout: <#T##UICollectionViewLayout#>)
    }()
    
    func configureLayout() {
        
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>),
            collectionView.bottomAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>),
            collectionView.leadingAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutXAxisAnchor>#>),
            collectionView.trailingAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutXAxisAnchor>#>)
        ])
    }
}
