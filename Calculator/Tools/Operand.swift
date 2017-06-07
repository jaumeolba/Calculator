//
//  Operand.swift
//  Calculator
//
//  Created by Jaume Ollés on 02/06/2017.
//  Copyright © 2017 Jolles. All rights reserved.
//

import Foundation

protocol Operand: CalcElement {

    init(_ value: Double)
    func append(_ operand: Operand)
    func startDecimal()
    func value() -> Double
}

class Number: Operand {
    
    var decimal: Bool = false
    var _value: Double = 0.0
    var numOfDecimals = 0
    
    required init(_ value: Double) {
        self._value = value
    }
    
    func startDecimal() {
        self.decimal = true
    }
    
    func append(_ operand: Operand) {
        if decimal {
            var op = operand.value()
            var ten: Double = 1.0
            for _ in 0...numOfDecimals {
                ten = ten * 10.0
            }
            
            op.divide(by: Double(ten))
            if _value < 0 {
                _value.subtract(op)
            } else {
                _value.add(op)
            }
            numOfDecimals += 1
        } else {
            _value.multiply(by: 10.0)
            if _value < 0 {
                _value.subtract(operand.value())
            } else {
                _value.add(operand.value())
            }
        }
    }
    
    func value() -> Double {
        return _value
    }

    func toString() -> String {
        return String.init(format: "%.\(numOfDecimals)f", _value)
    }
}
