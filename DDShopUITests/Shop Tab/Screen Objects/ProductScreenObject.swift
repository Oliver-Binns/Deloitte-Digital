//
//  ProductScreenObject.swift
//  DDShopUITests
//
//  Created by Oliver Binns on 08/05/2019.
//  Copyright © 2019 Oliver Binns. All rights reserved.
//

import Foundation
import XCTest

struct ProductScreenObject {
    let cell: XCUIElement

    var name: String {
        return cell.staticTexts["name"].label
    }

    var pricing: String {
        return cell.staticTexts["pricing"].label
    }

    var stock: String {
        return cell.staticTexts["stock"].label
    }

    private var cartButton: XCUIElement {
        return cell.buttons["cart"]
    }

    var cart: String {
        return cartButton.label
    }

    var isCartEnabled: Bool {
        return cartButton.isEnabled
    }

    func addToCart() {
        cartButton.tap()
    }

    var wishlist: String {
        return cell.buttons["wishlist"].label
    }
}
