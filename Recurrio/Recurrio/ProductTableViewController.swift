//
//  TableViewController.swift
//  Hardware
//
//  Created by Denis Golub on 10/10/2017.
//  Copyright © 2017 Hardware. All rights reserved.
//
import UIKit

var productDescriptions = ["Hendrick's Gin is a brand of gin produced by William Grant & Sons in Girvan, Scotland, and launched in 1999.[2] In addition to the traditional juniper infusion, Hendrick's uses Bulgarian rose and cucumber to add flavour.", "Denis can never be sober as the hangover will kill him", "Alessio loves a bit of wine and pizza... dare you to find a more stereotypical Italian", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", ".." ]

var percentages = ["83", "24", "95", "45", "20", "10", "37", "46", "93", "12", "5", "66", "69", "50"]

let product1 = Product(initialWeight: 50.0, name: "Hendricks", productDesc: productDescriptions[0])
let product2 = Product(initialWeight: 150.0, name: "Tonic", productDesc: productDescriptions[1])
let product3 = Product(initialWeight: 100.0, name: "Cucumber", productDesc: productDescriptions[2])
let product4 = Product(initialWeight: 140.0, name: "Wine", productDesc: productDescriptions[3])
let product5 = Product(initialWeight: 90.0, name: "Orange Juice", productDesc: productDescriptions[4])
let product6 = Product(initialWeight: 90.0, name: "Human Foot", productDesc: productDescriptions[5])
let product7 = Product(initialWeight: 90.0, name: "Eggs", productDesc: productDescriptions[6])
let product8 = Product(initialWeight: 90.0, name: "Whipped Cream", productDesc: productDescriptions[7])
let product9 = Product(initialWeight: 70.0, name: "Strawberries", productDesc: productDescriptions[8])
let product10 = Product(initialWeight: 70.0, name: "Hummus", productDesc: productDescriptions[9])
let product11 = Product(initialWeight: 70.0, name: "Avocat", productDesc: productDescriptions[10])
let product12 = Product(initialWeight: 70.0, name: "Aperol", productDesc: productDescriptions[11])
let product13 = Product(initialWeight: 70.0, name: "Baba Ganoush", productDesc: productDescriptions[12])
let product14 = Product(initialWeight: 70.0, name: "Tzatziki", productDesc: productDescriptions[13])

var productArray  : [Product] = [product1, product2, product3, product4, product5, product6, product7, product8, product9, product10, product11, product12, product13, product14 ]

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
        if (indexPath.row == 0) {
        var percentageMeasure = String(Int(productArray[indexPath.row].currentWeight/productArray[indexPath.row].initialWeight*100))
        cell.textLabel?.text = productArray[indexPath.row].name + " " + percentageMeasure + "%"
            return cell;
        }
        else {
            cell.textLabel?.text = productArray[indexPath.row].name + " " + percentages[indexPath.row] + "%";
            return cell;
        }
        
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
