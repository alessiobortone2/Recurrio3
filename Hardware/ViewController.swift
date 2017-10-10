//
//  ViewController.swift
//  Hardware
//
//  Created by Alessio Bortone on 09/10/2017.
//  Copyright © 2017 Hardware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var h2Label: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        titleLabel.text = pets[myIndex]
        h2Label.text = percentage[myIndex]
        descLabel.text = petDesc[myIndex]
        myImageView.image = UIImage(named: pets[myIndex])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

