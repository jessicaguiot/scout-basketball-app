//
//  ValidationTests.swift
//  scout-basketball-appTests
//
//  Created by Jéssica Araujo on 16/02/21.
//

import XCTest
@testable import scout_basketball_app

class ValidationTests: XCTestCase {
    
    var validation: Validation!
    var stringNumberTest: String!
    var stringAlphabeticTest: String!
    
    override func setUp() {
        
        super.setUp()
        
        validation = Validation.shared
        stringNumberTest = "7"
        stringAlphabeticTest = "Hello"
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    func testValidAlphabeticAndNumberReturnsSucess() {
        
        let resultAlphabetic = validation.validate(values: (type: .alphabeticStringWithSpace, inputValue: stringAlphabeticTest))
        let resultNumber = validation.validate(values: (type: .number, inputValue: stringNumberTest))
        
        let sucess = Valid.sucess
        
        XCTAssertEqual(sucess, resultAlphabetic)
        XCTAssertEqual(sucess, resultNumber)
    }
    
    func testInvalidInputAlphateticAndNumberReturnsFailureInvalid() {
        
        let invalidNumberResult = validation.validate(values: (type: .number, inputValue: stringAlphabeticTest))
        let invalidAlphaticResult = validation.validate(values: (type: .alphabeticStringWithSpace, inputValue: stringNumberTest))
        
        let failureInvalidNumber = Valid.failure(.error, .inValidNumber)
        let failureInvalidAlphabetic = Valid.failure(.error, .inValidAlphabeticString)
        
        XCTAssertEqual(invalidNumberResult, failureInvalidNumber)
        XCTAssertEqual(invalidAlphaticResult, failureInvalidAlphabetic)
        
    }
    
    func testEmptyInputsReturnsFailureEmpty() {
        
        let emptyResult = validation.validate(values: (type: .alphabeticStringWithSpace, inputValue: ""))
    
        let failureEmpty = Valid.failure(.error, .emptyAlphabeticString)
        
        XCTAssertEqual(emptyResult, failureEmpty)

    }
}
