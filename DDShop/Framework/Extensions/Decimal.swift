//
//  Decimal.swift
//  DDShop
//
//  Created by Oliver Binns on 08/05/2019.
//  Copyright © 2019 Oliver Binns. All rights reserved.
//

import Foundation

extension Decimal {
    var gbp: String {
        // Swift seems to parse JSON -> Decimal via Floating point type
        // Looks like we have to truncate the value for now - NOT IDEAL!
        let float = Float(truncating: self as NSNumber)
        return String(format: "£%.2f", float)
    }
}
