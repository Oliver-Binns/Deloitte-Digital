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
    case fetch
    case set([[Product]])
    case failed
}

struct AddToCartAction: Action {
    let product: Product
}
struct RemoveFromCartAction: Action {
    let product: Product
}

struct AddToWishlistAction: Action {
    let product: Product
}
struct RemoveFromWishlistAction: Action {
    let product: Product
}
