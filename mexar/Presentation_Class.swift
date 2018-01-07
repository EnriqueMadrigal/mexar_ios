//
//  Presentation_Class.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 03/01/18.
//  Copyright © 2018 datalabor.com.mx. All rights reserved.
//

import Foundation
import ObjectMapper



class Presentation_Class{
    
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

class Presentations: Mappable{
    
    var presentations: [Presentation]?
    
    required init?(map: Map){
        
        
    }
    
    func mapping(map: Map) {
        self.presentations <- map["presentaciones"]
    }
    
}


class Presentation: Mappable{
    var presentation: (Presentation_Data)?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.presentation <- map["presentacion"]
    }
    
    
}



class Presentation_Data: Mappable{
    
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

