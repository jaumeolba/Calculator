//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Jaume Ollés on 02/06/2017.
//  Copyright © 2017 Jolles. All rights reserved.
//

import XCTest
@testable import Calculator

class CalculatorInteractorTests: XCTestCase {
    
    var presenter: CalculatorInteractorDelegateMock!
    var interactor: CalculatorInteractor!
    
    override func setUp() {
        super.setUp()
        presenter = CalculatorInteractorDelegateMock()
        interactor = CalculatorInteractor()
        
        interactor.presenter = presenter
    }
    
    override func tearDown() {
        super.tearDown()
        presenter.call = ""
    }
    
    func testCalculateResultFailed() {
        let stack = Stack<CalcElement>()
        interactor.calculateResult(stack: stack)
        XCTAssertTrue(presenter.call.isEmpty)
        
        stack.push(AdditionOperator<Number>())
        interactor.calculateResult(stack: stack)
        XCTAssertTrue(presenter.call.isEmpty)
        
        stack.push(Number.init(6))
        interactor.calculateResult(stack: stack)
        XCTAssertTrue(presenter.call == "operationResult - 6")
        
        stack.push(Number.init(6))
        stack.push(SubstractionOperator<Number>())
        stack.push(Number.init(5.5))
        interactor.calculateResult(stack: stack)
        XCTAssertTrue(presenter.call == "operationResult - 0.5")
        
        stack.push(Number.init(6))
        stack.push(SubstractionOperator<Number>())
        stack.push(Number.init(5.5))
        stack.push(SubstractionOperator<Number>())
        stack.push(Number.init(25))
        interactor.calculateResult(stack: stack)
        XCTAssertTrue(presenter.call == "operationResult - -24.5")
    }
}
