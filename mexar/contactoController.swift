//
//  contactoController.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 05/01/18.
//  Copyright © 2018 datalabor.com.mx. All rights reserved.
//

import UIKit
import ObjectMapper

class contactoController: UIViewController {

    @IBOutlet weak var labelSucursal: UILabel!
    @IBOutlet weak var labelGerente: UILabel!
    
    private var sucursales: [Sucursal_Class] = []
    private var gerentes: [Gerente_Class] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let logoImage:UIImage = UIImage(named: "icon_mexar")!
        self.navigationItem.titleView = UIImageView(image: logoImage)
        
        getSucursales()
        getGerentes()
        
        let formatedString = NSMutableAttributedString()
        
        for curSucursal: Sucursal_Class in self.sucursales{
            
            let formatedStr = NSMutableAttributedString()
            formatedStr
                .bold(curSucursal.getName())
                .normal("\n")
                .normal(curSucursal.getDireccion())
                .normal("\n")
                .normal(curSucursal.getColonia())
                .normal(curSucursal.getMunicipio())
                .normal("\n")
                .normal(curSucursal.getCiudad())
                .normal("\n")
                .normal(curSucursal.getPhone())
                .normal("\n\n")
            
            
            
            formatedString.append(formatedStr)
            
        }
        
        
        labelSucursal.attributedText = formatedString
        
        
        let formatedString2 = NSMutableAttributedString()
        
        for curGerente: Gerente_Class in self.gerentes{
            
            let formatedStr = NSMutableAttributedString()
            formatedStr
                .bold(curGerente.getName())
                .normal("\n")
                .normal(curGerente.getTitle())
                .normal("\n")
                .normal(curGerente.getEmail())
                .normal("\n")
                .normal(curGerente.getPhone())
                .normal("\n")
                .normal(curGerente.getCel())
                .normal("\n\n")
            
            
            formatedString2.append(formatedStr)
            
        }
        
        labelGerente.attributedText = formatedString2
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func getSucursales()
    {
       ////
        self.sucursales.removeAll()
        
        if let bundlePath = Bundle.main.url(forResource: "sucursales", withExtension: "json"){
            do {
                //let data = try Data(contentsOf: bundlePath)
                let text2 = try String(contentsOf: bundlePath, encoding: .utf8)
                
                
                
                //////
                
                let list: Array<Sucursales> = Mapper<Sucursales>().mapArray(JSONString: text2)!
                let curCats: Array<Sucursal> = (list.first?.sucursales)!
                
                for curCat: Sucursal in curCats{
                    
                    if let cur_cat_data = curCat.sucursal{
                        let name: String = cur_cat_data.name!
                        let id: Int = cur_cat_data.id!
                        let direccion: String = cur_cat_data.direccion!
                        let colonia: String = cur_cat_data.colonia!
                        let municipio: String = cur_cat_data.municipio!
                        let ciudad: String = cur_cat_data.ciudad!
                        let phone: String = cur_cat_data.phone!
                        
                        let new_class = Sucursal_Class()
                        new_class.setId(id: id)
                        new_class.setName(name: name)
                        new_class.setDireccion(dato: direccion)
                        new_class.setColonia(dato: colonia)
                        new_class.setMunicipio(dato: municipio)
                        new_class.setCiudad(dato: ciudad)
                        new_class.setPhone(dato: phone)
                        self.sucursales.append(new_class)
                    }
                    
                }
                
                ////
                
            }
                
            catch {
                print(error)
                return
            }
            
            
            
        }
        
        ////
        
        
    }

    
    func getGerentes()
    {
        ////
        self.gerentes.removeAll()
        
        if let bundlePath = Bundle.main.url(forResource: "gerentes", withExtension: "json"){
            do {
                //let data = try Data(contentsOf: bundlePath)
                let text2 = try String(contentsOf: bundlePath, encoding: .utf8)
                
                
                
                //////
                
                let list: Array<Gerentes> = Mapper<Gerentes>().mapArray(JSONString: text2)!
                let curCats: Array<Gerente> = (list.first?.gerentes)!
                
                for curCat: Gerente in curCats{
                    
                    if let cur_cat_data = curCat.gerente{
                        let name: String = cur_cat_data.name!
                        let id: Int = cur_cat_data.id!
                        let title: String = cur_cat_data.title!
                        let email: String = cur_cat_data.email!
                        let cel: String = cur_cat_data.cel!
                        let phone: String = cur_cat_data.phone!
                        
                        let new_class = Gerente_Class()
                        new_class.setId(id: id)
                        new_class.setName(name: name)
                        new_class.setTitle(dato: title)
                        new_class.setEmail(dato: email)
                        new_class.setCel(dato: cel)
                        new_class.setPhone(dato: phone)
                        self.gerentes.append(new_class)
                    }
                    
                }
                
                ////
                
            }
                
            catch {
                print(error)
                return
            }
            
            
            
        }
        
        ////
        
        
    }
    
}
