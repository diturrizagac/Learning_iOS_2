//
//  PaisesViewController.swift
//  Calculadora
//
//  Created by INTERN on 11/3/18.
//  Copyright © 2018 Belatrix. All rights reserved.
//

import UIKit

class PaisesViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var paises: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        paises = ["peru", "brazil", "bolivia", "argentina", "ecuador"]
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        if section == 1 {
            return 2
        }
        return paises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "paisCell", for: indexPath)
        let i = indexPath.row
        cell.textLabel?.text = paises[i]
        return cell
    }

}
