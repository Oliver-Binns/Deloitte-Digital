//
//  DDTabBarViewController.swift
//  DDShop
//
//  Created by Oliver Binns on 06/05/2019.
//  Copyright © 2019 Oliver Binns. All rights reserved.
//
import SwiftIcons
import UIKit

class DDTabBarController: UITabBarController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let icons: [FASolidType] = [ .tshirt, .shoppingCart, .infoCircle ]
        for (index, icon) in icons.enumerated() {
            tabBar.items?[index].setIcon(icon: .fontAwesomeSolid(icon), size: nil,
                                         textColor: tabBar.unselectedItemTintColor ?? .lightGray, backgroundColor: .clear,
                                         selectedTextColor: tabBar.tintColor, selectedBackgroundColor: .clear)
        }
    }
}
