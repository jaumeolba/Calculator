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
}

protocol CalculatorInteractorDelegate: class {
    
}

class CalculatorInteractor: CalculatorInteractorProtocol {
    weak var presenter: CalculatorInteractorDelegate!
}
