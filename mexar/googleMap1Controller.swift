//
//  googleMap1Controller.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 07/01/18.
//  Copyright © 2018 datalabor.com.mx. All rights reserved.
//

import UIKit
import GoogleMaps
import ObjectMapper


class googleMap1Controller: UIViewController {

      private var distribuidores: [Distribuidor_Class] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        getDistribuidores()
        let camera = GMSCameraPosition.camera(withLatitude: 20.539298, longitude: -100.8053328, zoom: 5.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        mapView.isMyLocationEnabled = true
        view = mapView
       
        for curDistribuidor: Distribuidor_Class in self.distribuidores{
           
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: curDistribuidor.getLat(), longitude: curDistribuidor.getLng())
            marker.title = curDistribuidor.getName()
            marker.snippet = curDistribuidor.getComercial_Name()
            marker.map = mapView
            
            
        }
        
        
        
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
    
}
