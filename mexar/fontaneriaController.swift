//
//  fontaneriaController.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 03/01/18.
//  Copyright © 2018 datalabor.com.mx. All rights reserved.
//

import UIKit
import ObjectMapper

class fontaneriaController: UIViewController , UITableViewDelegate,  UITableViewDataSource{

    @IBOutlet weak var presentacionTable: UITableView!
    @IBOutlet weak var btn_presentacion: UIButton!
    @IBOutlet weak var piezaTable: UITableView!
    @IBOutlet weak var btn_pieza: UIButton!
    @IBOutlet weak var label_resultado: UILabel!
    
    
    private var presentaciones: [Presentation_Class] = []
    private var piezas: [Pieza_Class] = []
    
    private var cur_pre: Int = 0
    private var cur_pza: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let logoImage:UIImage = UIImage(named: "icon_mexar")!
        self.navigationItem.titleView = UIImageView(image: logoImage)
        
   self.presentacionTable.delegate = self
        self.presentacionTable.dataSource = self
        
        //self.presentacionTable.rowHeight = UITableViewAutomaticDimension
        //self.presentacionTable.estimatedRowHeight = 20
        self.presentacionTable.isHidden = true
        
        self.piezaTable.delegate = self
        self.piezaTable.dataSource = self
        self.piezaTable.isHidden = true
        
        getPresentations()
        getPiezas()
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

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        
        var curItems :Int = 0
        if (tableView == self.piezaTable)
        {
            curItems = piezas.count
        }
        
        if (tableView == self.presentacionTable)
        {
            curItems = presentaciones.count
        }
        
        return curItems
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        
        
        // let cell =  productsCell(style: UITableViewCellStyle.default, reuseIdentifier: "myIdentifier")
        let cell = tableView.dequeueReusableCell(withIdentifier: "dropDownTableViewCell", for: indexPath) as! dropDownTableView
        
        if (tableView == self.presentacionTable)
        {
        let curPresentation = presentaciones[indexPath.row]
        cell.labelCell.text = curPresentation.getName()
        }
        
        if (tableView == self.piezaTable)
        {
         let curPieza = piezas[indexPath.row]
          cell.labelCell.text = curPieza.getName()
        }
            
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let curItem: String = items[indexPath.row]
        if (tableView == self.presentacionTable)
        {
            
        let curPresentation = presentaciones[indexPath.row]
            self.cur_pre = indexPath.row + 1
        
        UIView.performWithoutAnimation {
     self.btn_presentacion.setTitle(curPresentation.getName(), for: .normal)
     self.btn_presentacion.layoutIfNeeded()
        }
        self.presentacionTable.isHidden = true
            
        }
        
        if (tableView == self.piezaTable)
        {
         
            let curPieza = piezas[indexPath.row]
            self.cur_pza = indexPath.row + 1
            
            UIView.performWithoutAnimation {
                self.btn_pieza.setTitle(curPieza.getName(), for: .normal)
                self.btn_pieza.layoutIfNeeded()
            }
            self.piezaTable.isHidden = true
            
            
        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 22.0
    }
    
    
    @IBAction func btn_presentacion_click(_ sender: Any) {
        self.piezaTable.isHidden = true
        self.presentacionTable.isHidden = !self.presentacionTable.isHidden
        debugPrint("Presentacion")
        
    }
    
    @IBAction func btn_pieza_click(_ sender: Any) {
        self.presentacionTable.isHidden = true
         self.piezaTable.isHidden = !self.piezaTable.isHidden
        debugPrint("Pieza")
    }
    
