//
//  Operator.swift
//  Calc
//
//  Created by Jaume Ollés on 31/05/2017.
//  Copyright © 2017 Zinio. All rights reserved.
//

import Foundation

protocol Operator: CalcElement {
    
    func calculate(firstOperand: Operand, secondOperand: Operand) -> Operand?
}
