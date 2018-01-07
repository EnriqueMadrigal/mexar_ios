//
//  ScreenBounds.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 11/12/17.
//  Copyright © 2017 datalabor.com.mx. All rights reserved.
//

import Foundation
class ScreenBounds{
    
    var width: Int = 0
    var height: Int = 0
    var deviceType: String?
    
    init(newWidth: Int, newHeight: Int, typeDevice: String?)
    {
        self.width = newWidth
        self.height = newHeight
        self.deviceType = typeDevice
        
    }
    
    
    
}

