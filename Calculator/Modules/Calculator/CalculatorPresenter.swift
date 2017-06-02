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

class CalculatorPresenter: CalculatorPresenterProtocol, CalculatorInteractorDelegate {
    weak var view: CalculatorViewProtocol!
    var interactor: CalculatorInteractorProtocol!
    var router: CalculatorRouterProtocol!
    
    internal var stack = Stack<CalcElement>()
}


extension CalculatorPresenter: KeyboardDelegate {
    
    func keyClicked(element: CalcElement) {
        if let newElement = element as? Float {
            if stack.peek() is Operand {
                var operand = stack.pop() as? Float
                if operand != nil {
                    operand!.append(newElement)
                    stack.push(operand!)
                }
            } else if stack.peek() is Operator || stack.peek() == nil {
                stack.push(newElement)
            }
        } else if element is Operator {
            if stack.peek() is Operand {
                stack.push(element)
            } else if stack.peek() is Operator {
                _ = stack.pop()
                stack.push(element)
            } else if stack.peek() == nil {
                if element is SubstractionOperator {
                    stack.push(element)
                }
            }
        } else if element is Decimal {
            
        } else if element is Clear {
            stack.clear()
        } else if element is Equals {
            interactor.calculateResult(stack: stack)
            return
        }
        
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
