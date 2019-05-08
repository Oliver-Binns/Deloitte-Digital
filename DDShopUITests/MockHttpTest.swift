//
//  MockHttpTest.swift
//  DDShopUITests
//
//  Created by Oliver Binns on 08/05/2019.
//  Copyright © 2019 Oliver Binns. All rights reserved.
//

import Foundation
import Embassy
import XCTest

//swiftlint:disable force_try
class MockHttpTest: XCTestCase {
    private var loop: EventLoop!

    override func setUp() {
        super.setUp()

        let classType = type(of: self)
        guard
            let path = Bundle(for: classType).path(forResource: "MockResponse", ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
                return
        }

        loop = try! SelectorEventLoop(selector: try! KqueueSelector())
        let server = DefaultHTTPServer(eventLoop: loop, port: 8080) { (_, startResponse, sendBody) in
            // Start HTTP response
            startResponse("200 OK", [])
            sendBody(data)
        }
        // Start HTTP server to listen on the port
        try! server.start()

        // Run event loop
        Thread(target: self, selector: #selector(runEventLoop), object: nil).start()
        //loop.runForever()
    }

    @objc private func runEventLoop() {
        loop.runForever()
        /*loopThreadCondition.lock()
        loopThreadCondition.signal()
        loopThreadCondition.unlock()*/
    }
}
