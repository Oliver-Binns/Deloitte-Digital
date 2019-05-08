//
//  Globals.swift
//  DDShop
//
//  Created by Oliver Binns on 06/05/2019.
//  Copyright © 2019 Oliver Binns. All rights reserved.
//

import UIKit

struct Globals {
    static var baseUrl: String {
        let delegate = UIApplication.shared.delegate as? AppDelegate
        if delegate?.testMode ?? false {
            return ""
        } else {
            return "https://private-anon-a665a2107b-ddshop.apiary-mock.com/"
        }
    }
}
