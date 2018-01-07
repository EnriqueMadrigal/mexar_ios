//
//  Sucursal_Class.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 04/01/18.
//  Copyright © 2018 datalabor.com.mx. All rights reserved.
//

import Foundation
import ObjectMapper



class Sucursal_Class{
    
    private var _id: Int = 0
    private var _name: String = ""
    private var _direccion: String = ""
    private var _colonia: String = ""
    private var _municipio: String = ""
    private var _ciudad: String = ""
    private var _phone: String = ""
    
    
    
    
    init()
    {
        
    }
    
    public func setId(id: Int){self._id = id}
    public func setName(name: String){self._name = name}
    public func setDireccion(dato: String){self._direccion = dato}
    public func setColonia(dato: String){self._colonia = dato}
    public func setMunicipio(dato: String){self._municipio = dato}
    public func setCiudad(dato: String){self._ciudad = dato}
    public func setPhone(dato: String){self._phone = dato}
    
    
    public func getId()->Int {return self._id}
    public func getName()->String {return self._name}
    public func getDireccion()->String {return self._direccion}
    public func getColonia()->String {return self._colonia}
    public func getMunicipio()->String {return self._municipio}
    public func getCiudad()->String {return self._ciudad}
    public func getPhone()->String {return self._phone}
    
    
    
}

class Sucursales: Mappable{
    
    var sucursales: [Sucursal]?
    
    required init?(map: Map){
        
        
    }
    
    func mapping(map: Map) {
        self.sucursales <- map["sucursales"]
    }
    
}


class Sucursal: Mappable{
    var sucursal: (Sucursal_Data)?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.sucursal <- map["sucursal"]
    }
    
    
}



class Sucursal_Data: Mappable{
    
    var name: String?
    var id: Int?
    var direccion: String?
    var colonia: String?
    var municipio: String?
    var ciudad: String?
    var phone: String?
    
    
    
    required init?(map: Map){
        
        
    }
    
    func mapping(map: Map) {
        self.name <- map["name"]
        self.id <- map["id"]
        self.direccion <- map["direccion"]
        self.colonia <- map["colonia"]
        self.municipio <- map["municipio"]
        self.ciudad <- map["ciudad"]
        self.phone <- map["phone"]
    }
    
    
}


