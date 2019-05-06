//
//  CartModel.swift
//  DDShop
//
//  Created by Oliver Binns on 06/05/2019.
//  Copyright © 2019 Oliver Binns. All rights reserved.
//

import Foundation

struct CartItem {
    let cartId: Int
    let productId: Int
}
extension CartItem: Equatable {
    static func == (lhs: CartItem, rhs: CartItem) -> Bool {
        return lhs.cartId == rhs.cartId
    }
}
