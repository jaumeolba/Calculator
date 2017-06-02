//
//  Keyboard.swift
//  Calc
//
//  Created by Jaume Ollés on 29/05/2017.
//  Copyright © 2017 Zinio. All rights reserved.
//

import UIKit

protocol StringRepresentable {
    func toString() -> String
}

protocol CalcElement: StringRepresentable {
    
}

extension Float: CalcElement {
    
}

extension AdditionOperator: CalcElement {
    
}

extension SubstractionOperator: CalcElement {
    
}

class Decimal: CalcElement {
    func toString() -> String {
        return "."
    }
}

class Equals: CalcElement {
    func toString() -> String {
        return "="
    }
}

class Clear: CalcElement {
    func toString() -> String {
        return "C"
    }
}

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
    case decimal = "."
    case equals = "="
    case clear = "CLEAR"
    
    var element: CalcElement {
        get {
            switch self {
            case .number0:
                return Float.init(0.0)
            case .number1:
                return Float.init(1.0)
            case .number2:
                return Float.init(2.0)
            case .number3:
                return Float.init(3.0)
            case .number4:
                return Float.init(4.0)
            case .number5:
                return Float.init(5.0)
            case .number6:
                return Float.init(6.0)
            case .number7:
                return Float.init(7.0)
            case .number8:
                return Float.init(8.0)
            case .number9:
                return Float.init(9.0)
            case .addition:
                return AdditionOperator()
            case .substraction:
                return SubstractionOperator()
            case .decimal:
                return Decimal()
            case .equals:
                return Equals()
            case .clear:
                return Clear()
            }
        }
    }
}

protocol KeyboardDelegate {
    func keyClicked(element: CalcElement)
}

class Keyboard: UIView {
    
    var delegate: KeyboardDelegate?
    
    @IBAction func keyClicked(_ sender: Any) {
        guard let buttonText = (sender as? UIButton)?.titleLabel?.text,  let keyboardKey = KeyboardKey.init(rawValue: buttonText) else {
            return
        }
        delegate?.keyClicked(element: keyboardKey.element)
    }
}
