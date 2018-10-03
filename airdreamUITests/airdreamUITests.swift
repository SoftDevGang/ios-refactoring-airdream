//
//  airdreamUITests.swift
//  airdreamUITests
//
//  Created by Bastien DAVID on 26/09/2018.
//  Copyright © 2018 Orange. All rights reserved.
//

import XCTest

class airdreamUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFlow() {
        XCUIApplication().switches["tripType"].tap()
        let departureCity = XCUIApplication().textFields["departureCity"]
        departureCity.tap()
        departureCity.typeText("Grenoble")
        let arrivalCity = XCUIApplication().textFields["arrivalCity"]
        arrivalCity.tap()
        arrivalCity.typeText("Vienna")
        XCUIApplication()/*@START_MENU_TOKEN@*/.buttons["next"]/*[[".buttons[\"Next\"]",".buttons[\"next\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertEqual(XCUIApplication().staticTexts["summary"].label, "One way trip from Grenoble to Vienna")
    }

}
