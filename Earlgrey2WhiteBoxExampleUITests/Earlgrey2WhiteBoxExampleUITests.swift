//
//  Earlgrey2WhiteBoxExampleUITests.swift
//  Earlgrey2WhiteBoxExampleUITests
//
//  Created by Bastián Véliz Vega on 18-04-20.
//  Copyright © 2020 Bastián Véliz Vega. All rights reserved.
//

import XCTest

class Earlgrey2WhiteBoxExampleUITests: XCTestCase {
    let application = XCUIApplication()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.

        self.application.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRotationToPortrait() {
        XCUIDevice.shared.orientation = .portrait
        XCTAssertEqual(host.interfaceOrientation().isPortrait, true)
    }

    func testRotationToLandscape() {
        XCUIDevice.shared.orientation = .landscapeRight
        XCTAssertEqual(host.interfaceOrientation().isLandscape, true)
    }

    func testDismissingModal() {
        let showModalButton = EarlGrey.selectElement(with: grey_accessibilityID("presentModalButton"))
        let modalLabel = EarlGrey.selectElement(with: grey_accessibilityID("modalViewLabel"))

        // show modal by tapping on the button that triggers it
        showModalButton.perform(grey_tap())

        // Verify modal launch button is not displayed
        showModalButton.assert(grey_notVisible())

        // Verify modal label is displayed
        modalLabel.assert(grey_sufficientlyVisible())

        // Use the white-box testing call to programatically dismiss the modal
        host.dismissModal()

        // Verify that the modal is dismissed and that the original View Controller is shown
        showModalButton.assert(grey_sufficientlyVisible())
    }
}

private extension XCTestCase {
    /// A variable to point to the GREYHostApplicationDistantObject since casts in Swift fail on
    /// proxy types. Hence we have to perform an unsafeBitCast.
    var host: SwiftTestsHost {
        return unsafeBitCast(
            GREYHostApplicationDistantObject.sharedInstance,
            to: SwiftTestsHost.self
        )
    }
}
