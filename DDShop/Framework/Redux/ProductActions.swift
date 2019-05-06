//
//  ProductActions.swift
//  DDShop
//
//  Created by Oliver Binns on 06/05/2019.
//  Copyright © 2019 Oliver Binns. All rights reserved.
//
import ReSwift
import Foundation

enum LoadProductsAction: Action {
    case loading
    case set([[Product]])
    case failed
}

struct AddToCartAction: Action {
    let cartItem: CartItem
}
struct RemoveFromCartAction: Action {
    let cartId: Int
}

struct AddToWishlistAction: Action {
    let productId: Int
}
struct RemoveFromWishlistAction: Action {
    let productId: Int
}
