//
//  Barcode_Class.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 13/06/18.
//  Copyright © 2018 datalabor.com.mx. All rights reserved.
//

import Foundation
import ObjectMapper


class Barcode_Class {
    
    private var _id: Int = 0
    private var _product_id: Int = 0
    private var _desc: String = ""
    private var _code: String = ""
    private var _item: String = ""
    private var _unidad: String = ""
    private var _pzas: String = ""
    
    init ()
    {
        
    }
    
    
    public func setId(dato: Int){self._id = dato}
    public func setProductId(dato: Int){self._product_id = dato}
    public func setDesc(dato: String){self._desc = dato}
    public func setCode(dato: String){self._code = dato}
    public func setItem(dato: String){self._item = dato}
    public func setUnidadc(dato: String){self._unidad = dato}
    public func setPzas(dato: String){self._pzas = dato}
    
    
    public func getId()->Int{return self._id}
    public func getProductId()->Int{return self._product_id}
    public func getDesc()->String{return self._desc}
    public func getCode()->String{return self._code}
    public func getItem()->String{return self._item}
    public func getUnidad()->String{return self._unidad}
    public func getPzas()->String{return self._pzas}
    
    
}


class Barcodes: Mappable{
    var barcodes: [Barcode]?
    
    required init?(map: Map){
        
    }
    
    
    
    func mapping(map: Map) {
        self.barcodes <- map["barcodes"]
        
    }
}




class Barcode: Mappable{
    var barcode: (Barcode_Data)?
    
    required init?(map: Map){
        
    }
    
    
    
    func mapping(map: Map) {
        self.barcode <- map["barcode"]
        
    }
}




class Barcode_Data: Mappable{
    
    var id: Int?
    var product_id: Int?
    var desc: String?
    var code: String?
    var item: String?
    var unidad: String?
    var pzas: String?
    
    required init?(map: Map){
        
    }
    
    
    func mapping(map: Map) {
        
        self.id <- map["id"]
        self.product_id <- map["product_id"]
        self.desc <- map["desc"]
        self.code <- map["code"]
        self.item <- map["item"]
        self.unidad <- map["unidad"]
        self.pzas <- map["pzas"]
        
    }
    
}

