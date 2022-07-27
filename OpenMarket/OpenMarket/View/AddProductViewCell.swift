//
//  MyCell.swift
//  ExHorizontalScrollView
//
//  Created by Jake.K on 2022/05/16.
//

import UIKit

final class AddProductViewCell: UICollectionViewCell {
  static let id = "MyCell"
  
  // MARK: UI
    let button: UIButton = {
        let view = UIButton()
        view.backgroundColor = .systemRed
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
  // MARK: Initializer
  required init?(coder: NSCoder) {
      super.init(coder: coder)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.contentView.addSubview(self.button)
    NSLayoutConstraint.activate([
      self.button.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
      self.button.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
      self.button.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
      self.button.topAnchor.constraint(equalTo: self.contentView.topAnchor),
    ])
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
//    self.button.imageView?.image = nil
  }
}
