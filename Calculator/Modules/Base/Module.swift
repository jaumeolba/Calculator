//
//  Module.swift
//  Calculator
//
//  Created by Jaume Ollés on 02/06/2017.
//  Copyright © 2017 Jolles. All rights reserved.
//

import Foundation

protocol ModuleProtocol {
    static var storyBoardName: String { get }
    static var viewName: String { get }
    
    static func build() -> RouterProtocol?
}

enum Module {
    case Calculator
}

class ModuleBuilder {
    
    static func build(module: Module) -> RouterProtocol? {
        switch module {
        case .Calculator:
            return CalculatorModule.build()
        default:
            return nil
        }
    }
}
