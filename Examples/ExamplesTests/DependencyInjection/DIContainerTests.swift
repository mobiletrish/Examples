//
//  DIContainerTests.swift
//  ExamplesTests
//
//  Created by Patricia Fulk on 4/5/23.
//

import XCTest
@testable import Examples

class DIContainerTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAddGet() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let storeValue: String = "store-value"
        DIContainer.instance.add(type: String.self, dicomponent: storeValue)
        XCTAssertTrue(DIContainer.instance.get(type: String.self) == storeValue)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
