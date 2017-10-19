//
//  TableViewController.swift
//  Hardware
//
//  Created by Denis Golub on 10/10/2017.
//  Copyright © 2017 Hardware. All rights reserved.
//
import UIKit

var productDescriptions = ["Mayonnaise is Will's Favourite", "Nick loves milk", "Denis can never be sober as the hangover will kill him", "Alessio loves a bit of wine and pizza... dare you to find a more stereotypical Italian" ]

let product1 = Product(initialWeight: 50.0, name: "Mayonnaise", productDesc: productDescriptions[0])
let product2 = Product(initialWeight: 150.0, name: "Milk", productDesc: productDescriptions[1])
let product3 = Product(initialWeight: 100.0, name: "Hendricks", productDesc: productDescriptions[2])
let product4 = Product(initialWeight: 70.0, name: "Wine", productDesc: productDescriptions[3])

var productArray  : [Product] = [product1, product2, product3, product4]

var myIndex = 0

// MARK: - Table view data source
class ProductTableViewController: UITableViewController {
    
    func secondTimerHelper(timer: Timer) {
        var value = timer.userInfo as! Int
        productArray[value].updateWeight()
        self.tableView.reloadData()
    }
    
    var refreshWeightTimer = Timer()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return productArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        productArray[indexPath.row].updateWeight()
//
//        func productUpdate() {print(indexPath.row + 10)}
        refreshWeightTimer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(ProductTableViewController.secondTimerHelper), userInfo: indexPath.row, repeats: true)

        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        var percentageMeasure = String(Int(productArray[indexPath.row].currentWeight/productArray[indexPath.row].initialWeight*100))
        cell.textLabel?.text = productArray[indexPath.row].name + " " + percentageMeasure + "%"
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        myIndex = indexPath.row
        productArray[myIndex].updateWeight()
        performSegue(withIdentifier: "IndividualProductSegue", sender: self)
    }
    
//    func handleRefresh(refreshControl: UIRefreshControl) {
//        self.tableView.reloadData()
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.refreshControl?.addTarget(self, action: #selector(self.handleRefresh(_:)), for: UIControlEvents.valueChanged)
//    }
    
}
