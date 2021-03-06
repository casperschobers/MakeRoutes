//
//  Make_RoutesTests.swift
//  Make RoutesTests
//
//  Created by Casper Schobers on 25/11/16.
//  Copyright © 2016 Casper Schobers. All rights reserved.
//

import XCTest
@testable import Make_Routes

class Make_RoutesTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
  
  
  func testDoubleRoundDownExtension(){
    let d = 12.1234
    let dr = d.roundTo(places: 2)
    XCTAssertEqual(12.12, dr)
  }
  
  func testDoubleRoundUpExtension(){
    let d = 12.1254
    let dr = d.roundTo(places: 2)
    XCTAssertEqual(12.13, dr)
  }
    
}
