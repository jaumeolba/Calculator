//
//  CalculatorStub.swift
//  Calculator
//
//  Created by Jaume Ollés Barberán on 10/6/17.
//  Copyright © 2017 Jolles. All rights reserved.
//

import Foundation
@testable import Calculator

class CalculatorViewMock: CalculatorView {
    
    var call = ""
    
    override func updateDisplay(display: String) {
        if display.isEmpty {
            call = "updateDisplay - EMPTY"
        } else {
            call = "updateDisplay - \(display)"
        }
    }
    
    override func showError() {
        call = "showError"
    }
}

class CalculatorInteractorDelegateMock: CalculatorInteractorDelegate {
    
    var call = ""
    
    func operationResult(_ result: Number?) {
        call = "operationResult - \(result)"
    }
    
}

class CalculatorInteractorMock: CalculatorInteractorProtocol {
    
    var call = ""
    
    var presenter: CalculatorInteractorDelegate!
    
    func calculateResult(stack: Stack<CalcElement>) {
        call = "calculateResult - \(stack.toString())"
    }

}
