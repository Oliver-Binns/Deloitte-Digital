//
//  Array+DDShop.swift
//  DDShop
//
//  Created by Oliver Binns on 06/05/2019.
//  Copyright © 2019 Oliver Binns. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {
    mutating func removeFirst(occurenceOf element: Element) {
        guard let firstIndex = firstIndex(where: { $0 == element }) else {
            return
        }
        self.remove(at: firstIndex)
    }
}
