//
//  googleMap3Controller.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 08/01/18.
//  Copyright © 2018 datalabor.com.mx. All rights reserved.
//

import UIKit
import GoogleMaps
import ObjectMapper


class googleMap3Controller: UIViewController {
    
    private var distribuidores: [Distribuidor_Class] = []

    public var curDistribuidor: Distribuidor_Class!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        if ((curDistribuidor) != nil)
        {
       
        let camera = GMSCameraPosition.camera(withLatitude: curDistribuidor.getLat(), longitude: curDistribuidor.getLng(), zoom: 12.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        mapView.isMyLocationEnabled = true
        view = mapView
        
        
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
    
    
   
}

