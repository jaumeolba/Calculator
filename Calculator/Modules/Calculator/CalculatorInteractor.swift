//
//  CalculatorInteractor.swift
//  Calculator
//
//  Created by Jaume Ollés on 02/06/2017.
//  Copyright © 2017 Jolles. All rights reserved.
//

import Foundation

protocol CalculatorInteractorProtocol: class {
    var presenter: CalculatorInteractorDelegate! { get set }
    
    func calculateResult(stack: Stack<CalcElement>)
}

protocol CalculatorInteractorDelegate: class {
    func operationResult(_ result: Number?)
}

class CalculatorInteractor: CalculatorInteractorProtocol {
    weak var presenter: CalculatorInteractorDelegate!
    
    private var output = Stack<CalcElement>()
    private var tempStack = Stack<CalcElement>()
    
    func calculateResult(stack: Stack<CalcElement>) {
        
        if stack.elements().first is Operator {
            stack.insertAsFirst(Number.init(0.0))
        } else if stack.elements().last is Operator {
            _ = stack.pop()
        }
        
        stack.reverse()
        
        output.clear()
        tempStack.clear()
        
        while stack.peek() != nil {
            if let element = stack.pop() {
                if let operand = element as? Operand {
                    processOperand(operand)
                } else if let _operator = element as? Operator {
                    while processOperator(_operator) {}
                } else {
                    
                }
            } else {
                break
            }
        }
        
        emptyTempStack()
        
        presenter.operationResult(performCalculation(output))
        
    }
    
    private func processOperand(_ operand: Operand) {
        output.push(operand)
    }
    
    private func processOperator(_ _operator: Operator) -> Bool {
        if let tempStackElem = tempStack.peek(){
            if tempStackElem is Operator {
                if let lastStackElement = tempStack.pop() {
                    output.push(lastStackElement)
                }
                //Continue process
                return true
            } else {
                tempStack.push(tempStackElem)
                //Finished process
                return false
            }
        } else {
            tempStack.push(_operator)
            //Finished process
            return false
        }
    }
    
    private func emptyTempStack() {
        while tempStack.elements().count > 0 {
            if let element = tempStack.pop() {
                output.push(element)
            }
        }
    }
    
    private func performCalculation(_ output: Stack<CalcElement>) -> Number? {
        
        var result = Stack<CalcElement>()
        
        output.type = .FIFO
        
        while output.peek() != nil {
            if let element = output.pop() {
                if element is Operand {
                    result.push(element)
                } else if let _operator = element as? Operator {
                    if let secondOperand = result.pop() as? Operand,
                        let firstOperand = result.pop() as? Operand {
                    let operandResult = _operator.calculate(firstOperand: firstOperand, secondOperand: secondOperand)
                        result.push(operandResult)
                    } else {
                        break
                    }
                }
            } else {
                break
            }
        }
        
        if let finalResult = result.pop() as? Number {
            return finalResult
        }
        return nil
    }
}
