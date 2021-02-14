//
//  MyFavouriteRecipesTests.swift
//  MyFavouriteRecipesTests
//
//  Created by newtan on 2021-02-13.
//

import XCTest
@testable import MyFavouriteRecipes

class MyFavouriteRecipesTests: XCTestCase {

    /*override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }*/
    
    override func setUp() {
        
    }

    func testIfGetCountriesHasItems() {
        // XCTAssertGreaterThan(Helper.getCountries().count, 0)
        XCTAssertTrue(Helper.getCountries().count > 0)
    }
    
    func testThatGetCoordinatesReturnsCorrectLatLon() {
        let locationOne = Helper.getCoordinates(country: "Spain")
        XCTAssertEqual(locationOne.latitude, 41.383)
        XCTAssertEqual(locationOne.longitude, 2.183)
            
        let locationTwo = Helper.getCoordinates(country: "UK")
        XCTAssertEqual(locationTwo.latitude, 53.483959)
        XCTAssertEqual(locationTwo.longitude, -2.244644)
    }

}
