//
//  Category_Class.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 28/11/17.
//  Copyright © 2017 datalabor.com.mx. All rights reserved.
//

import Foundation
import ObjectMapper



class Category_Class{
    
    private var _id: Int = 0
    private var _name: String = ""
    private var _desc: String = ""
    private var _resname: String = ""
    
    init()
    {
        
    }
    
    public func setId(id: Int){self._id = id}
    public func setName(name: String){self._name = name}
    public func setDesc(desc: String){self._desc = desc}
    public func setResName(resname: String){self._resname = resname}
    
    public func getId()->Int {return self._id}
    public func getName()->String {return self._name}
    public func getDesc()->String {return self._desc}
    public func getResName()->String {return self._resname}
    
    
}

    class Categorias: Mappable{
        
        var categorias: [Categoria]?
        
        required init?(map: Map){
            
            
        }
        
        func mapping(map: Map) {
            self.categorias <- map["categorias"]
        }
        
    }
    
    
    class Categoria: Mappable{
        var categoria: (Category_Data)?
        required init?(map: Map) {
            
        }
        
        func mapping(map: Map) {
            self.categoria <- map["categoria"]
        }
        
        
    }
    
    
    
    class Category_Data: Mappable{
        
        var name: String?
        var id: Int?
        var resname: String?
        var desc: String?
        
        required init?(map: Map){
        
        
        }
        
        func mapping(map: Map) {
            self.name <- map["name"]
            self.id <- map["id"]
            self.desc <- map["desc"]
            self.resname <- map["resname"]
        }
        
        
    }
    
    

