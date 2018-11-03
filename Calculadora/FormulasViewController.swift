//
//  FormulasViewController.swift
//  Calculadora
//
//  Created by INTERN on 11/3/18.
//  Copyright © 2018 Belatrix. All rights reserved.
//

import UIKit

class FormulasViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var formulas: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formulas = ["y = 3x+4", "y = x + 3", "x2 + y2 = z2"]

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return formulas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "formulaCell", for: indexPath)
        let i = indexPath.row
        cell.textLabel?.text = formulas[i]
        return cell
    }
    
}
