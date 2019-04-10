//
//  mainIcon_Class.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 12/29/18.
//  Copyright © 2018 datalabor.com.mx. All rights reserved.
//

import Foundation

//
//  mainIcons.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 12/29/18.
//  Copyright © 2018 datalabor.com.mx. All rights reserved.
//

import Foundation

class mainIcon_Class {
    
    private var _id: Int = 0
    private var _name: String = ""
    private var _resname: String = ""
    
    init()
    {
        
    }
    
    
    public func setId(id: Int){self._id = id}
    public func setName(name: String){self._name = name}
    public func setResName(resname: String){self._resname = resname}
    
    public func getId()->Int {return self._id}
    public func getName()->String {return self._name}
    public func getResName()->String {return self._resname}
    
}
