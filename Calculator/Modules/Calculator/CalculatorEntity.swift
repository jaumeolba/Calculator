//
//  CalculatorEntity.swift
//  Calculator
//
//  Created by Jaume Ollés on 02/06/2017.
//  Copyright © 2017 Jolles. All rights reserved.
//

import Foundation

protocol Operator: CalcElement {
    
    func calculate(firstOperand: Operand, secondOperand: Operand) -> Operand?
}

protocol Operand: CalcElement {
    
    init(_ value: Double)
    init(_ value: Int)
    func append(_ operand: Operand)
    func startDecimal()
    func value() -> Double?
}

protocol StringRepresentable {
    func toString() -> String
}

protocol CalcElement: StringRepresentable {
    
}
