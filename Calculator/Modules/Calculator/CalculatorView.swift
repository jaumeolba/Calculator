//
//  CalculatorView.swift
//  Calculator
//
//  Created by Jaume Ollés on 02/06/2017.
//  Copyright © 2017 Jolles. All rights reserved.
//

import UIKit

class CalculatorView: UIViewController, CalculatorViewProtocol {
    var presenter: CalculatorPresenterProtocol!
    
    @IBOutlet weak var displayView: UITextField!
    
    @IBOutlet weak var resultView: UITextField!
    @IBOutlet weak var keyboard: Keyboard!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keyboard.delegate = presenter
        displayView.isEnabled = false
        resultView.isEnabled = false
    }

}
