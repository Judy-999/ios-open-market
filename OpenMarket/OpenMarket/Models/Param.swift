//
//  Param.swift
//  OpenMarket
//
//  Created by 주디, 재재 on 2022/07/28.
//

import UIKit

enum VendorInfo {
    static let secret = "0hvvXjSeAS"
    static let identifier = "f27bc126-0335-11ed-9676-1776ba240ec2"
}

struct Param: Encodable {
    let productName: String
    let price: Int
    let bargainPrice: Int
    let currency: String
    let stock: Int
    let description: String
    let secret: String = VendorInfo.secret
}

struct ImageParam: Encodable {
    let imageName: String
    let imageType: String = "jpeg"
//    let imageData: UIImage
}
