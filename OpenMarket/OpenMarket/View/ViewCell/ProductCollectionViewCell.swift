//
//  ProductCollectionViewCell.swift
//  OpenMarket
//
//  Created by 주디, 재재 on 2022/08/04.
//

import UIKit

class ProductImageCollectionViewCell: UICollectionViewCell {
    static let id = "ProductCell"
    
    private let productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private func arrangeSubView() {
        self.contentView.addSubview(productImage)
        
        NSLayoutConstraint.activate([
            productImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            productImage.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            productImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            productImage.topAnchor.constraint(equalTo: self.contentView.topAnchor)
        ])
    }
    
    func configureCell(image: UIImage) {
        productImage.image = image
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        arrangeSubView()
    }
}

class ProductAddButtonCollectionViewCell: UICollectionViewCell {
    private let productButton: UIButton = {
        let productButton = UIButton()
        productButton.backgroundColor = .systemGray5
        productButton.translatesAutoresizingMaskIntoConstraints = false
        return productButton
    }()
    
    private func arrangeSubView() {
        self.contentView.addSubview(productButton)
        
        NSLayoutConstraint.activate([
            productButton.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            productButton.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            productButton.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            productButton.topAnchor.constraint(equalTo: self.contentView.topAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        arrangeSubView()
    }
}

class ProductInputInfoCollectionViewCell: UICollectionViewCell {
    private let productNameTextfield: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "상품명"
        textField.font = .preferredFont(forTextStyle: .caption1)
        textField.keyboardType = .default
        textField.adjustsFontForContentSizeCategory = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let priceTextfield: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "상품가격"
        textField.font = .preferredFont(forTextStyle: .caption1)
        textField.keyboardType = .numberPad
        textField.adjustsFontForContentSizeCategory = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let discountedPriceTextfield: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "할인금액"
        textField.font = .preferredFont(forTextStyle: .caption1)
        textField.keyboardType = .numberPad
        textField.adjustsFontForContentSizeCategory = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let stockTextfield: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "재고수량"
        textField.font = .preferredFont(forTextStyle: .caption1)
        textField.keyboardType = .numberPad
        textField.adjustsFontForContentSizeCategory = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let segmentedControl: UISegmentedControl = {
        let segmentedControl = UIKit.UISegmentedControl(items: [Currency.krw.rawValue, Currency.usd.rawValue])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    private let priceStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    func arrangeSubView() {
        self.backgroundColor = .systemBackground
        
        priceStackView.addArrangedSubview(priceTextfield)
        priceStackView.addArrangedSubview(segmentedControl)
        
        infoStackView.addArrangedSubview(productNameTextfield)
        infoStackView.addArrangedSubview(priceStackView)
        infoStackView.addArrangedSubview(discountedPriceTextfield)
        infoStackView.addArrangedSubview(stockTextfield)
        
        contentView.addSubview(infoStackView)
        
        NSLayoutConstraint.activate([
            infoStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            infoStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            infoStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            infoStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
            
            segmentedControl.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.3),
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        arrangeSubView()
    }
}

class ProductDescriptionCollectionViewCell: UICollectionViewCell {
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.font = .preferredFont(forTextStyle: .caption1)
        textView.adjustsFontForContentSizeCategory = true
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    func arrangeSubView() {
        contentView.addSubview(descriptionTextView)
        
        NSLayoutConstraint.activate([
            descriptionTextView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            descriptionTextView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            descriptionTextView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            descriptionTextView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        arrangeSubView()
    }
}
