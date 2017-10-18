//
//  AppDelegate.swift
//  HM10 Serial
//
//  Created by Alex on 09-08-15.
//  Copyright (c) 2015 Balancing Rock. All rights reserved.
//

import UIKit
import LoginWithAmazon

let MessageOptionKey = "MessageOption"
let ReceivedMessageOptionKey = "ReceivedMessageOption"
//let WriteWithResponseKey = "WriteWithResponse" No longer neccessary v1.1.2

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
        
    func application(_ application: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        return AIMobileLib.handleOpen(url, sourceApplication: UIApplicationOpenURLOptionsKey.sourceApplication.rawValue)
    }
}
