//
//  StackTests.swift
//  Calculator
//
//  Created by Jaume Ollés Barberán on 11/06/17.
//  Copyright © 2017 Jolles. All rights reserved.
//

import XCTest
@testable import Calculator

class StackTests: XCTestCase {
    
    var stack: Stack<String>!

    override func setUp() {
        super.setUp()
        stack = Stack<String>()
    }
    
    override func tearDown() {
        super.tearDown()
        stack.clear()
    }
    
    //MARK: LIFO
    
    func testPushLIFO() {
        stack.type = .LIFO
        
        XCTAssertTrue(stack.elements().count == 0)
        
        for i in 1...10 {
            stack.push("Element #\(i)")
            XCTAssertTrue(stack.elements().count == i)
            XCTAssertTrue(stack.peek() == "Element #\(i)")
        }
    }
    
    func testPopLIFO() {
        stack.type = .LIFO
        
        XCTAssertTrue(stack.elements().count == 0)
        
        let numberOfPushes = 10
        
        for i in 1...numberOfPushes {
            stack.push("Element #\(i)")
        }
        
        for i in 0...numberOfPushes - 1 {
            XCTAssertTrue(stack.pop() == "Element #\(numberOfPushes - i)")
        }
    }
    
    //MARK: FIFO
    
    func testPushFIFO() {
        stack.type = .FIFO
        
        XCTAssertTrue(stack.elements().count == 0)
        
        for i in 1...10 {
            stack.push("Element #\(i)")
            XCTAssertTrue(stack.elements().count == i)
            XCTAssertTrue(stack.peek() == "Element #1")
        }
    }
    
    func testPopFIFO() {
        stack.type = .FIFO
        
        XCTAssertTrue(stack.elements().count == 0)
        
        let numberOfPushes = 10
        
        for i in 1...numberOfPushes {
            stack.push("Element #\(i)")
        }
        
        for i in 1...numberOfPushes {
            XCTAssertTrue(stack.pop() == "Element #\(i)")
        }
    }
    
    
}
