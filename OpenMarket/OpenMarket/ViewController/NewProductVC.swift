//
//  NewProductVC.swift
//  OpenMarket
//
//  Created by 변재은 on 2022/08/02.
//

import UIKit

class NewProductVC: UIViewController {
    enum Section: Int, Hashable, CaseIterable, CustomStringConvertible {
        case imageView, textfield, textWithCurrency
        
        var description: String {
            switch self {
            case .imageView: return "imageView"
            case .textfield: return "textfield"
            case .textWithCurrency: return "textWithCurrency"
            }
        }
        
        struct Item: Hashable {
            let productView = AddProductView()
            let imagePicker = UIImagePickerController()
            var dataSource: [UIImage] = []
            var imageParam: [ImageParam] = []
            init(emoji: Emoji? = nil, title: String? = nil, hasChildren: Bool = false) {
                self.emoji = emoji
                self.title = title
                self.hasChildren = hasChildren
            }
            private let identifier = UUID()
        }
        
        
    }
}
