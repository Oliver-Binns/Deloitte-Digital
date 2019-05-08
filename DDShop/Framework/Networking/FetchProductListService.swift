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
            return dictionary.toArray()
        }
    }

    private func getProducts() -> Promise<[Product]> {
        print("base: ", Globals.baseUrl)
        return Alamofire.request(Globals.baseUrl + "products")
            .responseDecodable([Product].self)
    }
}
protocol FetchProductListServiceProtocol: class {
    func getProductList() -> Promise<[[Product]]>
}
private extension Dictionary where Key == Product.Category {
    func toArray() -> [Value] {
        var array = [Value]()
        for key in self.keys.sorted(by: { $0.rawValue < $1.rawValue }) {
            array.append(self[key]!)
        }
        return array
    }
}
