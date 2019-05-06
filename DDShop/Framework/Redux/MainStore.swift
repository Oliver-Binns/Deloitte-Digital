//
//  MainStore.swift
//  DDShop
//
//  Created by Oliver Binns on 06/05/2019.
//  Copyright © 2019 Oliver Binns. All rights reserved.
//
import Foundation
import ReSwift
import ReSwiftThunk

struct MainStore {
    static let shared: Store<ProductState> = {
        let thunksMiddleware: Middleware<ProductState> = createThunksMiddleware()
        return Store<ProductState>(
            reducer: productReducer,
            state: nil,
            middleware: [ thunksMiddleware ])
    }()
}
