//
//  CalculatorPresenterTests.swift
//  Calculator
//
//  Created by Jaume Ollés Barberán on 10/6/17.
//  Copyright © 2017 Jolles. All rights reserved.
//

import XCTest
@testable import Calculator

class CalculatorPresenterTests: XCTestCase {
    
    var view: CalculatorViewMock!
    var presenter: CalculatorPresenter!
    var interactor: CalculatorInteractorMock!
    
    override func setUp() {
        super.setUp()
        view = CalculatorViewMock()
        presenter = CalculatorPresenter()
        interactor = CalculatorInteractorMock()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
    }
    
    override func tearDown() {
        super.tearDown()
        view.call = ""
        interactor.call = ""
    }
    
    func testClearClicked() {
        presenter.clearClicked()
        XCTAssertTrue(view.call == "updateDisplay - EMPTY")
        
        tearDown()
        XCTAssertFalse(view.call == "updateDisplay - EMPTY")
        
        let randomNumber = Int(arc4random_uniform(9))
        
        presenter.operandClicked(Number.init(randomNumber))
        XCTAssertFalse(view.call == "updateDisplay - EMPTY")
        XCTAssertTrue(view.call == "updateDisplay - \(randomNumber)")
        
        presenter.clearClicked()
        XCTAssertTrue(view.call == "updateDisplay - EMPTY")
    }
    
    func testDecimalClicked() {
        presenter.decimalClicked()
        XCTAssertTrue(view.call == "updateDisplay - EMPTY")
        
        tearDown()
        
        let randomNumber1 = Int(arc4random_uniform(9))

        presenter.operandClicked(Number.init(randomNumber1))
        XCTAssertTrue(view.call == "updateDisplay - \(randomNumber1)")
        
        presenter.decimalClicked()
        XCTAssertTrue(view.call == "updateDisplay - \(randomNumber1).")
        
        let randomNumber2 = Int(arc4random_uniform(9))
        
        presenter.operandClicked(Number.init(randomNumber2))
        XCTAssertTrue(view.call == "updateDisplay - \(randomNumber1).\(randomNumber2)")
        
        presenter.decimalClicked()
        XCTAssertTrue(view.call == "updateDisplay - \(randomNumber1).\(randomNumber2)")
        
        presenter.operatorClicked(AdditionOperator<Number>())
        XCTAssertTrue(view.call == "updateDisplay - \(randomNumber1).\(randomNumber2)+")
        presenter.decimalClicked()
        XCTAssertTrue(view.call == "updateDisplay - \(randomNumber1).\(randomNumber2)+")
        
    }
    
    func testOperandClicked() {
        
        let additionOperator = AdditionOperator<Number>()
        
        let randomNumber1 = Int(arc4random_uniform(9))
        
        presenter.operandClicked(Number.init(randomNumber1))
        XCTAssertTrue(view.call == "updateDisplay - \(randomNumber1)")
        
        let randomNumber2 = Int(arc4random_uniform(9))
        
        presenter.operandClicked(Number.init(randomNumber2))
        XCTAssertTrue(view.call == "updateDisplay - \(randomNumber1)\(randomNumber2)")
        
        let randomNumber3 = Int(arc4random_uniform(9))
        
        presenter.operandClicked(Number.init(randomNumber3))
        XCTAssertTrue(view.call == "updateDisplay - \(randomNumber1)\(randomNumber2)\(randomNumber3)")
        
        presenter.operatorClicked(additionOperator)
        
        let randomNumber4 = Int(arc4random_uniform(9))
        
        presenter.operandClicked(Number.init(randomNumber4))
        XCTAssertTrue(view.call == "updateDisplay - \(randomNumber1)\(randomNumber2)\(randomNumber3)\(additionOperator.toString())\(randomNumber4)")
        
        let randomNumber5 = Int(arc4random_uniform(9))
        
        presenter.operandClicked(Number.init(randomNumber5))
        XCTAssertTrue(view.call == "updateDisplay - \(randomNumber1)\(randomNumber2)\(randomNumber3)\(additionOperator.toString())\(randomNumber4)\(randomNumber5)")
        
        let randomNumber6 = Int(arc4random_uniform(9))
        
        presenter.operandClicked(Number.init(randomNumber6))
        XCTAssertTrue(view.call == "updateDisplay - \(randomNumber1)\(randomNumber2)\(randomNumber3)\(additionOperator.toString())\(randomNumber4)\(randomNumber5)\(randomNumber6)")
    }
    
    func testOperatorClicked() {
        
        let additionOperator = AdditionOperator<Number>()
        let substractionOperator = SubstractionOperator<Number>()
        
        presenter.operatorClicked(additionOperator)
        XCTAssertTrue(view.call == "updateDisplay - EMPTY")
        
        presenter.operatorClicked(substractionOperator)
        XCTAssertTrue(view.call == "updateDisplay - \(substractionOperator.toString())")
        
        let randomNumber1 = Int(arc4random_uniform(9))
        
        presenter.operandClicked(Number.init(randomNumber1))
        XCTAssertTrue(view.call == "updateDisplay - \(substractionOperator.toString())\(randomNumber1)")
        
        presenter.operatorClicked(additionOperator)
        XCTAssertTrue(view.call == "updateDisplay - \(substractionOperator.toString())\(randomNumber1)\(additionOperator.toString())")
        presenter.operatorClicked(additionOperator)
        XCTAssertTrue(view.call == "updateDisplay - \(substractionOperator.toString())\(randomNumber1)\(additionOperator.toString())")
        
        presenter.operatorClicked(substractionOperator)
        XCTAssertTrue(view.call == "updateDisplay - \(substractionOperator.toString())\(randomNumber1)\(substractionOperator.toString())")
        presenter.operatorClicked(additionOperator)
        XCTAssertTrue(view.call == "updateDisplay - \(substractionOperator.toString())\(randomNumber1)\(additionOperator.toString())")
    }
    
    func testEqualsClicked() {
        presenter.equalsClicked()
        XCTAssertTrue(interactor.call == "calculateResult - \(presenter.stack.toString())")
        
        for _ in 0...3 {
            presenter.operandClicked(Number.init(Int(arc4random_uniform(9))))
        }
        
        presenter.operatorClicked(AdditionOperator<Number>())
        
        for _ in 0...8 {
            presenter.operandClicked(Number.init(Int(arc4random_uniform(9))))
        }
        
        presenter.equalsClicked()
        
        XCTAssertTrue(interactor.call == "calculateResult - \(presenter.stack.toString())")
        
        for _ in 0...5 {
            presenter.operandClicked(Number.init(Int(arc4random_uniform(9))))
        }
        
        presenter.equalsClicked()
        
        XCTAssertTrue(interactor.call == "calculateResult - \(presenter.stack.toString())")
        
        presenter.operatorClicked(SubstractionOperator<Number>())
        
        for _ in 0...3 {
            presenter.operandClicked(Number.init(Int(arc4random_uniform(9))))
        }
        
        presenter.decimalClicked()
        
        for _ in 0...4 {
            presenter.operandClicked(Number.init(Int(arc4random_uniform(9))))
        }
        
        presenter.equalsClicked()
        
        XCTAssertTrue(interactor.call == "calculateResult - \(presenter.stack.toString())")

    }
    
    func testOperationResultSucces() {
        let resultNumber = Number.init(679698.24523544)
        presenter.operationResult(resultNumber)
        XCTAssertTrue(view.call == "updateDisplay - \(resultNumber.toString())")
    }
    
    func testOperationResultFailed() {
        presenter.operationResult(nil)
        XCTAssertTrue(view.call == "showError")
    }

}

