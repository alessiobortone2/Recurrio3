//
//  LoginWithAmazonProxy.swift
//  Hardware
//
//  Created by Nick Otter on 16/10/2017.
//  Copyright © 2017 Hardware. All rights reserved.
//

import Foundation
import LoginWithAmazon

class LoginWithAmazonProxy {
    
    static let sharedInstance = LoginWithAmazonProxy()
    
    func login(delegate: AIAuthenticationDelegate) {
        AIMobileLib.authorizeUser(forScopes: Settings.Credentials.SCOPES, delegate: delegate, options: [])
    }
}
