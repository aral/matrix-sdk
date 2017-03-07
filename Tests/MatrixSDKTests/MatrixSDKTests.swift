//
//  MatrixSDKTests.swift
//  MatrixSDK
//
//  Created by Gustavo Perdomo on 3/7/17.
//  Copyright © 2017 MatrixSDK. All rights reserved.
//

import Foundation
import XCTest
import MatrixSDK

class MatrixSDKTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        //// XCTAssertEqual(MatrixSDK().text, "Hello, World!")
    }
}

#if os(Linux)
extension MatrixSDKTests {
    static var allTests : [(String, (MatrixSDKTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
#endif
