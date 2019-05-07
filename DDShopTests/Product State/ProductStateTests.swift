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

        XCTAssertEqual([], MainStore.shared.state.allProducts)
        XCTAssertEqual([], MainStore.shared.state.cart)
        XCTAssertEqual([], MainStore.shared.state.wishlist)
    }

    func testProductsFetched() {
        XCTAssertEqual([], MainStore.shared.state.allProducts)
        XCTAssertEqual(MainStore.shared.state.fetchProductsState, .loading)
    }

    func testCart() {

    }

    func testWishlist() {
        // Adding a roduct that doesn't exist should result in no state change
        MainStore.shared.dispatch(AddToWishlistAction(productId: 500))
        XCTAssertEqual([], MainStore.shared.state.wishlist)

        // Add a product
        MainStore.shared.dispatch(AddToWishlistAction(productId: 1))
        XCTAssertEqual([], MainStore.shared.state.wishlist)

        MainStore.shared.dispatch(AddToWishlistAction(productId: 2))
        XCTAssertEqual([], MainStore.shared.state.wishlist)

        // Add a duplicate product
        MainStore.shared.dispatch(AddToWishlistAction(productId: 1))
        XCTAssertEqual([], MainStore.shared.state.wishlist)

        MainStore.shared.dispatch(RemoveFromWishlistAction(productId: 1))
        XCTAssertEqual([], MainStore.shared.state.wishlist)

        MainStore.shared.dispatch(RemoveFromWishlistAction(productId: 1))
        XCTAssertEqual([], MainStore.shared.state.wishlist)

        MainStore.shared.dispatch(RemoveFromWishlistAction(productId: 2))
        XCTAssertEqual([], MainStore.shared.state.wishlist)
    }
}
