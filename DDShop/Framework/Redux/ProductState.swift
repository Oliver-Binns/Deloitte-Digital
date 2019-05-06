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

    var wishlist: [Product] = []
    var cart: [Product] = []

    enum AsyncStatus {
        case loading
        case failed
        case loaded
    }
}
