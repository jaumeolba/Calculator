//
//  CalculatorInteractor.swift
//  Calculator
//
//  Created by Jaume Ollés on 10/06/2017.
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
        
        let localStack = stack
        
        guard localStack.elements().count > 0, localStack.peek() is Operand else {
            return
        }
        
        if localStack.elements().first is Operator {
            localStack.insertAsFirst(Number.init(0))
        } else if localStack.elements().last is Operator {
            _ = localStack.pop()
        }
        
        localStack.reverse()
        
        output.clear()
        tempStack.clear()
        
        while localStack.peek() != nil {
            if let element = localStack.pop() {
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
        
        let result = Stack<CalcElement>()
        
        output.type = .FIFO
        
        while output.peek() != nil {
            if let element = output.pop() {
                if element is Operand {
                    result.push(element)
                } else if let _operator = element as? Operator {
                    if let secondOperand = result.pop() as? Operand,
                        let firstOperand = result.pop() as? Operand {
                        guard let operandResult = _operator.calculate(firstOperand: firstOperand, secondOperand: secondOperand) else {
                            return nil
                        }
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
            if let doubleValue = finalResult.value(), floor(doubleValue) == doubleValue {
                return Number.init(Int(doubleValue))
            } else {
                return finalResult
            }
        }
        return nil
    }
}
