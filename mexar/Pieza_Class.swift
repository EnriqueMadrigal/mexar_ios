//
//  Pieza_Class.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 03/01/18.
//  Copyright © 2018 datalabor.com.mx. All rights reserved.
//

import Foundation
import ObjectMapper



class Pieza_Class{
    
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

class Piezas: Mappable{
    
    var piezas: [Pieza]?
    
    required init?(map: Map){
        
        
    }
    
    func mapping(map: Map) {
        self.piezas <- map["piezas"]
    }
    
}


class Pieza: Mappable{
    var pieza: (Pieza_Data)?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.pieza <- map["pieza"]
    }
    
    
}



class Pieza_Data: Mappable{
    
    var name: String?
    var id: Int?
    var resname: String?
    
    required init?(map: Map){
        
        
    }
    
    func mapping(map: Map) {
        self.name <- map["name"]
        self.id <- map["id"]
        self.resname <- map["resname"]
    }
    
    
}


