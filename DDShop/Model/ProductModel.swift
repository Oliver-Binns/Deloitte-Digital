//
//  ProductModel.swift
//  DD Shop
//
//  Created by Oliver Binns on 05/05/2019.
//  Copyright © 2019 Oliver Binns. All rights reserved.
//

import Foundation

struct Product: Decodable {

    let productId: Int
    let name: String

    private let rawCategory: String
    var category: Category {
        return Category(rawValue: rawCategory) ?? .other
    }

    // N.B. Float should not be used for precision numbers!
    let price: Decimal
    let oldPrice: Decimal?

    let stock: Int

    enum Category: String {
        case mensFormal = "Men's Formalwear"
        case mensFootwear = "Men's Footwear"
        case mensCasual = "Men's Casualwear"
        case womensFormal = "Women's Formalwear"
        case womensFootwear = "Women's Footwear"
        case womensCasual = "Women's Casualwear"
        case other = "Other"
    }

    enum CodingKeys: String, CodingKey {
        case productId
        case name
        case price
        case oldPrice
        case stock
        case rawCategory = "category"
    }
}
