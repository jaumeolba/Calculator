//
//  Operator.swift
//  Calc
//
//  Created by Jaume Ollés on 10/06/2017.
//  Copyright © 2017 Jolles. All rights reserved.
//

import Foundation

protocol Operator: CalcElement {
    
    func calculate(firstOperand: Operand, secondOperand: Operand) -> Operand?
}
