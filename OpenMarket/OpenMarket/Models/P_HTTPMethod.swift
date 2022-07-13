//
//  practice2.swift
//  OpenMarket
//
//  Created by 변재은 on 2022/07/13.
//

import Foundation

enum HTTPMethod {
    static let get = "GET"
    static let post = "POST"
    static let patch = "PATCH"
    static let delete = "DELETE"
}

struct DetailOfProduct: Decodable {
    let ID: Int
    let vendorID: Int
    let name: String
    let thumbnail: String
    let currency: Currency
    let price: Int
    let bargainPrice: Int
    let discountedPrice: Int
    let stock: Int
    let createdAt: Date
    let issuedAt: Date
}

struct DetailOfPage: Decodable {
    let pageNumber: Int
    let itemsPerPage: Int
    let totalCount: Int
    let offset: Int
    let limit: Int
    let lastPage: Int
    let hasNext: Bool
    let hasPrevious: Bool
    let pages: [DetailOfProduct]
}

