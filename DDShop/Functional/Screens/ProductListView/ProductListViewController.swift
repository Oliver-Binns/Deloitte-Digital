//
//  FirstViewController.swift
//  DDShop
//
//  Created by Oliver Binns on 05/05/2019.
//  Copyright © 2019 Oliver Binns. All rights reserved.
//
import Alamofire
import UIKit

class ProductListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //swiftlint:disable force_cast
        let productListView = self.tableView as! ProductListView
        //swiftlint:enable force_cast
        // Do any additional setup after loading the view.gvv
        _ = FetchProductListService.shared.getProducts().done { products in
            productListView.products = products
        }
    }
}
