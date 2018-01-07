//
//  distribuidoresController.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 06/01/18.
//  Copyright © 2018 datalabor.com.mx. All rights reserved.
//

import UIKit
import ObjectMapper

class distribuidoresController: UIViewController , UITableViewDelegate,  UITableViewDataSource{
 

    @IBOutlet weak var btn_estado: UIButton!
    @IBOutlet weak var tableView_Estados: UITableView!
    @IBOutlet weak var tableView_Distribuidores: UITableView!
    
    private var distribuidores: [Distribuidor_Class] = []
    private var distribuidores_mostrar: [Distribuidor_Class] = []
    private var estados: [String] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let logoImage:UIImage = UIImage(named: "icon_mexar")!
        self.navigationItem.titleView = UIImageView(image: logoImage)
        
        self.tableView_Estados.delegate = self
        self.tableView_Estados.dataSource = self
        self.tableView_Estados.isHidden = true
        
        self.tableView_Distribuidores.delegate = self
        self.tableView_Distribuidores.dataSource = self
        self.tableView_Distribuidores.isHidden = true
        self.tableView_Distribuidores.tableFooterView = UIView(frame: .zero)
        self.tableView_Distribuidores.backgroundColor = UIColor.clear
        //self.piezaTable.delegate = self
        //self.piezaTable.dataSource = self
        //self.piezaTable.isHidden = true
        
        getDistribuidores()
        getEstados()
        
        
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

    @IBAction func btn_estado_click(_ sender: Any) {
        self.tableView_Estados.isHidden = !self.tableView_Estados.isHidden
        
    }
    
    
    
