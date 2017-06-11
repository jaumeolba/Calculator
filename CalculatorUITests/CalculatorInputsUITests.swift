//
//  CalculatorInputsUITests.swift
//  Calculator
//
//  Created by Jaume Ollés Barberán on 11/06/17.
//  Copyright © 2017 Jolles. All rights reserved.
//

import XCTest

class CalculatorInputsUITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
        let app = XCUIApplication()
        app.buttons["C"].tap()
    }
    
    private func checkResult() -> String? {
        return XCUIApplication().children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .textField).element(boundBy: 0).value as? String
    }
    
    //MARK: Operands
    
    func testOperandsInputs() {
        
        let app = XCUIApplication()
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["3"].tap()
        app.buttons["4"].tap()
        app.buttons["5"].tap()
        app.buttons["6"].tap()
        app.buttons["7"].tap()
        app.buttons["8"].tap()
        app.buttons["9"].tap()
        app.buttons["0"].tap()
        XCTAssert(checkResult() == "1234567890")
    }
    
    //MARK: Operators
    
    func testInitialOperatorsInputs() {
        
        let app = XCUIApplication()
        app.buttons["+"].tap()
        XCTAssert(checkResult() == "")
        app.buttons["-"].tap()
        XCTAssert(checkResult() == "-")
    }
    
    func testMiddleOperatorsInputs() {
        
        let app = XCUIApplication()
        app.buttons["1"].tap()
        app.buttons["+"].tap()
        XCTAssert(checkResult() == "1+")
        app.buttons["-"].tap()
        XCTAssert(checkResult() == "1-")
        app.buttons["+"].tap()
        XCTAssert(checkResult() == "1+")
        app.buttons["2"].tap()
        app.buttons["-"].tap()
        XCTAssert(checkResult() == "1-2-")
    }
    
    //MARK: Decimal
    
    func testDecimalInput() {
        let app = XCUIApplication()
        app.buttons["."].tap()
        XCTAssert(checkResult() == "")
        app.buttons["1"].tap()
        XCTAssert(checkResult() == "1")
        app.buttons["."].tap()
        XCTAssert(checkResult() == "1.")
        app.buttons["2"].tap()
        XCTAssert(checkResult() == "1.2")
        app.buttons["."].tap()
        XCTAssert(checkResult() == "1.2")
        app.buttons["3"].tap()
        XCTAssert(checkResult() == "1.23")
        app.buttons["."].tap()
        XCTAssert(checkResult() == "1.23")
        app.buttons["+"].tap()
        app.buttons["3"].tap()
        XCTAssert(checkResult() == "1.23+3")
        app.buttons["."].tap()
        XCTAssert(checkResult() == "1.23+3.")
    }
    
    //MARK: Clear
    
    func testClearInput() {
        let app = XCUIApplication()
        app.buttons["."].tap()
        app.buttons["1"].tap()
        app.buttons["."].tap()
        app.buttons["2"].tap()
        app.buttons["."].tap()
        app.buttons["3"].tap()
        app.buttons["."].tap()
        app.buttons["+"].tap()
        app.buttons["3"].tap()
        app.buttons["."].tap()
        app.buttons["C"].tap()
        XCTAssert(checkResult() == "")
    }
    
    func testEqualsInput() {
        let app = XCUIApplication()
        app.buttons["."].tap()
        app.buttons["1"].tap()
        app.buttons["."].tap()
        app.buttons["2"].tap()
        app.buttons["."].tap()
        app.buttons["3"].tap()
        app.buttons["."].tap()
        app.buttons["+"].tap()
        app.buttons["3"].tap()
        app.buttons["."].tap()
        XCTAssert(checkResult() == "1.23+3.")
        app.buttons["="].tap()
        XCTAssert(checkResult() != "1.23+3.")
        XCTAssert(checkResult() != "")
    }

}
