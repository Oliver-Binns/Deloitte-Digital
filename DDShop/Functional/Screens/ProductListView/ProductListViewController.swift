//
//  FirstViewController.swift
//  DDShop
//
//  Created by Oliver Binns on 05/05/2019.
//  Copyright © 2019 Oliver Binns. All rights reserved.
//
import ReSwift
import UIKit

class ProductListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        MainStore.shared.dispatch(fetchProducts())
    }

    override func viewWillAppear(_ animated: Bool) {
        MainStore.shared.subscribe(self)
    }

    override func viewDidDisappear(_ animated: Bool) {
        MainStore.shared.unsubscribe(self)
    }
}
extension ProductListViewController: StoreSubscriber {
    typealias StoreSubscriberStateType = ProductState

    func newState(state: ProductState) {
        let productListView = self.tableView as? ProductListView
        productListView?.products = state.allProducts
    }
}
extension ProductListViewController: WishlistDelegate {
    func addToWishlist(product: Product) {
        MainStore.shared.dispatch(AddToWishlistAction(product: product))
    }

    func removeFromWishlist(product: Product) {
        MainStore.shared.dispatch(RemoveFromWishlistAction(product: product))
    }
}
extension ProductListViewController: CartDelegate {
    func addToCart(product: Product) {
        MainStore.shared.dispatch(AddToCartAction(product: product))
    }

    func removeFromCart(product: Product) {
        MainStore.shared.dispatch(RemoveFromCartAction(product: product))
    }
}
