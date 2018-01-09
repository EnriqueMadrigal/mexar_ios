//
//  utils.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 08/01/18.
//  Copyright © 2018 datalabor.com.mx. All rights reserved.
//

import Foundation
import KeychainSwift


class Utils {
    
static func getStringKey(namekey: String) ->String{
    
    let keychain = KeychainSwift()
    
    let curValue: String?  = keychain.get(namekey)
    
    if (curValue != nil) {
        return curValue!
    }
    
    
    
    return ""
    
}

static func setStringKey(namekey: String, value: String)
{
    let keychain = KeychainSwift()
    
    keychain.set(value, forKey: namekey)
    
}



static func setBoolKey(namekey: String, value: Bool)
{
    let keychain = KeychainSwift()
    keychain.set(value, forKey: namekey)
    
}


static func getBoolKey(namekey: String)->Bool{
    let keychain = KeychainSwift()
    
    let curValue = keychain.getBool(namekey)
    
    if (curValue != nil)
    {
        return curValue!
    }
        
    else{
        return false
    }
    
}

    static func removeUserInfo() {
        
        let keychain = KeychainSwift()
        
        keychain.delete(common.VAR_USER_NAME)
        keychain.delete(common.VAR_USER_EMAIL)
        keychain.delete(common.VAR_LOGIN_TYPE)
        
        
    }
    
    
    
}

