//
//  DDShopUITests.swift
//  DDShopUITests
//
//  Created by Oliver Binns on 05/05/2019.
//  Copyright © 2019 Oliver Binns. All rights reserved.
//
import Nimble
import XCTest

class DDShopUITests: XCTestCase {
    let app = XCUIApplication()

    var tabBarSO: TabBarScreenObject!
    var productListSO: ProductListScreenObject!

    override func setUp() {
        tabBarSO = TabBarScreenObject(tabBar: app.tabBars["tab-bar"])
        productListSO = ProductListScreenObject(tableView: app.otherElements["product-list-view"])
        // UI tests must launch the application that they test.
        //Doing this in setup will make sure it happens for each test method.
        app.launchArguments = ["uiTest"]
        app.launch()

    }

    func testTabBar() {
        expect(self.tabBarSO.cartCount).to(equal(""))

        // Add Product To Cart!
        self.productListSO.cells.first?.addToCart()
        expect(self.tabBarSO.cartCount).to(equal("1"))

        self.productListSO.cells.first?.addToCart()
        expect(self.tabBarSO.cartCount).to(equal("2"))

        self.productListSO.cells.last?.addToCart()
        expect(self.tabBarSO.cartCount).to(equal("3"))
    }

    func testProductList() {
        expect(self.productListSO.cells.count).toEventually(equal(15))

        // General Use Case
        expect(self.productListSO.cells[0].name).to(equal("Fine Stripe Short Sleve Shirt, Grey"))
        expect(self.productListSO.cells[0].pricing).to(equal("£49.99"))
        expect(self.productListSO.cells[0].stock).to(equal("9 in stock"))
        expect(self.productListSO.cells[0].isCartEnabled).to(beTrue())
        expect(self.productListSO.cells[0].cart).to(equal("Add to Cart"))
        expect(self.productListSO.cells[0].wishlist).to(equal("Add to Wishlist"))

        // Old Pricing is Optional- test this use-case
        expect(self.productListSO.cells[1].name).to(equal("Fine Stripe Short Sleve Shirt, Green"))
        expect(self.productListSO.cells[1].pricing).to(equal("£39.99 £49.99"))
        expect(self.productListSO.cells[1].stock).to(equal("3 in stock"))
        expect(self.productListSO.cells[1].cart).to(equal("Add to Cart"))
        expect(self.productListSO.cells[1].wishlist).to(equal("Add to Wishlist"))

        // Button is disabled is no stock is left, test this is the case!
        expect(self.productListSO.cells[2].name).to(equal("Flip Flops, Blue"))
        expect(self.productListSO.cells[2].pricing).to(equal("£19.00"))
        expect(self.productListSO.cells[2].stock).to(equal("Unavailable"))
        expect(self.productListSO.cells[2].isCartEnabled).to(beFalse())
        expect(self.productListSO.cells[2].cart).to(equal("Add to Cart"))
        expect(self.productListSO.cells[2].wishlist).to(equal("Add to Wishlist"))
    }

}
