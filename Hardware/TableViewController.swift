//
//  TableViewController.swift
//  Hardware
//
//  Created by Denis Golub on 10/10/2017.
//  Copyright © 2017 Hardware. All rights reserved.
//

import UIKit

class Product {
    let name: String
    let initialWeight: Float
    var currentWeight: Float
    init(initialWeight: Float, name: String) {
        self.initialWeight = initialWeight
        self.name = name
        self.currentWeight = initialWeight
    }
    
    func updateWeight(weight: Float) {
        self.currentWeight = weight
    }
    
}

let initialWeight: Float = 50.0
var currentWeight: Float = 45.0
var product = ["Mayonnaise", "Milk", "Hendricks", "Wine"]
var productDesc = ["Mayonnaise is Will's Favourite", "Nick loves milk", "Denis can never be sober as the hangover will kill him", "Alessio loves a bit of wine and pizza... dare you to find a more stereotypical Italian" ]
var percentage = ["33 %", "21 %", "10 %", "48 %"]
var myIndex = 0

class TableViewController: UITableViewController {


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return product.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = product[indexPath.row] + " " + percentage[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        myIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }
    

}
