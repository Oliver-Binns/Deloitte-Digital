//
//  ProductTableCell.swift
//  DDShop
//
//  Created by Oliver Binns on 06/05/2019.
//  Copyright © 2019 Oliver Binns. All rights reserved.
//

import UIKit

class ProductTableCell: UITableViewCell {
    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var pricing: UILabel!
    @IBOutlet private weak var cart: UIButton!
    @IBOutlet private weak var wishList: UIButton!

    var product: Product? = nil {
        didSet {
            guard let product = product else { return }
            name.text = product.name
            let pricingString = NSMutableAttributedString(string: "£\(product.price) ")
            if let oldPrice = product.oldPrice {
                pricingString.append(NSAttributedString(string: "£\(oldPrice)", attributes: [
                    NSAttributedString.Key.foregroundColor: UIColor.red,
                    NSAttributedString.Key.strikethroughColor: UIColor.red,
                    NSAttributedString.Key.strikethroughStyle: NSNumber(value: NSUnderlineStyle.single.rawValue)
                ]))
            }

            pricing.attributedText = pricingString
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        cart.setIcon(prefixText: "", icon: .fontAwesomeSolid(.shoppingCart), iconColor: cart.tintColor,
                     postfixText: " Add to Cart", postfixTextColor: cart.tintColor, forState: .normal)
        wishList.setIcon(prefixText: "", icon: .fontAwesomeRegular(.star), iconColor: wishList.tintColor,
                         postfixText: " Add to Wishlist", postfixTextColor: wishList.tintColor, forState: .normal)
    }
}
