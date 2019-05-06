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
    @IBOutlet weak var stockLabel: UILabel!

    weak var wishlistDelegate: WishlistDelegate?
    weak var cartDelegate: CartDelegate?

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

            cart.isEnabled = product.stock != 0
            wishList.isEnabled = product.stock != 0
            if product.stock != 0 {
                cart.alpha = 1
                wishList.alpha = 1
                stockLabel.text = "\(product.stock) in stock"
            } else {
                cart.alpha = 0.3
                wishList.alpha = 0.3
            }
        }
    }

    override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)

        cart.setIcon(prefixText: "", icon: .fontAwesomeSolid(.shoppingCart), iconColor: cart.tintColor,
                     postfixText: " Add to Cart", postfixTextColor: cart.tintColor, forState: .normal)
        wishList.setIcon(prefixText: "", icon: .fontAwesomeRegular(.star), iconColor: wishList.tintColor,
                         postfixText: " Add to Wishlist", postfixTextColor: wishList.tintColor, forState: .normal)
    }

    @IBAction func addToCart(_ sender: Any) {
        guard let product = product else { return }
        cartDelegate?.addToCart(product: product)
    }

    @IBAction func addToWishlist(_ sender: Any) {
        guard let product = product else { return }
        wishlistDelegate?.addToWishlist(product: product)
    }
}
protocol WishlistDelegate: class {
    func addToWishlist(product: Product)
    func removeFromWishlist(product: Product)
}
protocol CartDelegate: class {
    func addToCart(product: Product)
    func removeFromCart(product: Product)
}
