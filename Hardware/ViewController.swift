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
    var productLevel = currentWeight/initialWeight
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBAction func startButton(_ sender: Any) {
        currentWeight -= 5
        productLevel = currentWeight/initialWeight
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
        titleLabel.text = product[myIndex]
        h2Label.text = (String(Int(productLevel*100)) + "%")
        descLabel.text = productDesc[myIndex]
        myImageView.image = UIImage(named: product[myIndex])
        progressBar.setProgress(productLevel, animated: false)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

