//
//  OpenMarket - ViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import UIKit

class MarketListViewController: UIViewController {
    enum Section: Hashable {
        case main
        case sub
    }

    typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>
    lazy var dataSource = makeDataSource()
    var dataSource2: UICollectionViewDiffableDataSource<Section, Item>?
    private let sessionManager = URLSessionManager(session: URLSession.shared)
    private var items: [Item] = []
    private var section: Section = .main

    private lazy var productListCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout { section, env in
            switch section {
            case 0:
                return self.hori()
            default:
            }
        })
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(
            ProductListCollectionViewCell.self,
            forCellWithReuseIdentifier: String(describing: ProductListCollectionViewCell.self)
        )
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.section = .sub
        self.dataSource2 = makeDataSource()
        configureCollectionViewLayout()
        APICall()
    }

    private func APICall() {
        let subURL = SubURL().pageURL(number: 1, countOfItems: 20)
        sessionManager.receivePage(subURL: subURL) { result in
            switch result {
            case .success(let data):
                let dataDecoder = DataDecoder()
                guard let page = dataDecoder.decode(type: Page.self, data: data) else { return }
                let products = page.pages
                print(page)
                print(products)
                print(data)
                let item = (products.map { $0.toItem() })
                let new = item.compactMap { $0 }
                self.items = new
                DispatchQueue.main.async { [weak self] in
                    self?.applyInitialSnapshots()
                }
            default:
                break
            }
        }
    }

    private func configureCollectionViewLayout() {
        self.view.backgroundColor = .white
        self.view.addSubview(productListCollectionView)
        self.productListCollectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.productListCollectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.productListCollectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        self.productListCollectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
    }

    func applyInitialSnapshots() {
        var itemSnapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        itemSnapshot.appendSections([.main])
        itemSnapshot.appendItems(self.items)
        dataSource.apply(itemSnapshot, animatingDifferences: false)

        var itemSnapshot2 = NSDiffableDataSourceSnapshot<Section, Item>()
        itemSnapshot2.appendSections([.sub])
        itemSnapshot2.appendItems(self.items)
        dataSource2?.apply(itemSnapshot2, animatingDifferences: false)

    }


    private func hori() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        // group horizontal
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 5)

        //section
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
}

extension MarketListViewController {
    func makeDataSource() -> DataSource {
        switch section {
        case .main:
            let registration = productCellRegistration()

            return DataSource(collectionView: productListCollectionView) { collectionView, indexPath, item -> UICollectionViewCell? in
                return collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: item)
            }
        case .sub:
        let registration = productCellRegistration()

        return DataSource(collectionView: productListCollectionView) { collectionView, indexPath, item -> UICollectionViewCell? in
            return collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: item)
        }
    }
}

    func productCellRegistration() -> UICollectionView.CellRegistration<UICollectionViewListCell, Item> {

        return .init { cell, _, item in
            var configuration = cell.defaultContentConfiguration()
            configuration.text = item.productName
            configuration.secondaryText = item.price
            configuration.image = item.productImage
            configuration.imageProperties.maximumSize = CGSize(width: 40, height: 40)

            cell.contentConfiguration = configuration

            let disclosureAccessory = UICellAccessory.disclosureIndicator()
            cell.accessories = [disclosureAccessory]
        }
    }
}
