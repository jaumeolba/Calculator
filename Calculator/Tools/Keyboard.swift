//
//  Keyboard.swift
//  Calc
//
//  Created by Jaume Ollés on 10/06/2017.
//  Copyright © 2017 Jolles. All rights reserved.
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
