//
//  Operator.swift
//  Calc
//
//  Created by Jaume Ollés on 31/05/2017.
//  Copyright © 2017 Zinio. All rights reserved.
//

import Foundation

protocol Operator: CalcElement {
    
    func calculate(firstOperand: Operand, secondOperand: Operand) -> Float
}

class AdditionOperator: Operator {
    
    private let stringValue = "+"
    
    func calculate(firstOperand: Operand, secondOperand: Operand) -> Float {
        var op1 = firstOperand
        var op2 = secondOperand
        return op1.value() + op2.value()
    }
    
    func toString() -> String {
        return stringValue
    }
}

class SubstractionOperator: Operator {
    
    private let stringValue = "-"
    
    func calculate(firstOperand: Operand, secondOperand: Operand) -> Float {
        var op1 = firstOperand
        var op2 = secondOperand
        return op1.value() - op2.value()
    }
    
    func toString() -> String {
        return stringValue
    }
}
