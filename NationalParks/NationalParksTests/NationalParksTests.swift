//
//  NationalParksTests.swift
//  NationalParksTests
//
//  Created by Brian Halpin on 11/05/2023.
//

import XCTest
@testable import NationalParks

final class NationalParksTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testJSONMapping() throws {
        
        let parksJSON: [NationalPark] = ModelData().nationalParks
        let testNationalPark = parksJSON[0]
        
        XCTAssertEqual(testNationalPark.fullName, "California National Historic Trail", "Full name does not match")
        XCTAssertEqual(testNationalPark.name, "California", "Name doesn't match.")
        XCTAssertEqual(testNationalPark.id, "B39C368F-CB27-49EC-B2A9-E6C1552430FB", "ID doesn't match.")
        XCTAssertEqual(testNationalPark.addresses[0].stateCode, "NM", "State code doesn't match.")
        XCTAssertEqual(testNationalPark.longitude, "-108.702415369", "Longitude doesn't match.")
    }

    func testCoreDataEntry() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
