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

   
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //let logoImage:UIImage = UIImage(named: "icon_mexar")!
        //self.navigationItem.titleView = UIImageView(image: logoImage)
        //self.navigationController!.navigationBar.topItem!.title = "Regresar"
        
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showSucursal"{
            
            if let curDistribuidor = sender as! Distribuidor_Class?{
                
                let googlemapView = segue.destination as! googleMap3Controller
                googlemapView.curDistribuidor = curDistribuidor
                
            }
        }
        
        
    }

   
    
    
    @IBAction func btn_emailclick(_ sender: Any) {
        let email = "ventas.mexar@conquestind.com.mx"
        if let url = URL(string: "mailto:\(email)") {
            UIApplication.shared.openURL(url as URL)
        }
        
        
    }
    
   
    @IBAction func btn_callclick(_ sender: Any) {
        
        let phoneNumber:String = "3336563637"
        if let phoneCallURL = URL(string: "tel://\(phoneNumber)") {
            
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                UIApplication.shared.openURL(phoneCallURL as URL)
                //application.open(phoneCallURL, options:an [:], completionHandler: nil)
            }
        }
    }
    
    @IBAction func showMapa1(_ sender: Any) {
        
        let new_pre = Distribuidor_Class()
        new_pre.setId(id: 0)
        new_pre.setName(name: "Matrix Guadalajara")
        new_pre.setComercial_Name(dato: "Av. Camino a Bosque de San Isidro 2300")
        new_pre.setLat(dato: Double(20.759525))
        new_pre.setLng(dato: Double(-103.38258))
        performSegue(withIdentifier: "showSucursal", sender: new_pre)
        
    }
    
    @IBAction func showMapa2(_ sender: Any) {
        let new_pre = Distribuidor_Class()
        new_pre.setId(id: 0)
        new_pre.setName(name: "Mexico D.F.")
        new_pre.setComercial_Name(dato: "11 de Enero de 1861")
        new_pre.setLat(dato: Double(19.378725))
        new_pre.setLng(dato: Double(-99.066779))
        performSegue(withIdentifier: "showSucursal", sender: new_pre)
    }
    
    @IBAction func showMap3(_ sender: Any) {
        let new_pre = Distribuidor_Class()
        new_pre.setId(id: 0)
        new_pre.setName(name: "Monterrey")
        new_pre.setComercial_Name(dato: "ebastián Lerdo de Tejada 1222")
        new_pre.setLat(dato: Double(25.711059))
        new_pre.setLng(dato: Double(-100.32633))
        performSegue(withIdentifier: "showSucursal", sender: new_pre)
    }
    
    @IBAction func tutoriales_click(_ sender: Any) {
        let url = NSURL(string: "https://www.youtube.com/channel/UClb61WrMZ9xT5mMne_-9pMw")!
        UIApplication.shared.openURL(url as URL)
    }
    
}
