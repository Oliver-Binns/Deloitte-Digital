//
//  CartView.swift
//  DDShop
//
//  Created by Oliver Binns on 08/05/2019.
//  Copyright © 2019 Oliver Binns. All rights reserved.
//

import UIKit

class CartView: UITableView {
    var cartItems: [Product] = [] {
        didSet {
            dataSource = self
            self.reloadData()
        }
    }
}
extension CartView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath)
        cell.textLabel?.text = cartItems[indexPath.row].name
        cell.detailTextLabel?.text = cartItems[indexPath.row].price.gbp
        return cell
    }
}
