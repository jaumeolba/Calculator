//
//  Keyboard.swift
//  Calc
//
//  Created by Jaume Ollés on 29/05/2017.
//  Copyright © 2017 Zinio. All rights reserved.
//

import UIKit

enum KeyboardKey: String {
    
    case number1 = "1"
    case number2 = "2"
    case number3 = "3"
    case number4 = "4"
    case number5 = "5"
    case number6 = "6"
    case number7 = "7"
    case number8 = "8"
    case number9 = "9"
    case number0 = "0"
    case addition = "+"
    case substraction = "-"
    
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

protocol KeyboardDelegate {
    func operandClicked(_ _operand: Operand)
    func operatorClicked(_ _operator: Operator)
    func decimalClicked()
    func equalsClicked()
    func clearClicked()
}

class Keyboard: UIView {
    
    var delegate: KeyboardDelegate?
    
    @IBAction func decimalClicked(_ sender: UIButton) {
        delegate?.decimalClicked()
    }
    
    @IBAction func operandClicked(_ sender: UIButton) {
        guard let buttonText = sender.titleLabel?.text,  let operand = KeyboardKey.init(rawValue: buttonText)?.element as? Operand else {
            return
        }
        delegate?.operandClicked(operand)
    }
    
    @IBAction func operatorClicked(_ sender: UIButton) {
        guard let buttonText = sender.titleLabel?.text,  let _operator = KeyboardKey.init(rawValue: buttonText)?.element as? Operator else {
            return
        }
        delegate?.operatorClicked(_operator)
    }
    
    @IBAction func equalsClicked(_ sender: UIButton) {
        delegate?.equalsClicked()
    }

    @IBAction func clearClicked(_ sender: UIButton) {
        delegate?.clearClicked()
    }
}
