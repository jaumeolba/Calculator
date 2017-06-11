//
//  Operand.swift
//  Calculator
//
//  Created by Jaume Ollés on 10/06/2017.
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
