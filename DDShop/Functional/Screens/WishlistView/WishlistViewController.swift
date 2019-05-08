//
//  CartViewController.swift
//  DDShop
//
//  Created by Oliver Binns on 08/05/2019.
//  Copyright © 2019 Oliver Binns. All rights reserved.
//
import ReSwift
import UIKit

// Easy Win
class WishlistViewController: UITableViewController {
    var cartView: CartView!

    override func viewDidLoad() {
        super.viewDidLoad()
        cartView = tableView as? CartView
    }

    override func viewWillAppear(_ animated: Bool) {
        MainStore.shared.subscribe(self)
    }

    override func viewDidDisappear(_ animated: Bool) {
        MainStore.shared.unsubscribe(self)
    }
}
extension WishlistViewController: StoreSubscriber {
    typealias StoreSubscriberStateType = ProductState

    func newState(state: ProductState) {
        let products = state.wishlist.compactMap { state.get(productId: $0) }
        cartView.cartItems = products
    }
}
