//
//  Operator.swift
//  Calc
//
//  Created by Jaume Ollés on 31/05/2017.
//  Copyright © 2017 Zinio. All rights reserved.
//

import Foundation

class AdditionOperator<T: Operand>: Operator {
    
    private let stringValue = "+"
    
    func calculate(firstOperand: Operand, secondOperand: Operand) -> Operand? {
        guard let op1 = firstOperand.value(), let op2 = secondOperand.value() else {
            return nil
        }
        let result = op1 + op2
        return T.init(result)
    }
    
    func toString() -> String {
        return stringValue
    }
}

class SubstractionOperator<T: Operand>: Operator {
    
    private let stringValue = "-"
    
    func calculate(firstOperand: Operand, secondOperand: Operand) -> Operand? {
        guard let op1 = firstOperand.value(), let op2 = secondOperand.value() else {
            return nil
        }
        let result = op1 - op2
        return T.init(result)
    }
    
    func toString() -> String {
        return stringValue
    }
}
