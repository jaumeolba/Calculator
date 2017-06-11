//
//  CalculatorView.swift
//  Calculator
//
//  Created by Jaume Ollés on 10/06/2017.
//  Copyright © 2017 Jolles. All rights reserved.
//

import UIKit

class CalculatorView: UIViewController, CalculatorViewProtocol {
    var presenter: CalculatorPresenterProtocol!
    
    @IBOutlet weak var displayView: UITextField!
    @IBOutlet weak var keyboard: Keyboard!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keyboard.delegate = presenter
        displayView.isEnabled = false
    }

    func updateDisplay(display: String) {
        displayView.text = display
    }
    
    func showError() {
        let alert = UIAlertController(title: nil, message: "There was an error performing the calculation", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}
