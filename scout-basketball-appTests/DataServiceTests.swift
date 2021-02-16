//
//  DataServiceTests.swift
//  scout-basketball-appTests
//
//  Created by Jéssica Araujo on 09/02/21.
//

import XCTest
@testable import scout_basketball_app

class DataServiceTests: XCTestCase {
    
    var dataService: DataService!
    var urlToTest: URL!
    
    override func setUp() {
        
        super.setUp()
        
        dataService = DataService()
    }

    override func tearDown() {
        
        super.tearDown()
        urlToTest = nil
    }

    func testGetMatchesSucessReturnsMatches() {
        
        
        urlToTest = URL(string: "https://api-basketball.p.rapidapi.com/games")!
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
    
    func testThrownsError() {
        
        urlToTest = URL(string: "https://api-basketball.p.rapidapi.com/jogos")!
        
        let responseExpectation = expectation(description: "Error")
        var responseError: Error?
        
        dataService.executeRequest(urlToTest) { response, error in
            
            responseError = error
            responseExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 120) { error in
            
            XCTAssertNotNil(responseError)
        }
    }

}
