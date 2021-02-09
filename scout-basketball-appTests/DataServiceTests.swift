//
//  DataServiceTests.swift
//  scout-basketball-appTests
//
//  Created by Jéssica Araujo on 09/02/21.
//

import XCTest
@testable import scout_basketball_app

class DataServiceTests: XCTestCase {
    
    var urlToTest: URL!
    
    override func setUp() {
        super.setUp()
        
        urlToTest = URL(string: "https://api-basketball.p.rapidapi.com/games")!
    }

    override func tearDown() {
        super.tearDown()
        
        urlToTest = nil
    }

    func testGetMatchesSucessReturnsMatches() {
        
        let dataService = DataService()
        
        let responseExpectation = expectation(description: "ResponseAPI")
        var responseApi: ResponseAPI?
        
        dataService.executeRequest(urlToTest) { response, error in
            
            responseApi = response
            responseExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 120) { error in
            XCTAssertNotNil(responseApi)
        }
    }

}
