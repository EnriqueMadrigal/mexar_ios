//
//  Calculo_Class.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 04/01/18.
//  Copyright © 2018 datalabor.com.mx. All rights reserved.
//

import Foundation
import ObjectMapper



class Calculo_Class{
    
    private var _id: Int = 0
    var _diametro: String = ""
    var _c133z: String = ""
    var _c32z: String = ""
    var _c16z: String = ""
    var _c8z: String = ""
    var _c4z: String = ""
    
    init()
    {
        
    }
    
    public func setId(id: Int){self._id = id}
    public func setDiametro(dato: String){self._diametro = dato}
    public func set133z(dato: String){self._c133z = dato}
    public func set32z(dato: String){self._c32z = dato}
    public func set16z(dato: String){self._c16z = dato}
    public func set8z(dato: String){self._c8z = dato}
    public func set4z(dato: String){self._c4z = dato}
    
    
    
    public func getId()->Int {return self._id}
    public func getDiametro()->String {return self._diametro}
    public func get133z()->String {return self._c133z}
    public func get32z()->String {return self._c32z}
    public func get16z()->String {return self._c16z}
    public func get8z()->String {return self._c8z}
    public func get4z()->String {return self._c4z}
    
    
    
}

class Calculos: Mappable{
    
    var calculos: [Calculo]?
    
    required init?(map: Map){
        
        
    }
    
    func mapping(map: Map) {
        self.calculos <- map["calculos"]
    }
    
}


class Calculo: Mappable{
    var calculo: (Calculo_Data)?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.calculo <- map["calculo"]
    }
    
    
}



class Calculo_Data: Mappable{
    
    var id: Int?
    var diametro: String?
    var c133z: String?
    var c32z: String?
    var c16z: String?
    var c8z: String?
    var c4z: String?
    
    required init?(map: Map){
        
        
    }
    
    func mapping(map: Map) {
        self.id <- map["id"]
        self.diametro <- map["diametro"]
        self.c133z <- map["133z"]
        self.c32z <- map["32z"]
        self.c16z <- map["16z"]
        self.c8z <- map["8z"]
        self.c4z <- map["4z"]
    }
    
    
}


