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

final class MockProductService: FetchProductListServiceProtocol {
    func getProductList() -> Promise<[[Product]]> {
        let promise = Promise()
        return promise.map {
            let classType = type(of: self)
            guard
                let path = Bundle(for: classType.self).path(forResource: "MockResponse", ofType: "json"),
                let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
                let objects = try? JSONDecoder().decode([Product].self, from: data) else {
                return []
            }
            return [objects]
        }
    }
}