    func getDistribuidores()
    {
        ////
        
        self.distribuidores.removeAll()
        
        if let bundlePath = Bundle.main.url(forResource: "distribuidores", withExtension: "json"){
            do {
                //let data = try Data(contentsOf: bundlePath)
                let text2 = try String(contentsOf: bundlePath, encoding: .utf8)
                
                
                
                //////
                
                let list: Array<Distribuidores> = Mapper<Distribuidores>().mapArray(JSONString: text2)!
                let curPres: Array<Distribuidor> = (list.first?.distribuidores)!
                
                for curPre: Distribuidor in curPres{
                    
                    if let cur_pre_data = curPre.distribuidor{
                        let name: String = cur_pre_data.name!
                        let id: Int = cur_pre_data.id!
                        //let clave: String = cur_pre_data.clave!
                        let comercial_name: String = cur_pre_data.comercial_name!
                        let state: String = cur_pre_data.state!
                        let city: String = cur_pre_data.city!
                        let address: String = cur_pre_data.address!
                        let interior: String = cur_pre_data.interior!
                        let exterior: String = cur_pre_data.exterior!
                        let colonia: String = cur_pre_data.colonia!
                        let cp: String = cur_pre_data.cp!
                        let phone1: String = cur_pre_data.phone1!
                        let phone2: String = cur_pre_data.phone1!
                        var lat: String = cur_pre_data.lat!
                        var lng: String = cur_pre_data.lng!
                        
                        if (lat.count == 0) {lat = "0.0"}
                        if (lng.count == 0) {lng = "0.0"}
                        
                        
                        
                        let new_pre = Distribuidor_Class()
                        new_pre.setId(id: id)
                        new_pre.setName(name: name)
                        new_pre.setComercial_Name(dato: comercial_name)
                        new_pre.setState(dato: state)
                        new_pre.setCity(dato: city)
                        new_pre.setAddress(dato: address)
                        new_pre.setInterior(dato: interior)
                        new_pre.setExterior(dato: exterior)
                        new_pre.setColonia(dato: colonia)
                        new_pre.setCP(dato: cp)
                        new_pre.setPhone1(dato: phone1)
                        new_pre.setPhone2(dato: phone2)
                        new_pre.setLat(dato: Double(lat)!)
                        new_pre.setLng(dato: Double(lng)!)
                        
                        self.distribuidores.append(new_pre)
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
    
    func getEstados(){
        
        self.estados.removeAll()
        
        for curDis: Distribuidor_Class in self.distribuidores{
            let curEstado: String = curDis.getState()
        
            if (!self.estados.contains(curEstado)){
                self.estados.append(curEstado)
            }
        
    }
        self.estados.sort()
        
    }
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int
        {
            
            var curItems :Int = 0
            if (tableView == self.tableView_Estados)
            {
                curItems = estados.count
            }

            
            if (tableView == self.tableView_Distribuidores){
                curItems = distribuidores_mostrar.count
                
            }
            
         //   if (tableView == self.presentacionTable)
         //   {
         //       curItems = presentaciones.count
         //   }
            
           return curItems
            
        }
        
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        {
            
            
            
            // let cell =  productsCell(style: UITableViewCellStyle.default, reuseIdentifier: "myIdentifier")
            
            if (tableView == self.tableView_Estados)
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "dropDownTableViewCell", for: indexPath) as! dropDownTableView
                let curEstado = estados[indexPath.row]
                
                cell.labelCell.text = curEstado
                return cell
            }
            
            
             if (tableView == self.tableView_Distribuidores){

                let cell = tableView.dequeueReusableCell(withIdentifier: "distribuidoresCell", for: indexPath) as! DistribuidoresCell
                let curDistribuidor = distribuidores_mostrar[indexPath.row]
                
                var curAddress: String = ""
                cell.label_nombre.text = curDistribuidor.getName()
                cell.label_ciudad.text = curDistribuidor.getCity()
                
                curAddress.append(curDistribuidor.getAddress())
                curAddress.append(" ")
                curAddress.append(curDistribuidor.getExterior())
                curAddress.append(" ")
                
                if (curDistribuidor.getInterior().count>1){
                    curAddress.append(curDistribuidor.getInterior())
                    curAddress.append(" ")
                }
              curAddress.append("Col. ")
              curAddress.append(curDistribuidor.getColonia())
              curAddress.append(",")
              curAddress.append(curDistribuidor.getCity())
              curAddress.append(",")
              curAddress.append(curDistribuidor.getState())
                
                cell.label_direccion.text = curAddress
                cell.label_telefonos.text = curDistribuidor.getPhone1() + " " + curDistribuidor.getPhone2()
                cell.contentView.backgroundColor = UIColor.clear
                return cell
            }
            
            return UITableViewCell()
            
           }
        
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            //let curItem: String = items[indexPath.row]
            if (tableView == self.tableView_Estados)
            {
                
                let curEstado = estados[indexPath.row]
                
                cargaDistrubuidoresAMostrar(estado: curEstado)
                
                UIView.performWithoutAnimation {
                    self.btn_estado.setTitle(curEstado, for: .normal)
                    self.btn_estado.layoutIfNeeded()
                }
                self.tableView_Estados.isHidden = true
                self.tableView_Distribuidores.reloadData()
                
                self.tableView_Distribuidores.setContentOffset(CGPoint.zero, animated: false)
                self.tableView_Distribuidores.isHidden = false
            }
            /*
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
            */
            
        }
        
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            
            var curSize :CGFloat = 0.0
            if (tableView == self.tableView_Estados){
                curSize = 22
            }
            
            if (tableView == self.tableView_Distribuidores){
                curSize = 140
            }
            
            
            return curSize
        }
        
    
    func cargaDistrubuidoresAMostrar(estado: String)
    {
        
        self.distribuidores_mostrar.removeAll()
        
        // for curPre: Distribuidor in curPres{
        for curDistribuidor: Distribuidor_Class in self.distribuidores{
            
            let curEstado = curDistribuidor.getState()
            if (estado == curEstado)
            {
                self.distribuidores_mostrar.append(curDistribuidor)
            }
            
        }
        
        
    }
    
        
}
