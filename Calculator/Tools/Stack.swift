//
//  Stack.swift
//  Calculator
//
//  Created by Jaume Ollés on 02/06/2017.
//  Copyright © 2017 Jolles. All rights reserved.
//

import Foundation

class Stack<T> {
    var stackArray = [T]()
    
    func push(_ element: T){
        self.stackArray.append(element)
    }
    
    func pop() -> T? {
        if let lastValue = self.stackArray.last {
            self.stackArray.removeLast()
            return lastValue
        } else {
            return nil
        }
    }
    
    func peek() -> T? {
        if let lastValue = self.stackArray.last {
            return lastValue
        } else {
            return nil
        }
    }
    
    func clear() {
        stackArray.removeAll()
    }
    
    func elements() -> [T] {
        return stackArray
    }
}
