//
//  ViewController.swift
//  Hardware
//
//  Created by Alessio Bortone on 09/10/2017.
//  Copyright © 2017 Hardware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
//    didSet {
//    }
    var productLevel = productArray[myIndex].currentWeight/productArray[myIndex].initialWeight
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBAction func startButton(_ sender: Any) {
        productArray[myIndex].currentWeight -= 5
        productLevel = productArray[myIndex].currentWeight/productArray[myIndex].initialWeight
        progressBar.setProgress(productLevel, animated: false)
        h2Label.text = String(Int(productLevel*100)) + "%"
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var h2Label: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        titleLabel.text = productArray[myIndex].name
        h2Label.text = (String(Int(productLevel*100)) + "%")
        descLabel.text = productArray[myIndex].productDesc
        myImageView.image = UIImage(named: productArray[myIndex].name)
        progressBar.setProgress(productLevel, animated: false)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

