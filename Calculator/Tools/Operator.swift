//
//  Operator.swift
//  Calc
//
//  Created by Jaume Ollés on 31/05/2017.
//  Copyright © 2017 Zinio. All rights reserved.
//

import Foundation

protocol Operator: CalcElement {
    
    func calculate(firstOperand: Operand, secondOperand: Operand) -> Operand
}

class AdditionOperator<T: Operand>: Operator {
    
    private let stringValue = "+"
    
    func calculate(firstOperand: Operand, secondOperand: Operand) -> Operand {
        let result = firstOperand.value() + secondOperand.value()
        return T.init(result)
    }
    
    func toString() -> String {
        return stringValue
    }
}

class SubstractionOperator<T: Operand>: Operator {
    
    private let stringValue = "-"
    
    func calculate(firstOperand: Operand, secondOperand: Operand) -> Operand {
        let result = firstOperand.value() - secondOperand.value()
        return T.init(result)
    }
    
    func toString() -> String {
        return stringValue
    }
}
