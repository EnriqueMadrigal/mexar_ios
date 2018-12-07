//
//  Product_Class.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 29/11/17.
//  Copyright © 2017 datalabor.com.mx. All rights reserved.
//

import Foundation
import ObjectMapper

class Calc_Product_Class{
    private var _id: Int = 0
    private var _name: String = ""
    private var _pres1: String = ""
    private var _pres2: String = ""
    private var _pres3: String = ""
    private var _pres4: String = ""
    private var _pres5: String = ""
    
    
    init ()
    {
        
        
    }
    
    public func setId(dato: Int){self._id = dato}
    public func setName(dato: String){self._name = dato}
    public func setPress1(dato: String){self._pres1 = dato}
    public func setPress2(dato: String){self._pres2 = dato}
    public func setPress3(dato: String){self._pres3 = dato}
    public func setPress4(dato: String){self._pres4 = dato}
    public func setPress5(dato: String){self._pres5 = dato}
    
    
    
    public func getId()->Int{return self._id}
    public func getName()->String{return self._name}
    public func getPress1()->String{return self._pres1}
    public func getPress2()->String{return self._pres2}
    public func getPress3()->String{return self._pres3}
    public func getPress4()->String{return self._pres4}
    public func getPress5()->String{return self._pres5}
    
    
    
}



class Calc_Productos: Mappable{
    var productos: [Calc_Producto]?
    
    required init?(map: Map){
        
    }
    
    
    
    func mapping(map: Map) {
        self.productos <- map["calc_products"]
        
    }
}



class Calc_Producto: Mappable{
    var producto: (Calc_Product_Data)?
    
    required init?(map: Map){
        
    }
    
    
    
    func mapping(map: Map) {
        self.producto <- map["product"]
        
    }
}



class Calc_Product_Data: Mappable{
    
    var id: Int?
    var name: String?
    var pres1: String?
    var pres2: String?
    var pres3: String?
    var pres4: String?
    var pres5: String?
    
    required init?(map: Map){
        
    }
    
    
    func mapping(map: Map) {
        
        self.id <- map["id"]
        self.name <- map["name"]
        self.pres1 <- map["pres1"]
        self.pres2 <- map["pres2"]
        self.pres3 <- map["pres3"]
        self.pres4 <- map["pres4"]
        self.pres5 <- map["pres5"]
        
        
    }
    
    
    
}


