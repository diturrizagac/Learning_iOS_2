//
//  AgregarFormmulaViewController.swift
//  Calculadora
//
//  Created by INTERN on 11/3/18.
//  Copyright © 2018 Belatrix. All rights reserved.
//

import UIKit
//INTERFACE = PROTOCOL
protocol  AgregarFormmulaViewControllerDelegate: NSObjectProtocol {
    func agregarFormmulaViewController(_ sender:AgregarFormmulaViewController, didSaveFormula formula: String )
}

class AgregarFormmulaViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var formulaTextField: UITextField!
    // weak si ya está creado, el delegado debe ser weak porque ya ha sido creado
    weak var delegate: AgregarFormmulaViewControllerDelegate? //es calculadora view controler
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func aceptarButtonTapped(_ sender: Any) {
        //TODO:guardar formula
        self.view.endEditing(true)
        let formula = formulaTextField.text!
        self.delegate?.agregarFormmulaViewController(self, didSaveFormula: formula)
    }
    
    @IBAction func cancelarButtonTapped(_ sender: Any) {
        //self.view.becomeFirstResponder()
        //self.formulaTextField.resignFirstResponder()
        self.view.endEditing(true)
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK - UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let cantidad = textField.text?.count
        let nuevosCantidad = string.count
        return (cantidad! + nuevosCantidad) < 15
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //TODO: guardar formula
        return true
    }
}
