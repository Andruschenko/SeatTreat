//
//  BackendAPITests.swift
//  SeatTreat
//
//  Created by Jan Erik Herrmann on 18.10.15.
//  Copyright © 2015 André Kovac. All rights reserved.
//

import XCTest
@testable import SeatTreat

class BackendAPITest: XCTestCase {

func testLoadAvailableSeats() {
    
    let expectation = expectationWithDescription("Swift Expectations")
    
    BackendAPI.loadAvailableSeats { seatList in
        print("finished")
        seatList[0].printSeat()
        
        XCTAssert(true)
        expectation.fulfill()
    }
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    waitForExpectationsWithTimeout(5.0, handler:nil)
}
    
    func testgetSeat() {
        
        let expectation = expectationWithDescription("Swift Expectations")
        
        BackendAPI.getSeat("1A") { seat in
            seat.printSeat()
            
            XCTAssert(true)
            expectation.fulfill()
        }
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        waitForExpectationsWithTimeout(5.0, handler:nil)
    }

}