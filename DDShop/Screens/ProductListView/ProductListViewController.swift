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

        // Do any additional setup after loading the view.
        Alamofire.request("https://private-anon-a665a2107b-ddshop.apiary-mock.com/products").responseData { response in
            guard let data = response.data else { return }

            let products = try? JSONDecoder().decode([Product].self, from: data)
            (self.tableView as? ProductListView)?.products = products ?? []
        }
    }
}
