//
// /Users/zzbae/Desktop/Yagom Career Starter Camp 6기/ios-open-market/OpenMarket/OpenMarket File.swift
//  OpenMarket
//
//  Created by 주디, 재재 on 2022/07/11.
//

import Foundation
import UIKit

struct Product: Codable {
    let id: Int
    let vendorId: Double
    let name: String
    let thumbnail: String
    let currency: Currency
    let price: Double
    let bargainPrice: Double
    let discountedPrice: Double
    let stock: Int
    let createdAt: String
    let issuedAt: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case vendorId = "vendor_id"
        case name
        case thumbnail
        case currency
        case price
        case bargainPrice = "bargain_price"
        case discountedPrice = "discounted_price"
        case stock
        case createdAt = "created_at"
        case issuedAt = "issued_at"
    }
}

extension Product {
    
    func toItem() -> Item? {
        let price = self.price.description
        let productName = self.name
        let barginPrice = self.price.description
        guard let url = URL(string: thumbnail) else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        guard let image = UIImage(data: data) else { return nil }
        let stock1 = self.stock.description
        return Item(productImage: image, productName: productName, price: price, bargainPrice: barginPrice, stock: stock1)
    }
}