    func getPresentations()
    {
////
    
        self.presentaciones.removeAll()
        
        if let bundlePath = Bundle.main.url(forResource: "presentaciones", withExtension: "json"){
            do {
                //let data = try Data(contentsOf: bundlePath)
                let text2 = try String(contentsOf: bundlePath, encoding: .utf8)
                
                
                
                //////
                
                let list: Array<Presentations> = Mapper<Presentations>().mapArray(JSONString: text2)!
                let curPres: Array<Presentation> = (list.first?.presentations)!
                
                for curPre: Presentation in curPres{
                    
                    if let cur_pre_data = curPre.presentation{
                        let name: String = cur_pre_data.name!
                        let id: Int = cur_pre_data.id!
                        let resname: String = cur_pre_data.resname!
                        
                        let new_pre = Presentation_Class()
                        new_pre.setId(id: id)
                        new_pre.setName(name: name)
                        new_pre.setResName(resname: resname)
                        self.presentaciones.append(new_pre)
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
    
    
    func getPiezas()
    {
        ////
        
        self.piezas.removeAll()
        
        if let bundlePath = Bundle.main.url(forResource: "piezas", withExtension: "json"){
            do {
                //let data = try Data(contentsOf: bundlePath)
                let text2 = try String(contentsOf: bundlePath, encoding: .utf8)
                
                
                
                //////
                
                let list: Array<Piezas> = Mapper<Piezas>().mapArray(JSONString: text2)!
                let curPres: Array<Pieza> = (list.first?.piezas)!
                
                for curPre: Pieza in curPres{
                    
                    if let cur_pre_data = curPre.pieza{
                        let name: String = cur_pre_data.name!
                        let id: Int = cur_pre_data.id!
                        let resname: String = cur_pre_data.resname!
                        
                        let new_pre = Pieza_Class()
                        new_pre.setId(id: id)
                        new_pre.setName(name: name)
                        new_pre.setResName(resname: resname)
                        self.piezas.append(new_pre)
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
    
    
    func getCalculo(presentacion: Int, pieza: Int)->String
    {
        ////
        var curResult: String = ""
        
        if let bundlePath = Bundle.main.url(forResource: "calculadora", withExtension: "json"){
            do {
                //let data = try Data(contentsOf: bundlePath)
                let text2 = try String(contentsOf: bundlePath, encoding: .utf8)
                
                
                
                //////
                
                let list: Array<Calculos> = Mapper<Calculos>().mapArray(JSONString: text2)!
                let curPres: Array<Calculo> = (list.first?.calculos)!
                
                for curPre: Calculo in curPres{
                    
                    if let cur_pre_data = curPre.calculo{
                        let id: Int = cur_pre_data.id!
                        //let diametro: String = cur_pre_data.diametro!
                        let c133z: String = cur_pre_data.c133z!
                        let c32z: String = cur_pre_data.c32z!
                        let c16z: String = cur_pre_data.c16z!
                        let c8z: String = cur_pre_data.c8z!
                        let c4z: String = cur_pre_data.c4z!
              
                        ///
                        if (pieza == id)
                        {
                            switch presentacion {
                            case 1:
                                curResult = c4z
                                
                            case 2:
                                curResult = c8z
                                
                            case 3:
                                curResult = c16z
                                
                            case 4:
                                curResult = c32z
                                
                            case 5:
                                curResult = c133z
                                
                            default:
                                curResult = ""
                            }
                            
                            
                            ///
                            
                            return curResult
                        }
                        
                        
                        /////
                    
                }
                
                
                
           }
                
            }
            catch {
                print(error)
                return ""
            }
            
            
            
        }
     return ""
    }
    
    
    @IBAction func btn_calcular_clilck(_ sender: Any) {
        
        if (self.cur_pza == 0){
            self.showAlert(title: "Aviso", desc: "Favor de seleccionar la pieza:", btn: "Aceptar")
            return
        }
        
        if (self.cur_pre == 0){
            self.showAlert(title: "Aviso", desc: "Favor de selecionar la presentación", btn: "Aceptar")
            return
        }
        
        let curCalculo: String = self.getCalculo(presentacion: cur_pre, pieza: cur_pza)
        
        let curPresentation = presentaciones[cur_pre - 1] // -1 porque se le agrego 1 +
        let curPieza = piezas[cur_pza - 1]
        
        
        
        let formatedStr = NSMutableAttributedString()
        formatedStr
            .normal("El cemento Contact 202 en presentanción de: ")
            .bold(curPresentation.getName())
            .normal(". Rinde para: ")
            .bold(curCalculo)
            .normal(" uniones de: ")
            .bold(curPieza.getName())
            .normal("\n")
        
        self.label_resultado.attributedText = formatedStr
        
        
        
    }
 
    
    func showAlert(title: String, desc: String, btn:String)
    {
        
        let alertController = UIAlertController(title: title, message: desc, preferredStyle:UIAlertControllerStyle.alert)
        let ok = UIAlertAction(title: btn, style: UIAlertActionStyle.default, handler: nil)
        
        alertController.addAction(ok)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}
