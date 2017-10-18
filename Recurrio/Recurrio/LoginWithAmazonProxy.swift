//
//  LoginWithAmazonProxy.swift
//  Serial
//
//  Created by Nick Otter on 18/10/2017.
//  Copyright © 2017 Balancing Rock. All rights reserved.
//

import Foundation

import Foundation
import LoginWithAmazon

class LoginWithAmazonProxy {
    
    static let sharedInstance = LoginWithAmazonProxy()
    
    func login(delegate: AIAuthenticationDelegate) {
        AIMobileLib.authorizeUser(forScopes: Settings.Credentials.SCOPES, delegate: delegate, options: nil)
    }
    
    func logout(delegate: AIAuthenticationDelegate) {
        AIMobileLib.clearAuthorizationState(delegate)
    }
    
    func getAccessToken(delegate: AIAuthenticationDelegate) {
        AIMobileLib.getAccessToken(forScopes: Settings.Credentials.SCOPES, withOverrideParams: nil, delegate: delegate)
    }
}
