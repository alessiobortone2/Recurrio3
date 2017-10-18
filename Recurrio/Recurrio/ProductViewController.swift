//
//  ProductViewController.swift
//  Serial
//
//  Created by Will Porter on 16/10/2017.
//  Copyright © 2017 Balancing Rock. All rights reserved.
//

import UIKit
import LoginWithAmazon


class ProductViewController: UIViewController, AIAuthenticationDelegate {
    
    var productLevel = productArray[myIndex].currentWeight/productArray[myIndex].initialWeight

    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var ProductName: UILabel!
    @IBOutlet weak var Percentage: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var myImage: UIImageView!
    
    let lwa = LoginWithAmazonProxy.sharedInstance
    
    // MARK: Amazon login
    @IBAction func onClickLoginBtn(_ sender: Any) {
        lwa.login(delegate: self)
    }
    
    func requestDidSucceed(_ apiResult: APIResult) {
        
        switch(apiResult.api) {
        case API.authorizeUser:
            print("Authorized")
            lwa.getAccessToken(delegate: self)
        case API.getAccessToken:
            print("Login successfully!")
            loginBtn.isEnabled = false
        default:
            return
        }
    }
    
    func requestDidFail(_ errorResponse: APIError) {
        print("Error: \(errorResponse.error.message)")
    }
    
    
    // MARK: Bluetooth Activated
    @IBAction func DecreaseButton(_ sender: Any) {
        productArray[myIndex].currentWeight -= 5
        productLevel = productArray[myIndex].currentWeight/productArray[myIndex].initialWeight
        progressBar.setProgress(productLevel, animated: false)
        Percentage.text = String(Int(productLevel*100)) + "%"
    }
    
    
    // MARK: Product Description
    @IBOutlet weak var ProductDescription: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ProductName.text = productArray[myIndex].name
        Percentage.text = (String(Int(productLevel*100)) + "%")
        ProductDescription.text = productArray[myIndex].productDesc
        myImage.image = UIImage(named: productArray[myIndex].name)
        progressBar.setProgress(productLevel, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
