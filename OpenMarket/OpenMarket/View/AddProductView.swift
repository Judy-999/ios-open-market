//
//  AddProductView.swift
//  OpenMarket
//
//  Created by 주디, 재재 on 2022/07/27.
//

import UIKit

final class AddProductView: UIView {
    
    private let flowLayout: UICollectionViewFlowLayout = {
      let layout = UICollectionViewFlowLayout()
      layout.scrollDirection = .horizontal
      layout.minimumInteritemSpacing = 8.0
      layout.itemSize = CGSize(width: 100, height: 100)
      return layout
    }()
    
    lazy var collectionView: UICollectionView = {
      let view = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout)
      view.isScrollEnabled = true
      view.showsHorizontalScrollIndicator = false
      view.showsVerticalScrollIndicator = true
      view.contentInset = .zero
      view.backgroundColor = .clear
      view.clipsToBounds = true
      view.register(AddProductViewCell.self, forCellWithReuseIdentifier: "MyCell")
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()
    
    func aa() {
        self.backgroundColor = .systemBackground
        self.addSubview(self.collectionView)
        
        NSLayoutConstraint.activate([
            self.collectionView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            self.collectionView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
            self.collectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 120),
            self.collectionView.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        aa()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
