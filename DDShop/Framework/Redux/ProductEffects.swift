//
//  ProductEffects.swift
//  DDShop
//
//  Created by Oliver Binns on 06/05/2019.
//  Copyright © 2019 Oliver Binns. All rights reserved.
//
import ReSwift
import ReSwiftThunk
import Foundation

func fetchProducts(with service: FetchProductListServiceProtocol = FetchProductListService()) -> Thunk<ProductState> {
    return Thunk<ProductState> { dispatch, getState in
        guard let state = getState() else { return }

        if state.fetchProductsState == .loading {
            return
        }
        dispatch(LoadProductsAction.loading)

        _ = service.getProductList().done { products in
            DispatchQueue.main.async {
                let action = LoadProductsAction.set(products)
                dispatch(action)
            }
        }.catch { _ in
            dispatch(LoadProductsAction.failed)
        }
    }
}
func addToCart(productId: Int, with service: CartServiceProtocol = CartService()) -> Thunk<ProductState> {
    return Thunk<ProductState> { dispatch, _ in
        _ = service.addToCart(productId: productId).done { cartId in
            dispatch(AddToCartAction(cartItem: CartItem(cartId: cartId, productId: productId)))
        }
    }
}
func removeFromCart(cartId: Int, with service: CartServiceProtocol = CartService()) -> Thunk<ProductState> {
    return Thunk<ProductState> { dispatch, getState in
        guard let cart = getState()?.cart,
            cart.contains(where: { $0.cartId == cartId })
            else { return }
        _ = service.removeFromCart(cartId: cartId).done { success in
            if success {
                dispatch(RemoveFromCartAction(cartId: cartId))
            }
        }
    }
}
