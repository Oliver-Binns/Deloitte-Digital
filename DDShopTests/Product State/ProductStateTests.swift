//
//  ProductStateTests.swift
//  DDShopTests
//
//  Created by Oliver Binns on 07/05/2019.
//  Copyright © 2019 Oliver Binns. All rights reserved.
//
import Nimble
import ReSwift
import XCTest

@testable import DDShop

class ProductStateTests: XCTestCase {

    override func setUp() {
        MainStore.shared.dispatch(fetchProducts(with: MockProductService()))

        expect(MainStore.shared.state.fetchProductsState).to(equal(.loading))
        expect(MainStore.shared.state.fetchProductsState).toEventually(equal(.loaded))
    }

    func testProductsFetched() {
        expect(MainStore.shared.state.allProducts.count).to(equal(6))
    }

    func testCart() {
        let service = MockCartService()

        MainStore.shared.dispatch(addToCart(productId: 1, with: service))
        expect(MainStore.shared.state.cart).toEventually(equal([
            CartItem(cartId: 0, productId: 1)
        ]))

        MainStore.shared.dispatch(addToCart(productId: 2, with: service))
        expect(MainStore.shared.state.cart).toEventually(equal([
            CartItem(cartId: 0, productId: 1),
            CartItem(cartId: 1, productId: 2)
        ]))

        MainStore.shared.dispatch(addToCart(productId: 1, with: service))
        expect(MainStore.shared.state.cart).toEventually(equal([
            CartItem(cartId: 0, productId: 1),
            CartItem(cartId: 1, productId: 2),
            CartItem(cartId: 2, productId: 1)
        ]))

        MainStore.shared.dispatch(removeFromCart(cartId: 1, with: service))
        expect(MainStore.shared.state.cart).toEventually(equal([
            CartItem(cartId: 0, productId: 1),
            CartItem(cartId: 2, productId: 1)
        ]))
    }

    func testWishlist() {
        // Adding a roduct that doesn't exist should result in no state change
        MainStore.shared.dispatch(AddToWishlistAction(productId: 500))
        expect(MainStore.shared.state.wishlist).to(equal([]))

        // Add a product
        MainStore.shared.dispatch(AddToWishlistAction(productId: 1))
        expect(MainStore.shared.state.wishlist).to(equal([1]))

        MainStore.shared.dispatch(AddToWishlistAction(productId: 2))
        expect(MainStore.shared.state.wishlist).to(equal([1, 2]))

        // Add a duplicate product
        MainStore.shared.dispatch(AddToWishlistAction(productId: 1))
        expect(MainStore.shared.state.wishlist).to(equal([1, 2, 1]))

        MainStore.shared.dispatch(RemoveFromWishlistAction(productId: 1))
        expect(MainStore.shared.state.wishlist).to(equal([2, 1]))

        MainStore.shared.dispatch(RemoveFromWishlistAction(productId: 1))
        expect(MainStore.shared.state.wishlist).to(equal([2]))

        MainStore.shared.dispatch(RemoveFromWishlistAction(productId: 2))
        expect(MainStore.shared.state.wishlist).to(equal([]))
    }
}
