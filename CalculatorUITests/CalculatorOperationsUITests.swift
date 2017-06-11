//
//  CalculatorUITests.swift
//  CalculatorUITests
//
//  Created by Jaume Ollés on 11/06/2017.
//  Copyright © 2017 Jolles. All rights reserved.
//

import XCTest

class CalculatorOperationsUITests: XCTestCase {
        
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
    
    //MARK: Addition
    
    func testSimpleAddition() {
        
        let app = XCUIApplication()
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["3"].tap()
        app.buttons["+"].tap()
        app.buttons["6"].tap()
        app.buttons["5"].tap()
        app.buttons["4"].tap()
        app.buttons["="].tap()
        XCTAssert(checkResult() == "777")
    }
    
    func testMultipleAddition() {
        
        let app = XCUIApplication()
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["3"].tap()
        app.buttons["+"].tap()
        app.buttons["6"].tap()
        app.buttons["5"].tap()
        app.buttons["4"].tap()
        app.buttons["+"].tap()
        app.buttons["7"].tap()
        app.buttons["8"].tap()
        app.buttons["9"].tap()
        app.buttons["0"].tap()
        app.buttons["="].tap()

        XCTAssert(checkResult() == "8667")
    }
    
    func testDecimalAddition() {
        let app = XCUIApplication()
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["."].tap()
        app.buttons["3"].tap()
        app.buttons["+"].tap()
        app.buttons["6"].tap()
        app.buttons["."].tap()
        app.buttons["5"].tap()
        app.buttons["4"].tap()
        app.buttons["+"].tap()
        app.buttons["7"].tap()
        app.buttons["8"].tap()
        app.buttons["."].tap()
        app.buttons["9"].tap()
        app.buttons["0"].tap()
        app.buttons["="].tap()

        XCTAssert(checkResult() == "97.74")
    }
    
    //MARK: Substraction
    
    func testSimpleSubstraction() {
        
        let app = XCUIApplication()
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["3"].tap()
        app.buttons["-"].tap()
        app.buttons["6"].tap()
        app.buttons["5"].tap()
        app.buttons["4"].tap()
        app.buttons["="].tap()

        XCTAssert(checkResult() == "-531")
    }
    
    func testMultipleSubstraction() {
        
        let app = XCUIApplication()
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["3"].tap()
        app.buttons["-"].tap()
        app.buttons["6"].tap()
        app.buttons["5"].tap()
        app.buttons["4"].tap()
        app.buttons["-"].tap()
        app.buttons["7"].tap()
        app.buttons["8"].tap()
        app.buttons["9"].tap()
        app.buttons["0"].tap()
        app.buttons["="].tap()
        XCTAssert(checkResult() == "-8421")
    }
    
    func testDecimalSubstraction() {
        let app = XCUIApplication()
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["."].tap()
        app.buttons["3"].tap()
        app.buttons["-"].tap()
        app.buttons["6"].tap()
        app.buttons["."].tap()
        app.buttons["5"].tap()
        app.buttons["4"].tap()
        app.buttons["-"].tap()
        app.buttons["7"].tap()
        app.buttons["8"].tap()
        app.buttons["."].tap()
        app.buttons["9"].tap()
        app.buttons["0"].tap()
        app.buttons["="].tap()
        
        XCTAssert(checkResult() == "-73.14")
    }
    
    //MARK: Combined Operands
    
    func testCombination1() {
        
        let app = XCUIApplication()
        app.buttons["6"].tap()
        app.buttons["5"].tap()
        app.buttons["4"].tap()
        app.buttons["-"].tap()
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["3"].tap()
        app.buttons["+"].tap()
        app.buttons["7"].tap()
        app.buttons["8"].tap()
        app.buttons["9"].tap()
        app.buttons["="].tap()
        
        XCTAssert(checkResult() == "1320")
    }
    
    func testCombination2() {
        
        let app = XCUIApplication()
        app.buttons["6"].tap()
        app.buttons["5"].tap()
        app.buttons["4"].tap()
        app.buttons["+"].tap()
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["3"].tap()
        app.buttons["-"].tap()
        app.buttons["7"].tap()
        app.buttons["8"].tap()
        app.buttons["9"].tap()
        app.buttons["="].tap()
        
        XCTAssert(checkResult() == "-12")
    }
    
    func testCombination3() {
        
        let app = XCUIApplication()
        app.buttons["6"].tap()
        app.buttons["."].tap()
        app.buttons["5"].tap()
        app.buttons["4"].tap()
        app.buttons["+"].tap()
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["."].tap()
        app.buttons["3"].tap()
        app.buttons["-"].tap()
        app.buttons["7"].tap()
        app.buttons["."].tap()
        app.buttons["8"].tap()
        app.buttons["9"].tap()
        app.buttons["="].tap()
        
        XCTAssert(checkResult() == "10.95")
    }
    
