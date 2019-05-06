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
    static var shared: FetchProductListServiceProtocol = FetchProductListService()

    func getProducts() -> Promise<[Product]> {
        return Alamofire.request("https://private-anon-a665a2107b-ddshop.apiary-mock.com/products")
            .responseDecodable([Product].self)
    }
}

protocol FetchProductListServiceProtocol {
    func getProducts() -> Promise<[Product]>
}
