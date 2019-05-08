//
//  ProductState.swift
//  DDShop
//
//  Created by Oliver Binns on 06/05/2019.
//  Copyright © 2019 Oliver Binns. All rights reserved.
//
import ReSwift
import Foundation

struct ProductState: StateType {
    var allProducts: [[Product]] = []
    var fetchProductsState: AsyncStatus = .loaded

    var wishlist: [Int] = []
    var cart: [CartItem] = []

    enum AsyncStatus {
        case loading
        case failed
        case loaded
    }
}
extension ProductState {
    func get(productId: Int) -> Product? {
        return MainStore.shared.state.allProducts.flatMap { $0 }
            .first(where: { $0.productId == productId })
    }

    func contains(productId: Int) -> Bool {
        return MainStore.shared.state.allProducts.flatMap { $0 }.contains(where: {
            $0.productId == productId
        })
    }
}
