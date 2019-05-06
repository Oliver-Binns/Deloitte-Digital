//
//  CartService.swift
//  DDShop
//
//  Created by Oliver Binns on 06/05/2019.
//  Copyright © 2019 Oliver Binns. All rights reserved.
//
import Alamofire
import PromiseKit
import Foundation

final class CartService: CartServiceProtocol {
    private let url = Globals.baseUrl + "cart"

    func addToCart(productId: Int) -> Promise<Int> {
        return Alamofire.request(url, method: .post, parameters: ["productId": productId], encoding: JSONEncoding.default)
            .responseDecodable(AddedResponse.self).map { response in
            return response.cartId
        }
    }

    func removeFromCart(cartId: Int) -> Promise<Bool> {
        return Alamofire.request(url, method: .delete, parameters: [ "cartId": cartId ], encoding: JSONEncoding.default)
            .responseData()
            .map { (_, response) in
            return response.response?.statusCode == 204
        }

    }
}
protocol CartServiceProtocol: class {
    func addToCart(productId: Int) -> Promise<Int>
    func removeFromCart(cartId: Int) -> Promise<Bool>
}
private struct AddedResponse: Decodable {
    let cartId: Int
    let productId: Int
}
