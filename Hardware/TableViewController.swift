//
//  TableViewController.swift
//  Hardware
//
//  Created by Denis Golub on 10/10/2017.
//  Copyright © 2017 Hardware. All rights reserved.
//

import UIKit

var pets = ["Mayonnaise", "Milk", "Hendricks", "Wine"]
var petDesc = ["Mayonnaise is Will's Favourite", "Nick loves milk", "Denis can never be sober as the hangover will kill him", "Alessio loves a bit of wine and pizza... dare you to find a more stereotypical Italian" ]
var percentage = ["33 %", "21 %", "10 %", "48 %"]
var myIndex = 0

class TableViewController: UITableViewController {


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = pets[indexPath.row] + percentage[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        myIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }
    

}
