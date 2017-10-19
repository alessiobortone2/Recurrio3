//
//  SerialViewController.swift
//  HM10 Serial
//
//  Created by Alex on 10-08-15.
//  Copyright (c) 2015 Balancing Rock. All rights reserved.
//

import UIKit
import CoreBluetooth
import QuartzCore


// MARK: - Table view data source

var weightData = [Float]();

final class SerialViewController: UIViewController, UITextFieldDelegate,  BluetoothSerialDelegate {
    

    //MARK: IBOutlets
    
    @IBOutlet weak var mainTextView: UITextView!
    @IBOutlet weak var barButton: UIBarButtonItem!
    @IBOutlet weak var navItem: UINavigationItem!
    @IBOutlet weak var HomeImage: UIImageView!
    
    
    //MARK: Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // init serial
        serial = BluetoothSerial(delegate: self)
        
        // UI
        reloadView()
        HomeImage.image = UIImage(named: "logo")
        
        NotificationCenter.default.addObserver(self, selector: #selector(SerialViewController.reloadView), name: NSNotification.Name(rawValue: "reloadStartViewController"), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    func reloadView() {
        // in case we're the visible view again
        serial.delegate = self
        
        if serial.isReady {
            navItem.title = "Welcome to your Fridge!"
            barButton.title = "Disconnect"
            barButton.tintColor = UIColor.red
            barButton.isEnabled = true
        } else if serial.centralManager.state == .poweredOn {
            navItem.title = "Welcome"
            barButton.title = "Connect"
            barButton.tintColor = view.tintColor
            barButton.isEnabled = true
        } else {
            navItem.title = "Connect to your Fridge"
            barButton.title = "Connect"
            barButton.tintColor = view.tintColor
            barButton.isEnabled = false
        }
    }
    
    func textViewScrollToBottom() {
        let range = NSMakeRange(NSString(string: mainTextView.text).length - 1, 1)
        mainTextView.scrollRangeToVisible(range)
    }
    
    
    //MARK: BluetoothSerialDelegate
    
    
    
    
    
    
    func serialDidReceiveString(_ message: String) {
        // add the received text to the textView, optionally with a line break at the end
        let formatter = Float(message.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))
        weightData.append(formatter!);
        print(weightData)
    }
    
    
    
    
    
    
    
    func serialDidDisconnect(_ peripheral: CBPeripheral, error: NSError?) {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud?.mode = MBProgressHUDMode.text
        hud?.labelText = "Disconnected"
        hud?.hide(true, afterDelay: 1.0)
    }
    
    func serialDidChangeState() {
        reloadView()
        if serial.centralManager.state != .poweredOn {
            let hud = MBProgressHUD.showAdded(to: view, animated: true)
            hud?.mode = MBProgressHUDMode.text
            hud?.labelText = "Bluetooth turned off"
            hud?.hide(true, afterDelay: 1.0)
        }
    }
    
    //MARK: IBActions
    
    @IBAction func barButtonPressed(_ sender: AnyObject) {
        if serial.connectedPeripheral == nil {
            performSegue(withIdentifier: "ShowScanner", sender: self)
        } else {
            serial.disconnect()
            reloadView()
        }
    }
}

