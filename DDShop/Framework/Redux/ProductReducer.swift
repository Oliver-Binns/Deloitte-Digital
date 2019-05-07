//
//  ProductReducer.swift
//  DDShop
//
//  Created by Oliver Binns on 06/05/2019.
//  Copyright © 2019 Oliver Binns. All rights reserved.
//
import ReSwift
import Foundation

func productReducer(action: Action, state: ProductState?) -> ProductState {
    var state = state ?? ProductState()

    switch action {
    case let action as LoadProductsAction:
        switch action {
        case .failed:
            state.fetchProductsState = .failed
        case .loading:
            state.fetchProductsState = .loading
        case .set(let products):
            state.allProducts = products
            state.fetchProductsState = .loaded
        }
    case let action as AddToCartAction:
        state.cart.append(action.cartItem)
    case let action as RemoveFromCartAction:
        state.cart.removeAll(where: { $0.cartId == action.cartId })
    case let action as AddToWishlistAction:
        // Only append if product Exists!
        guard state.contains(productId: action.productId) else {
            break
        }
        state.wishlist.append(action.productId)
    case let action as RemoveFromWishlistAction:
        state.wishlist.removeFirst(occurenceOf: action.productId)
    default:
        break
    }

    return state
}
