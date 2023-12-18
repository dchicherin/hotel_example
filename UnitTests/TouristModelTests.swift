//
//  TouristModelTests.swift
//  UnitTests
//
//  Created by Dmitry Chicherin on 18/12/2566 BE.
//

import XCTest
@testable import TestTask_dchicherin

class TouristModelTests: XCTestCase {
    
    var touristModel: TouristModel!
    
    override func setUp() {
        super.setUp()
        touristModel = TouristModel()
    }
    
    override func tearDown() {
        touristModel = nil
        super.tearDown()
    }
    
    func testCheckTourists_WithValidTourists() {
        let tourist = Tourist(name: "John", surname: "Doe", birthDate: Date(), citizenship: "USA", passNumber: "1234567890", validThrough: Date(), touristNumber: "First Tourist", showFullInfo: true)
        touristModel.tourists = [tourist]
        
        let result = touristModel.checkTourists()
        
        XCTAssertTrue(result, "All tourists should be valid")
        XCTAssertFalse(tourist.nameError, "Name error should be false")
        XCTAssertFalse(tourist.surnameError, "Surname error should be false")
        XCTAssertFalse(tourist.birthDateError, "Birth date error should be false")
        XCTAssertFalse(tourist.citizenshipError, "Citizenship error should be false")
        XCTAssertFalse(tourist.passNumberError, "Passport number error should be false")
        XCTAssertFalse(tourist.validThroughError, "Valid through error should be false")
    }
    
    func testCheckTourists_WithInvalidTourists() {
        let tourist = Tourist(name: "", surname: "", birthDate: nil, citizenship: "", passNumber: "", validThrough: nil, touristNumber: "First Tourist", showFullInfo: true)
        touristModel.tourists = [tourist]
        
        let result = touristModel.checkTourists()
        let touristTest = touristModel.tourists.first!
        
        XCTAssertFalse(result, "All tourists should be invalid")
        XCTAssertTrue(touristTest.nameError, "Name error should be true")
        XCTAssertTrue(touristTest.surnameError, "Surname error should be true")
        XCTAssertTrue(touristTest.birthDateError, "Birth date error should be true")
        XCTAssertTrue(touristTest.citizenshipError, "Citizenship error should be true")
        XCTAssertTrue(touristTest.passNumberError, "Passport number error should be true")
        XCTAssertTrue(touristTest.validThroughError, "Valid through error should be true")
        XCTAssertTrue(touristTest.showFullInfo, "Show full info should be true")
    }
    
    func testGetNextTouristNumber() {
        touristModel.tourists = [
            Tourist(touristNumber: "First Tourist", showFullInfo: true),
            Tourist(touristNumber: "Second Tourist", showFullInfo: true),
            Tourist(touristNumber: "Third Tourist", showFullInfo: true)
        ]
        
        let nextTouristNumber = touristModel.getNextTouristNumber()
        
        XCTAssertEqual(nextTouristNumber, "Четвертый турист", "Next tourist number should be 'Четвертый турист'")
    }
    
}
