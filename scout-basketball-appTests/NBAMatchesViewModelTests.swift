//
//  NBAMatchesViewModelTests.swift
//  scout-basketball-appTests
//
//  Created by Jéssica Araujo on 09/02/21.
//

import XCTest
@testable import scout_basketball_app

class NBAMatchesViewModelTests: XCTestCase {
    
    class MockDateHandler: DateHandler {

        var mockedDate:Date = Date(timeIntervalSinceReferenceDate: 612190714.691352)
        
        override func currentDate() -> Date {
            return mockedDate
        }
    }
    
    var viewModel: NBAMatchesViewModel?
    var dataHandler: MockDateHandler?
    
    override func setUp() {
        super.setUp()
        
        viewModel = NBAMatchesViewModel()
        dataHandler = MockDateHandler()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testThatIsGettingTodaysDateInACorrectFormat() {
        
        let result = viewModel?.getTodayDate(dateHandler: dataHandler!, dateFormat: "dd/MM")
        XCTAssertEqual(result, "26/05")
    }
    
    func testIfItIsGettingTheCorrectWeekday() {
        
        let calendar = Calendar.init(identifier: .gregorian)
        let wednesdayDate = dataHandler?.currentDate().tomorrow(using: calendar)
        let thursdayDate = wednesdayDate?.tomorrow(using: calendar)
        let fridayDate = thursdayDate?.tomorrow(using: calendar)
        let saturdayDate = fridayDate?.tomorrow(using: calendar)
        let sundayDate = saturdayDate?.tomorrow(using: calendar)
        let mondayDate = sundayDate?.tomorrow(using: calendar)
        
        
        let tuesdayResult = viewModel?.getWeekDay(from: dataHandler!.currentDate())
        let wednesdayResult = viewModel?.getWeekDay(from: wednesdayDate!)
        let thursdayResult = viewModel?.getWeekDay(from: thursdayDate!)
        let fridayResult = viewModel?.getWeekDay(from: fridayDate!)
        let saturdayResult = viewModel?.getWeekDay(from: saturdayDate!)
        let sundayResult = viewModel?.getWeekDay(from: sundayDate!)
        let mondayResult = viewModel?.getWeekDay(from: mondayDate!)
        
        XCTAssertEqual(tuesdayResult, "Terça")
        XCTAssertEqual(wednesdayResult, "Quarta")
        XCTAssertEqual(thursdayResult, "Quinta")
        XCTAssertEqual(fridayResult, "Sexta")
        XCTAssertEqual(saturdayResult, "Sábado")
        XCTAssertEqual(sundayResult, "Domingo")
        XCTAssertEqual(mondayResult, "Segunda")
        
    }
}
