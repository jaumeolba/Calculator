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
    init(_ value: Int)
    func append(_ operand: Operand)
    func startDecimal()
    func value() -> Double?
}

class Number: Operand {
    
    var decimal: Bool = false
    var numOfDecimals = 0
    
    var _valueInString: String
    
    required init(_ value: Double) {
        _valueInString = String(value)
    }
    
    required init(_ value: Int) {
        _valueInString = String(value)
    }
    
    func startDecimal() {
        if _valueInString.characters.count > 0{
            if !_valueInString.contains(".") {
                _valueInString.append(".")
            }
        } else {
            _valueInString.append("0.")
        }
    }
    
    func append(_ operand: Operand) {
        _valueInString.append(operand.toString())
    }
    
    func value() -> Double? {
        return Double.init(_valueInString)
    }

    func toString() -> String {
        return _valueInString
    }
}
