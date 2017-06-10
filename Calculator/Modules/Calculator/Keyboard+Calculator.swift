//
//  Keyboard+Number.swift
//  Calculator
//
//  Created by Jaume Ollés Barberán on 10/6/17.
//  Copyright © 2017 Jolles. All rights reserved.
//

import Foundation

extension KeyboardKey {
    var element: CalcElement {
        get {
            switch self {
            case .number0:
                return Number.init(0)
            case .number1:
                return Number.init(1)
            case .number2:
                return Number.init(2)
            case .number3:
                return Number.init(3)
            case .number4:
                return Number.init(4)
            case .number5:
                return Number.init(5)
            case .number6:
                return Number.init(6)
            case .number7:
                return Number.init(7)
            case .number8:
                return Number.init(8)
            case .number9:
                return Number.init(9)
            case .addition:
                return AdditionOperator<Number>()
            case .substraction:
                return SubstractionOperator<Number>()
            }
        }
    }
}
