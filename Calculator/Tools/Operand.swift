//
//  Operand.swift
//  Calculator
//
//  Created by Jaume Ollés on 02/06/2017.
//  Copyright © 2017 Jolles. All rights reserved.
//

import Foundation

protocol Operand: CalcElement {

    mutating func append(_ operand: Operand)
    mutating func value() -> Float
}

extension Float: Operand {
    
    mutating func append(_ operand: Operand) {
        var op = operand
        multiply(by: 10.0)
        add(op.value())
    }
    
    func value() -> Float {
        return self
    }
    
    func toString() -> String {
        return String.init(format: "%f", self)
    }
}
