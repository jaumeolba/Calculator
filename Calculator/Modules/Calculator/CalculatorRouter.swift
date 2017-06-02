//
//  CalculatorRouter.swift
//  Calculator
//
//  Created by Jaume Ollés on 02/06/2017.
//  Copyright © 2017 Jolles. All rights reserved.
//

import Foundation

protocol CalculatorRouterProtocol: RouterProtocol {
    
}

class CalculatorRouter: CalculatorRouterProtocol {
    var view: CalculatorViewProtocol?
}
