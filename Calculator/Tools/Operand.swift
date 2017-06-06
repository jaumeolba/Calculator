//
//  Operand.swift
//  Calculator
//
//  Created by Jaume Ollés on 02/06/2017.
//  Copyright © 2017 Jolles. All rights reserved.
//

import Foundation

protocol Operand: CalcElement {

    func append(_ operand: Operand)
    func startDecimal()
    func value() -> Float
}

class MyCalcNumber: Operand {

    
    var decimal: Bool = false
    var _value: Float = 0.0
    var numOfDecimals = 0
    
    init(_ value: Float) {
        self._value = value
    }
    
    func startDecimal() {
        self.decimal = true
    }
    
    func append(_ operand: Operand) {
        if decimal {
            var op = operand.value()
            var ten: Float = 1.0
            for _ in 0...numOfDecimals {
                ten = ten * 10.0
            }
            
            op.divide(by: Float(ten))
            _value.add(op)
            numOfDecimals += 1
        } else {
            _value.multiply(by: 10.0)
            _value.add(operand.value())
        }
    }
    
    func value() -> Float {
        return _value
    }

    func toString() -> String {
        return String.init(format: "%.\(numOfDecimals)f", _value)
    }
}
