//
//  MockProductService.swift
//  DDShopTests
//
//  Created by Oliver Binns on 07/05/2019.
//  Copyright © 2019 Oliver Binns. All rights reserved.
//
import Foundation
import PromiseKit

@testable import DDShop

class MockProductService: FetchProductListServiceProtocol {
    func getProductList() -> Promise<[[Product]]> {
        let promise = Promise()
        return promise.map {
            return [[Product]]()
        }
    }
}
