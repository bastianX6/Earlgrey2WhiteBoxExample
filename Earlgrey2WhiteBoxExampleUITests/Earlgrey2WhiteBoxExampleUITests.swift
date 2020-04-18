//
//  Earlgrey2WhiteBoxExampleUITests.swift
//  Earlgrey2WhiteBoxExampleUITests
//
//  Created by Bastián Véliz Vega on 18-04-20.
//  Copyright © 2020 Bastián Véliz Vega. All rights reserved.
//

import XCTest

class Earlgrey2WhiteBoxExampleUITests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        let application: XCUIApplication = XCUIApplication()
        application.launch()
        EarlGrey.selectElement(with: grey_keyWindow())
            .perform(grey_tap())
    }
}
