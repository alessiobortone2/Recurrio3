
//
//  Recurrio.swift
//  RecurrioTests
//
//  Created by Denis Golub on 17/10/2017.
//  Copyright © 2017 Balancing Rock. All rights reserved.
//

import XCTest

class RecurrioUITest: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        if #available(iOS 9.0, *) {
            XCUIApplication().launch()
        } else {
            // Fallback on earlier versions
        }

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testForTable() {
        
        let app = XCUIApplication()
        let table = app.tables.element(boundBy: 0)
        XCTAssertEqual(app.tables.count, 1)
        XCTAssertEqual(table.cells.count, 4)
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testForButtons() {
        let app = XCUIApplication()
        app.tables.staticTexts["Hendricks 100%"].tap()
        XCTAssertEqual(app.buttons.count, 2)
    }
    
    func testForPerecentage() {
        let app = XCUIApplication()
        XCUIApplication().tables/*@START_MENU_TOKEN@*/.staticTexts["Mayonnaise 100%"]/*[[".cells.staticTexts[\"Mayonnaise 100%\"]",".staticTexts[\"Mayonnaise 100%\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["Button"].tap()
        XCTAssert(app.staticTexts["90%"].exists)
    }
    
    func testForImage() {
        let app = XCUIApplication()
        XCUIApplication().tables/*@START_MENU_TOKEN@*/.staticTexts["Hendricks 100%"]/*[[".cells.staticTexts[\"Hendricks 100%\"]",".staticTexts[\"Hendricks 100%\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let imageView = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element
        let count = imageView.images.count
        XCTAssert(count != 0)
        
    }
    
    func testForCellTextInTable() {
        let app = XCUIApplication()
        XCTAssert(app.staticTexts["Hendricks 100%"].exists)
    }
    
    func testForCellPercentageToChange() {
        let app = XCUIApplication()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Wine 100%"]/*[[".cells.staticTexts[\"Wine 100%\"]",".staticTexts[\"Wine 100%\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["Button"].tap()
        app.buttons["Back"].tap()
        XCTAssert(app.staticTexts["Wine 92%"].exists)
    }
    
    func testForPageToHaveADescription() {
        let app = XCUIApplication()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Wine 100%"]/*[[".cells.staticTexts[\"Wine 100%\"]",".staticTexts[\"Wine 100%\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssert(app.staticTexts["Alessio loves a bit of wine and pizza... dare you to find a more stereotypical Italian"].exists)
    }
    

    
}
