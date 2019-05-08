//
//  TabBarScreenObject.swift
//  DDShopUITests
//
//  Created by Oliver Binns on 07/05/2019.
//  Copyright © 2019 Oliver Binns. All rights reserved.
//
import XCTest

struct TabBarScreenObject {
    let tabBar: XCUIElement

    var cartCount: String? {
        return tabBar.buttons["cart"].value as? String
    }
}
