//
//  CalculatorPresenter.swift
//  Calculator
//
//  Created by Jaume Ollés on 02/06/2017.
//  Copyright © 2017 Jolles. All rights reserved.
//

import Foundation

protocol CalculatorViewProtocol: class {
    var presenter: CalculatorPresenterProtocol! { get set }
    func updateDisplay(display: String)
}

protocol CalculatorPresenterProtocol: KeyboardDelegate {
    var view: CalculatorViewProtocol! { get set }
    var interactor: CalculatorInteractorProtocol! { get set }
    var router: CalculatorRouterProtocol! { get set }
}

class CalculatorPresenter: CalculatorPresenterProtocol {
    weak var view: CalculatorViewProtocol!
    var interactor: CalculatorInteractorProtocol!
    var router: CalculatorRouterProtocol!
    
    internal var stack = Stack<CalcElement>()
}

extension CalculatorPresenter: CalculatorInteractorDelegate {
    func operationResult(_ result: Number?) {
        if let result = result {
            view.updateDisplay(display: result.toString())
            stack.clear()
            stack.push(result)
        }
    }
}


extension CalculatorPresenter: KeyboardDelegate {
    
    func operandClicked(_ _operand: Operand) {
        if stack.peek() is Operand {
            if let operand = stack.pop() as? Number {
                operand.append(_operand)
                stack.push(operand)
            }
        } else if stack.peek() is Operator || stack.peek() == nil {
            stack.push(_operand)
        }
        view.updateDisplay(display: stack.toString())
    }
    
    func operatorClicked(_ _operator: Operator) {
        if stack.peek() is Operand {
            stack.push(_operator)
        } else if stack.peek() is Operator {
            _ = stack.pop()
            stack.push(_operator)
        } else if stack.peek() == nil {
            if _operator is SubstractionOperator<Number> {
                stack.push(_operator)
            }
        }
        view.updateDisplay(display: stack.toString())
    }
    
    func decimalClicked() {
        if stack.peek() is Operand {
            if let operand = stack.pop() as? Number {
                operand.startDecimal()
                stack.push(operand)
            }
        }
        view.updateDisplay(display: stack.toString())
    }
    
    func equalsClicked() {
        interactor.calculateResult(stack: stack)
    }
    
    func clearClicked() {
        stack.clear()
        view.updateDisplay(display: stack.toString())
    }
}

extension Stack: StringRepresentable {
    func toString() -> String {
        var display: String = ""
        
        for element in self.elements() {
            if let _element = element as? StringRepresentable {
                display.append(_element.toString())
            }
            
        }
        return display
    }
}
