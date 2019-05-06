//
//  FetchProductListService.swift
//  DDShop
//
//  Created by Oliver Binns on 06/05/2019.
//  Copyright © 2019 Oliver Binns. All rights reserved.
//
import Foundation
import Alamofire
import PromiseKit

final class FetchProductListService: FetchProductListServiceProtocol {
    func getProductList() -> Promise<[[Product]]> {
        return getProducts().map { products in
            let dictionary = products.reduce([Product.Category: [Product]]()) { dictionary, nextValue in
                var updatedDictionary = dictionary
                if dictionary.keys.contains(nextValue.category) {
                    updatedDictionary[nextValue.category]?.append(nextValue)
                } else {
                    updatedDictionary[nextValue.category] = [ nextValue ]
                }
                return updatedDictionary
            }
            return Array(dictionary.values)
        }
    }

    private func getProducts() -> Promise<[Product]> {
        return Alamofire.request("https://private-anon-a665a2107b-ddshop.apiary-mock.com/products")
            .responseDecodable([Product].self)
    }
}
protocol FetchProductListServiceProtocol {
    func getProductList() -> Promise<[[Product]]>
}
