//
//  ShopDisplayScreenObject.swift
//  DDShopUITests
//
//  Created by Oliver Binns on 08/05/2019.
//  Copyright © 2019 Oliver Binns. All rights reserved.
//

import Foundation
import XCTest

struct ProductListScreenObject {
    let tableView: XCUIElement

    var cells: [ProductScreenObject] {
        let cellElements = tableView.cells.matching(identifier: "product-cell")
        return cellElements.allElementsBoundByIndex.map { ProductScreenObject(cell: $0) }
    }
}
