//
//  Gerente_Class.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 05/01/18.
//  Copyright © 2018 datalabor.com.mx. All rights reserved.
//

import Foundation
import ObjectMapper



class Gerente_Class{
    
    private var _id: Int = 0
    private var _name: String = ""
    private var _title: String = ""
    private var _email: String = ""
    private var _cel: String = ""
    private var _phone: String = ""
    
    
    
    init()
    {
        
    }
    
    public func setId(id: Int){self._id = id}
    public func setName(name: String){self._name = name}
    public func setTitle(dato: String){self._title = dato}
    public func setEmail(dato: String){self._email = dato}
    public func setCel(dato: String){self._cel = dato}
    public func setPhone(dato: String){self._phone = dato}
    
    
    public func getId()->Int {return self._id}
    public func getName()->String {return self._name}
    public func getTitle()->String {return self._title}
    public func getEmail()->String {return self._email}
    public func getCel()->String {return self._cel}
    public func getPhone()->String {return self._phone}
    
}

class Gerentes: Mappable{
    
    var gerentes: [Gerente]?
    
    required init?(map: Map){
        
        
    }
    
    func mapping(map: Map) {
        self.gerentes <- map["gerentes"]
    }
    
}


class Gerente: Mappable{
    var gerente: (Gerente_Data)?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.gerente <- map["gerente"]
    }
    
    
}



class Gerente_Data: Mappable{
    
    var name: String?
    var id: Int?
    var title: String?
    var colonia: String?
    var email: String?
    var cel: String?
    var phone: String?
    
    
    
    required init?(map: Map){
        
        
    }
    
    func mapping(map: Map) {
        self.name <- map["name"]
        self.id <- map["id"]
        self.title <- map["title"]
        self.email <- map["email"]
        self.phone <- map["phone"]
        self.cel <- map["cel"]
        }
    
    
}



