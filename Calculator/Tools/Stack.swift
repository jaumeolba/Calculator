//
//  Stack.swift
//  Calculator
//
//  Created by Jaume Ollés on 02/06/2017.
//  Copyright © 2017 Jolles. All rights reserved.
//

import Foundation

enum Type {
    case LIFO, FIFO
}

class Stack<T> {
    var stackArray = [T]()
    
    var type: Type = .LIFO
    
    init() {
        
    }
    
    init(_ firstElement: T) {
        push(firstElement)
    }
    
    func push(_ element: T){
        self.stackArray.append(element)
    }
    
    func pop() -> T? {
        switch type {
        case .LIFO:
            if let lastValue = self.stackArray.last {
                self.stackArray.removeLast()
                return lastValue
            } else {
                return nil
            }
        case .FIFO:
            if let firtValue = self.stackArray.first {
                self.stackArray.removeFirst()
                return firtValue
            } else {
                return nil
            }
        }
        
    }
    
    func peek() -> T? {
        switch type {
        case .LIFO:
            if let lastValue = self.stackArray.last {
                return lastValue
            } else {
                return nil
            }
        case .FIFO:
            if let firtValue = self.stackArray.first {
                return firtValue
            } else {
                return nil
            }
        }
    }
    
    func clear() {
        stackArray.removeAll()
    }
    
    func elements() -> [T] {
        return stackArray
    }
}
