//
//  SubCategoria_Class.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 29/11/17.
//  Copyright © 2017 datalabor.com.mx. All rights reserved.
//

import Foundation
import ObjectMapper

class SubCategory_Class{
    
    private var _id: Int = 0
    private var _idcategoria: Int = 0
    private var _name: String = ""
    private var _desc: String = ""
    private var _resname: String = ""
    
    init()
    {
        
    }
    
    public func setId(id: Int){self._id = id}
    public func setIdCategoria(idcategoria: Int){self._idcategoria = idcategoria}
    public func setName(name: String){self._name = name}
    public func setDesc(desc: String){self._desc = desc}
    public func setResName(resname: String){self._resname = resname}
    
    public func getId()->Int {return self._id}
    public func getIdCategoria()->Int {return self._idcategoria}
    public func getName()->String {return self._name}
    public func getDesc()->String {return self._desc}
    public func getResName()->String {return self._resname}
    
    
}

class SubCategorias: Mappable{
    
    var subcategorias: [SubCategoria]?
    
    required init?(map: Map){
        
        
    }
    
    func mapping(map: Map) {
        self.subcategorias <- map["subcategorias"]
    }
    
}


class SubCategoria: Mappable{
    var subcategoria: (SubCategory_Data)?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.subcategoria <- map["subcategoria"]
    }
    
    
}



class SubCategory_Data: Mappable{
    
    var name: String?
    var id: Int?
    var idcategoria: Int?
    var resname: String?
    var desc: String?
    
    required init?(map: Map){
        
        
    }
    
    func mapping(map: Map) {
        self.name <- map["name"]
        self.id <- map["id"]
        self.idcategoria <- map["idcategoria"]
        self.desc <- map["desc"]
        self.resname <- map["resname"]
    }
    
    
}
