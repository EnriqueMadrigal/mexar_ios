//
//  calcsController.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 01/06/18.
//  Copyright © 2018 datalabor.com.mx. All rights reserved.
//

import UIKit

class calcsController: UIViewController {

    public weak var delegate: calculadoraDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        
        if segue.identifier == "showFontaneria"{
            
            if let curType = sender as! Int?{
                
                let fontaneriaViewController = segue.destination as! fontaneriaController
                fontaneriaViewController.curType = curType
                
                
            }
        }
        
    }
 

    
    @IBAction func cedula40_click(_ sender: Any) {
        let curType: Int = 1
        //performSegue(withIdentifier: "showFontaneria", sender: curType)
        delegate?.showCalculador(curType: curType)
        
    }
    
    
    @IBAction func cedula80_click(_ sender: Any) {
        let curType: Int = 2
        //performSegue(withIdentifier: "showFontaneria", sender: curType)
        delegate?.showCalculador(curType: curType)
    }
    
    
    @IBAction func conduit_click(_ sender: Any) {
        let curType: Int = 3
        //performSegue(withIdentifier: "showFontaneria", sender: curType)
        delegate?.showCalculador(curType: curType)
    }
    
    @IBAction func sanitario_click(_ sender: Any) {
        let curType: Int = 5
        //performSegue(withIdentifier: "showFontaneria", sender: curType)
        delegate?.showCalculador(curType: curType)
    }
    
    @IBAction func sinpresion_click(_ sender: Any) {
        let curType: Int = 4
        //performSegue(withIdentifier: "showFontaneria", sender: curType)
        delegate?.showCalculador(curType: curType)
    }
    
    @IBAction func cpvc_click(_ sender: Any) {
        let curType: Int = 6
        //performSegue(withIdentifier: "showFontaneria", sender: curType)
        delegate?.showCalculador(curType: curType)
        
    }
    
}
