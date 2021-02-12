//
//  NBAMatchesViewModelTests.swift
//  scout-basketball-appTests
//
//  Created by Jéssica Araujo on 09/02/21.
//

import XCTest
@testable import scout_basketball_app

class NBAMatchesViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testThatIsGettingTodaysDateInACorrectFormat() {
        
        let viewModel = NBAMatchesViewModel()
        let result = viewModel.getTodayDate(dateFormat: "dd/MM")
        XCTAssertEqual(result, "09/02")
    }

}
