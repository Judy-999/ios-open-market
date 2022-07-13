//
//  practice.swift
//  OpenMarket
//
//  Created by 변재은 on 2022/07/13.
//

import Foundation
import UIKit

let item = ["LIST", "GRID"]
let segmentedControl = UISegmentedControl(items: item)

segmentedControl.translatesAutoresizingMaskIntoConstraints = false
//자동constraints설정을 false해줘야함

NSLayoutConstraint.activate([segmentedControl.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10.0),
                             segmentedControl.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor)
                            ])

func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) {
    
}


UISegmentedControl.addTarget(self, action: #selector(indexChanged(_:)), for: .valueChanged))
