//
//  ViewController.swift
//  ExHorizontalScrollView
//
//  Created by Jake.K on 2022/05/16.
//

import UIKit

class ProductViewController: UIViewController {
    let productView = AddProductView()
    private let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        //    layout.minimumLineSpacing = 8.0
        layout.minimumInteritemSpacing = 8.0
        layout.itemSize = CGSize(width: 100, height: 100)
        return layout
    }()
    
    private var dataSource = getSampleImages()
  
//  private lazy var collectionView: UICollectionView = {
//    let view = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout)
//    view.isScrollEnabled = true
//    view.showsHorizontalScrollIndicator = false
//    view.showsVerticalScrollIndicator = true
////    view.scrollIndicatorInsets = UIEdgeInsets(top: -2, left: 0, bottom: 0, right: 4)
//    view.contentInset = .zero
//    view.backgroundColor = .clear
//    view.clipsToBounds = true
//    view.register(AddProductViewCell.self, forCellWithReuseIdentifier: "MyCell")
//    view.translatesAutoresizingMaskIntoConstraints = false
//    return view
//  }()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //    self.view.addSubview(self.collectionView)
        //
        //    NSLayoutConstraint.activate([
        //      self.collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
        //      self.collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
        //      self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 120),
        //      self.collectionView.heightAnchor.constraint(equalToConstant: 200),
        //    ])
        view = productView
        productView.collectionView.dataSource = self
    }
}

extension ProductViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    self.dataSource.count
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AddProductViewCell.id, for: indexPath) as! AddProductViewCell
      cell.button.imageView?.image = UIImage.add //self.dataSource[indexPath.item]
    return cell
  }
}

func getSampleImages() -> [UIImage?] {
  (1...5).map { _ in return UIImage(named: "dog") }
}
