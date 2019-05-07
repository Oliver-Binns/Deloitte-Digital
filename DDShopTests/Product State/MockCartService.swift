//
//  MockCartService.swift
//  DDShopTests
//
//  Created by Oliver Binns on 07/05/2019.
//  Copyright © 2019 Oliver Binns. All rights reserved.
//

import Foundation
import PromiseKit

@testable import DDShop

final class MockCartService: CartServiceProtocol {
    private var cartId: Int = -1

    func addToCart(productId: Int) -> Promise<Int> {
        let promise = Promise()
        return promise.map {
            self.cartId += 1
            return self.cartId
        }
    }

    func removeFromCart(cartId: Int) -> Promise<Bool> {
        return Promise().map {
            return true
        }
    }
}
