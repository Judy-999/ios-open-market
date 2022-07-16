//
//  MarketViewControllerLayout.swift
//  OpenMarket
//
//  Created by 변재은 on 2022/07/17.
//

import UIKit

final class MarketCollectionViewController: UICollectionViewController {
    enum Section: Hashable {
        case main
    }
    
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Item>
    
    lazy var dataSource = makeDataSource()
    lazy var snapshot = Snapshot()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = createListLayout()
        receivePageData()
    }
    
    func createListLayout() -> UICollectionViewLayout {
        let configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        return UICollectionViewCompositionalLayout.list(using: configuration)
    }
    
    func createGridLayout() -> UICollectionViewLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(44))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}

extension MarketCollectionViewController {
    func makeDataSource() -> DataSource {
        let registration = productCellRegistration()
        
        return DataSource(collectionView: collectionView) { collectionView, indexPath, item -> UICollectionViewCell? in
            return collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: item)
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

extension MarketCollectionViewController {
    func receivePageData() {
        let sut = URLSessionManager(session: URLSession.shared)
        let subURL = SubURL().pageURL(number: 1, countOfItems: 10)
        let dataDecoder = DataDecoder()
        
        sut.receivePage(subURL: subURL) { result in
            switch result {
            case .success(let data):
                let responsedData = dataDecoder.decode(type: Page.self, data: data)
            case .failure(_):
                print("서버 데이터 불일치 오류")
            }
        }
    }
}
