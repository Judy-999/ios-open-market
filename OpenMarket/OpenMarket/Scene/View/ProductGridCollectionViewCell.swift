//
//  PProductListCollectionViewCell.swift
//  OpenMarket
//
//  Created by 변재은 on 2022/07/18.
//

import Foundation
import UIKit

final class ProductGridCollectionViewCell: UICollectionViewCell {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .caption1)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .caption1)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        
        return stackView
    }()
    
    private let entireStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(verticalStackView)
        self.verticalStackView.addArrangedSubview(nameLabel)
        self.verticalStackView.addArrangedSubview(priceLabel)
        self.addSubview(entireStackView)
        self.entireStackView.addArrangedSubview(imageView)
        self.entireStackView.addArrangedSubview(verticalStackView)
        self.entireStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        self.entireStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        self.entireStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        self.entireStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

