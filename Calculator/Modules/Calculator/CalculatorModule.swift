//
//  CalculatorModule.swift
//  Calculator
//
//  Created by Jaume Ollés on 10/06/2017.
//  Copyright © 2017 Jolles. All rights reserved.
//

import UIKit

class CalculatorModule: ModuleProtocol {
    
    static let storyBoardName: String = "Calculator"
    static let viewName: String = "CalculatorView"
    
    static func build() -> RouterProtocol? {
        
        guard let view = CalculatorModule.getView() else {
            return nil
        }
        
        let interactor = CalculatorInteractor()
        let presenter = CalculatorPresenter()
        let router = CalculatorRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.view = view
        return router
    }
    
    private static func getView() -> CalculatorView? {
        return UIStoryboard.init(name: CalculatorModule.storyBoardName, bundle: .main).instantiateViewController(withIdentifier: CalculatorModule.viewName) as? CalculatorView
    }
}
