//
//  Router.swift
//  Calculator
//
//  Created by Jaume Ollés on 02/06/2017.
//  Copyright © 2017 Jolles. All rights reserved.
//

import UIKit

protocol RouterProtocol: class {
    weak var view: CalculatorViewProtocol? { get set }
    func show(window: UIWindow?)
}

extension RouterProtocol {
    func show(window: UIWindow?) {
        guard window != nil, let _view = view as? UIViewController else {
            return
        }
        window?.rootViewController = _view
    }
}
