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
}

protocol CalculatorPresenterProtocol: class {
    var view: CalculatorViewProtocol! { get set }
    var interactor: CalculatorInteractorProtocol! { get set }
    var router: CalculatorRouterProtocol! { get set }
}

class CalculatorPresenter: CalculatorPresenterProtocol, CalculatorInteractorDelegate {
    weak var view: CalculatorViewProtocol!
    var interactor: CalculatorInteractorProtocol!
    var router: CalculatorRouterProtocol!
}
