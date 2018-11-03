//
//  CalculadoraViewController.swift
//  Calculadora
//
//  Created by Arturo Gamarra on 10/27/18.
//  Copyright © 2018 Belatrix. All rights reserved.
//

import UIKit

class CalculadoraViewController: UIViewController, AgregarFormmulaViewControllerDelegate {
    func agregarFormmulaViewController(_ sender: AgregarFormmulaViewController, didSaveFormula formula: String) {
            print(formula)
            self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBOutlet weak var resultadoLabel: UILabel!
    var operacion:String = ""
    var oldNumber:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        resultadoLabel.text = ""
    }

    @IBAction func button9Tapped(_ sender: UIButton) {
        print(sender.titleLabel!.text!)
        
        let numero = sender.titleLabel!.text!
        let numeroActual = resultadoLabel.text!
        var resutado = numeroActual + numero
        resutado += ""
        resultadoLabel.text = resutado
    }
    
    @IBAction func plusButtonTapped(_ sender: UIButton) {
        self.operacion = sender.titleLabel!.text!
        self.oldNumber = resultadoLabel.text!
        self.resultadoLabel.text = ""
    }
    
    @IBAction func equalButtonTapped(_ sender: UIButton) {
        switch operacion {
        case "+":
            let old = Int(self.oldNumber)!
            let actual = Int(resultadoLabel.text!)!
            let resultado = old + actual
            self.resultadoLabel.text = "\(resultado)"
        default:
            print("Operacion no soportada")
        }
    }
    //MARK: Navegacion
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AgregarFormulaSegue" {
            let destinoViewController = segue.destination
            let navController = destinoViewController as! UINavigationController
            let agregarVC = navController.viewControllers.first! as! AgregarFormmulaViewController
            agregarVC.delegate = self
        
        }
        
    }
    
}