    func testCombination4() {
        
        let app = XCUIApplication()
        app.buttons["6"].tap()
        app.buttons["."].tap()
        app.buttons["5"].tap()
        app.buttons["4"].tap()
        app.buttons["+"].tap()
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["."].tap()
        app.buttons["3"].tap()
        app.buttons["-"].tap()
        app.buttons["7"].tap()
        app.buttons["8"].tap()
        app.buttons["."].tap()
        app.buttons["9"].tap()
        app.buttons["="].tap()
        
        XCTAssert(checkResult() == "-71.13")
    }
    
    func testCombination5() {
        
        let app = XCUIApplication()
        app.buttons["-"].tap()
        app.buttons["6"].tap()
        app.buttons["."].tap()
        app.buttons["5"].tap()
        app.buttons["4"].tap()
        app.buttons["+"].tap()
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["."].tap()
        app.buttons["3"].tap()
        app.buttons["-"].tap()
        app.buttons["7"].tap()
        app.buttons["."].tap()
        app.buttons["8"].tap()
        app.buttons["9"].tap()
        app.buttons["="].tap()
        
        XCTAssert(checkResult() == "-2.13")
    }

    //MARK: Further operations after equals
    
    func testFurtherOperations1() {
        
        let app = XCUIApplication()
        app.buttons["-"].tap()
        app.buttons["6"].tap()
        app.buttons["."].tap()
        app.buttons["5"].tap()
        app.buttons["4"].tap()
        app.buttons["+"].tap()
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["."].tap()
        app.buttons["3"].tap()
        app.buttons["-"].tap()
        app.buttons["7"].tap()
        app.buttons["."].tap()
        app.buttons["8"].tap()
        app.buttons["9"].tap()
        app.buttons["="].tap()
        
        XCTAssert(checkResult() == "-2.13")
        
        app.buttons["+"].tap()
        app.buttons["6"].tap()
        app.buttons["."].tap()
        app.buttons["5"].tap()
        app.buttons["4"].tap()
        app.buttons["+"].tap()
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["."].tap()
        app.buttons["3"].tap()
        app.buttons["-"].tap()
        app.buttons["7"].tap()
        app.buttons["."].tap()
        app.buttons["8"].tap()
        app.buttons["9"].tap()
        
        XCTAssert(checkResult() == "-73.26")
    }
    
    
    func testFurtherOperations2() {
        
        let app = XCUIApplication()
        app.buttons["-"].tap()
        app.buttons["6"].tap()
        app.buttons["."].tap()
        app.buttons["5"].tap()
        app.buttons["4"].tap()
        app.buttons["+"].tap()
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["."].tap()
        app.buttons["3"].tap()
        app.buttons["-"].tap()
        app.buttons["7"].tap()
        app.buttons["."].tap()
        app.buttons["8"].tap()
        app.buttons["9"].tap()
        app.buttons["="].tap()
        
        XCTAssert(checkResult() == "-2.13")
        
        app.buttons["+"].tap()
        app.buttons["6"].tap()
        app.buttons["5"].tap()
        app.buttons["."].tap()
        app.buttons["4"].tap()
        app.buttons["+"].tap()
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["3"].tap()
        app.buttons["-"].tap()
        app.buttons["7"].tap()
        app.buttons["."].tap()
        app.buttons["8"].tap()
        app.buttons["9"].tap()
        
        XCTAssert(checkResult() == "178.38")
    }
    
    func testFurtherOperations3() {
        
        let app = XCUIApplication()
        app.buttons["-"].tap()
        app.buttons["6"].tap()
        app.buttons["."].tap()
        app.buttons["5"].tap()
        app.buttons["4"].tap()
        app.buttons["+"].tap()
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["."].tap()
        app.buttons["3"].tap()
        app.buttons["-"].tap()
        app.buttons["7"].tap()
        app.buttons["."].tap()
        app.buttons["8"].tap()
        app.buttons["9"].tap()
        app.buttons["="].tap()
        
        XCTAssert(checkResult() == "-2.13")
        
        app.buttons["6"].tap()
        app.buttons["5"].tap()
        app.buttons["+"].tap()
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["."].tap()
        app.buttons["3"].tap()
        app.buttons["-"].tap()
        app.buttons["7"].tap()
        app.buttons["."].tap()
        app.buttons["8"].tap()
        app.buttons["9"].tap()
        
        XCTAssert(checkResult() == "2.2735")
    }
}
