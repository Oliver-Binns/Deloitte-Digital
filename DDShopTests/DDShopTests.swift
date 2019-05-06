//
//  DDShopTests.swift
//  DDShopTests
//
//  Created by Oliver Binns on 05/05/2019.
//  Copyright © 2019 Oliver Binns. All rights reserved.
//

import XCTest
@testable import DDShop

class ArrayExtensionTest: XCTestCase {

    func testRemoveFirst() {
        var numbers = [ 1, 2, 3, 3, 2, 1 ]

        numbers.removeFirst(occurenceOf: 3)
        XCTAssertEqual(numbers, [ 1, 2, 3, 2, 1 ])

        numbers.removeFirst(occurenceOf: 2)
        XCTAssertEqual(numbers, [ 1, 3, 2, 1 ])

        numbers.removeFirst(occurenceOf: 3)
        XCTAssertEqual(numbers, [ 1, 2, 1 ])

        numbers.removeFirst(occurenceOf: 3)
        XCTAssertEqual(numbers, [ 1, 2, 1 ])
    }
}
