//
//  File.swift
//  OpenMarket
//
//  Created by 주디, 재재 on 2022/07/15.
//

import UIKit

class MarketCollectionViewController: UIViewController {
    enum Section: Hashable {
        case main
    }
    
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>
    lazy var dataSource = makeDataSource()
    private let sessionManager = URLSessionManager(session: URLSession.shared)
    private var items: [Item] = []
    
    private lazy var productListCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(
            ProductListCollectionViewCell.self,
            forCellWithReuseIdentifier: String(describing: ProductListCollectionViewCell.self)
        )
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionViewLayout()
        APICall()
        applyInitialSnapshots()
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
        self.view.backgroundColor = .systemBackground
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
    }
    
    
    func createLayout() -> UICollectionViewLayout {
        let configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        return UICollectionViewCompositionalLayout.list(using: configuration)
    }
}

extension MarketCollectionViewController {
    func makeDataSource() -> DataSource {
        let registration = productCellRegistration()
        
        let dataSources = DataSource(collectionView: productListCollectionView) { collectionView, indexPath, item -> UICollectionViewCell? in
            let cell = collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: item)
            return cell
        }
        return dataSources
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
