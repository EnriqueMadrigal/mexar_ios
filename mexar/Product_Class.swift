//
//  Product_Class.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 29/11/17.
//  Copyright © 2017 datalabor.com.mx. All rights reserved.
//

import Foundation
import ObjectMapper

class Product_Class{
    private var _id: Int = 0
    private var _name: String = ""
    private var _idsubcategoria: Int = 0
    private var _desc: String = ""
    private var _desc_completa: String = ""
    private var _presentaciones: [String] = []
    private var _images: [String] = []
    private var _resname: String = ""
    private var _ficha_tecnica: String = ""
    private var _redes: String = ""
    private var _aplicaciones: [String] = []
    private var _especificaciones: [String] = []
    private var _caracteristicas: [String] = []
    private var _colors: [String] = []
    private var _adhieres: [String] = []
    private var _ventajas: [String] = []
    private var _usos: [String] = []
    private var _nota: String = ""
    
    init ()
    {
        self._presentaciones = [String]()
        self._images = [String]()
        self._aplicaciones = [String]()
        self._especificaciones = [String]()
        self._caracteristicas = [String]()
        self._colors = [String]()
        self._adhieres = [String]()
        self._ventajas = [String]()
        self._usos = [String]()
        
    }
    
    public func setId(dato: Int){self._id = dato}
    public func setIdSubCategoria(dato: Int){self._idsubcategoria = dato}
    
    public func setName(dato: String){self._name = dato}
    public func setDesc(dato: String){self._desc = dato}
    public func setDesc_Completa(dato: String){self._desc_completa = dato}
    public func setResName(dato: String){self._resname = dato}
    public func setFichaTecnica(dato: String){self._ficha_tecnica = dato}
    public func setRedes(dato: String){self._redes = dato}
    public func setNota(dato: String){self._nota = dato}
    
    public func setPresentaciones(datos: [String]){self._presentaciones = datos}
    public func setImages(datos: [String]){self._images = datos}
    public func setAplicaciones(datos: [String]){self._aplicaciones = datos}
    public func setEspecificaciones(datos: [String]){self._especificaciones = datos}
    public func setCaracteristicas(datos: [String]){self._caracteristicas = datos}
    public func setColors(datos: [String]){self._colors = datos}
    public func setAdhieres(datos: [String]){self._adhieres = datos}
    public func setVentajas(datos: [String]){self._ventajas = datos}
    public func setUsos(datos: [String]){self._usos = datos}
    
    
    public func getId()->Int{return self._id}
    public func getIdSubCategoria()->Int{return self._idsubcategoria}
    
    public func getName()->String{return self._name}
    public func getDesc()->String{return self._desc}
    public func getDesc_Completa()->String{return self._desc_completa}
    public func getResName()->String{return self._resname}
    public func getFicha_Tecnica()->String{return self._ficha_tecnica}
    public func getRedes()->String{return self._redes}
    public func getNota()->String{return self._nota}
    
    
    public func getPresentaciones()->[String]   {return self._presentaciones}
    public func getImages()->[String]{return self._images}
    public func getAplicaciones()->[String]{return self._aplicaciones}
    public func getEspecificaciones()->[String]{return self._especificaciones}
    public func getCaracteristicas()->[String]{return self._caracteristicas}
    public func getColors()->[String]{return self._colors}
    public func getAdhieres()->[String]{return self._adhieres}
    public func getVentajas()->[String]{return self._ventajas}
    public func getUsos()->[String]{return self._usos}
    
    
    
}



class Productos: Mappable{
    var productos: [Producto]?
    
    required init?(map: Map){
        
    }
    
    
    
    func mapping(map: Map) {
        self.productos <- map["productos"]
        
    }
}



class Producto: Mappable{
    var producto: (Product_Data)?
    
    required init?(map: Map){
        
    }
    
    
    
    func mapping(map: Map) {
        self.producto <- map["producto"]
        
    }
}



class Product_Data: Mappable{
    
    var id: Int?
    var name: String?
    var idsubcategoria: Int?
    var desc: String?
    var desc_completa: String?
    var presentaciones: [String]?
    var images: [String]?
    var resname: String?
    var ficha_tecnica: String?
    var redes: String?
    var aplicaciones: [String]?
    var especificaciones: [String]?
    var caracteristicas: [String]?
    var colors: [String]?
    var adhieres: [String]?
    var ventajas: [String]?
    var usos: [String]?
    var nota: String?

    
    required init?(map: Map){
        
    }
    
    
    func mapping(map: Map) {
    
        self.id <- map["id"]
        self.name <- map["name"]
        self.idsubcategoria <- map["idsubcategoria"]
        self.desc <- map["desc"]
        self.desc_completa <- map["desc_completa"]
        self.presentaciones <- map["presentaciones"]
        self.images <- map["images"]
        self.resname <- map["resname"]
        self.ficha_tecnica <- map["ficha_tecnica"]
        self.redes <- map["redes"]
        self.aplicaciones <- map["aplicaciones"]
        self.especificaciones <- map["especificaciones"]
        self.caracteristicas <- map["caracteristicas"]
        self.colors <- map["colors"]
        self.adhieres <- map["adhieres"]
        self.ventajas <- map["ventajas"]
        self.usos <- map["usos"]
        self.nota <- map["nota"]

    
    }
    
    
    
}


