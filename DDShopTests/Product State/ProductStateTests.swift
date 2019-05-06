//
//  ProductStateTests.swift
//  DDShopTests
//
//  Created by Oliver Binns on 07/05/2019.
//  Copyright © 2019 Oliver Binns. All rights reserved.
//

import XCTest

@testable import DDShop

class ProductStateTests: XCTestCase {

    override func setUp() {
        MainStore.shared.dispatch(fetchProducts(with: MockProductService()))
    }

    func testProductsFetched() {
        XCTAssertEqual([], MainStore.shared.state.allProducts)
        XCTAssertEqual(MainStore.shared.state.fetchProductsState, .loading)
    }
}
