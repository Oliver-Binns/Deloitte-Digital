//
//  ProductListView.swift
//  DDShop
//
//  Created by Oliver Binns on 05/05/2019.
//  Copyright © 2019 Oliver Binns. All rights reserved.
//

import UIKit

class ProductListView: UITableView {

    var products: [Product] = [] {
        didSet {
            dataSource = self
            self.reloadData()
        }
    }
}
extension ProductListView: UITableViewDataSource {
    enum CellTypes: String {
        case clothingCell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellTypes.clothingCell.rawValue, for: indexPath)
        cell.textLabel?.text = products[indexPath.row].name
        return cell
    }
}
