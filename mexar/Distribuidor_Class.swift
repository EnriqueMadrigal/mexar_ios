//
//  Distribuidor_Class.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 05/01/18.
//  Copyright © 2018 datalabor.com.mx. All rights reserved.
//

import Foundation
import ObjectMapper



class Distribuidor_Class{
    
    private var _id: Int = 0
    private var _name: String = ""
    
    private var _clave: String = ""
    private var _comercial_name: String = ""
    private var _state: String = ""
    private var _city: String = ""
    private var _address: String = ""
    private var _interior: String = ""
    private var _exerior: String = ""
    private var _colonia: String = ""
    private var _cp: String = ""
    private var _phone1: String = ""
    private var _phone2: String = ""
    private var _lat: Double = 0.0
    private var _lng: Double = 0.0
    
    
    init()
    {
        
    }
    
    public func setId(id: Int){self._id = id}
    public func setName(name: String){self._name = name}
    public func setClave (dato: String){self._clave = dato}
    public func setComercial_Name (dato: String){self._comercial_name = dato}
    public func setState (dato: String){self._state = dato}
    public func setCity (dato: String){self._city = dato}
    public func setAddress (dato: String){self._address = dato}
    public func setInterior (dato: String){self._interior = dato}
    public func setExterior (dato: String){self._exerior = dato}
    public func setColonia (dato: String){self._colonia = dato}
    public func setCP (dato: String){self._cp = dato}
    public func setPhone1 (dato: String){self._phone1 = dato}
    public func setPhone2 (dato: String){self._phone2 = dato}
    public func setLat (dato: Double){self._lat = dato}
    public func setLng (dato: Double){self._lng = dato}
    
    
    public func getId()->Int {return self._id}
    public func getName()->String {return self._name}
    public func getComercial_Name()->String {return self._comercial_name}
    public func getClave()->String {return self._clave}
    public func getState()->String {return self._state}
    public func getCity()->String {return self._city}
    public func getAddress()->String {return self._address}
    public func getInterior()->String {return self._interior}
    public func getExterior()->String {return self._exerior}
    public func getColonia()->String {return self._colonia}
    public func getCP()->String {return self._cp}
    public func getPhone1()->String {return self._phone1}
    public func getPhone2()->String {return self._phone2}
    public func getLat()->Double {return self._lat}
    public func getLng()->Double {return self._lng}
}

class Distribuidores: Mappable{
    
    var distribuidores: [Distribuidor]?
    
    required init?(map: Map){
        
        
    }
    
    func mapping(map: Map) {
        self.distribuidores <- map["distribuidores"]
    }
    
}


class Distribuidor: Mappable{
    var distribuidor: (Distribuidor_Data)?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.distribuidor <- map["distribuidor"]
    }
    
    
}



class Distribuidor_Data: Mappable{
    
    var name: String?
    var id: Int?
    var clave: String?
    var comercial_name: String?
    var state: String?
    var city: String?
    var address: String?
    var interior: String?
    var exterior: String?
    var colonia: String?
    var cp: String?
    var phone1: String?
    var phone2: String?
    var lat: String?
    var lng: String?
    
    
    required init?(map: Map){
        
        
    }
    
    func mapping(map: Map) {
        self.name <- map["name"]
        self.id <- map["id"]
        self.clave <- map["clave"]
        self.comercial_name <- map["comercial_name"]
        self.state <- map["state"]
        self.city <- map["city"]
        self.address <- map["address"]
        self.interior <- map["interior"]
        self.exterior <- map["exterior"]
        self.colonia <- map["colonia"]
        self.cp <- map["cp"]
        self.phone1 <- map["phone1"]
        self.phone2 <- map["phone2"]
        self.lat <- map["lat"]
        self.lng <- map["lng"]
        
       
      }
    
    
}



