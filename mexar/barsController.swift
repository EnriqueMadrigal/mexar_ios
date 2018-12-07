//
//  barsController.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 19/07/18.
//  Copyright © 2018 datalabor.com.mx. All rights reserved.
//

import UIKit
import BarcodeScanner
import ObjectMapper


class barsController: UIViewController,BarcodeScannerCodeDelegate, BarcodeScannerErrorDelegate, BarcodeScannerDismissalDelegate {

    @IBOutlet weak var ar_button: UIButton!
    
    public weak var delegate: ProductDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if #available(iOS 11.3, *){
            self.ar_button.isEnabled = true
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

    @IBAction func barcode_click(_ sender: Any) {
        let controller = BarcodeScannerController()
        controller.codeDelegate = self
        controller.errorDelegate = self
        controller.dismissalDelegate = self
        
        BarcodeScanner.Info.text = "Por favor coloque el cuadro en el código de barras que desea escanear"
        
        present(controller, animated: true, completion: nil)
        
        
        
        
        
        //performSegue(withIdentifier: "showBarCode", sender: nil)
    }
    
    @IBAction func ar_click(_ sender: Any) {
        performSegue(withIdentifier: "showAr", sender: nil)
    }
    
    
    func barcodeScanner(_ controller: BarcodeScannerController, didReceiveError error: Error) {
        print(error)
    }
    
    func barcodeScanner(_ controller: BarcodeScannerController, didCaptureCode code: String, type: String) {
        controller.dismiss(animated: true, completion: nil)
        print(code)
        
        let curProductId = SearchBarCode(codebar: code)
        
        if (curProductId != 0)
        {
            let curProduct = getProductsSearch(curId: curProductId)
            
            debugPrint(curProduct.getName())
            //let sb = UIStoryboard(name: "Main", bundle: nil)
            
           // let mainController = sb.instantiateViewController(withIdentifier: "productDetailController") as! productDetailController
            //mainController.curProduct = curProduct
            //let NavMainController: navMainController = navMainController(rootViewController: mainController)
            //NavMainController.setToolbarHidden(false, animated: false)
            
            //self.present(NavMainController, animated: true, completion: nil)
            self.delegate?.showProduct(curProduct: curProduct)
            
        }
        
    }
    
    
    func barcodeScannerDidDismiss(_ controller: BarcodeScannerController) {
        print ("Exit")
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    /////
    func SearchBarCode(codebar :String)->Int
    {
        
        var searchedProduct: Int = 0
        
        if let bundlePath = Bundle.main.url(forResource: "barcodes", withExtension: "json"){
            do {
                //let data = try Data(contentsOf: bundlePath)
                let text2 = try String(contentsOf: bundlePath, encoding: .utf8)
                
                
                
                //////
                
                let list: Array<Barcodes> = Mapper<Barcodes>().mapArray(JSONString: text2)!
                let curProducts: Array<Barcode> = (list.first?.barcodes)!
                
                for curProduct: Barcode in curProducts{
                    
                    if let cur_barcode_data = curProduct.barcode{
                        
                        //let id : Int = cur_barcode_data.id!
                        let product_id = cur_barcode_data.product_id!
                        let code: String = cur_barcode_data.code!
                        
                        if (code == codebar){
                            searchedProduct = product_id
                            break
                        }
                        
                        
                        
                    }
                    
                }
                
                ////
                
            }
                
            catch {
                print(error)
                return searchedProduct
            }
            
            
            
        }
        
        return searchedProduct
    }
    
    
    ///////////
    
    func getProductsSearch(curId :Int)->Product_Class
    {
        
        var searchedProduct: Product_Class!
        
        if let bundlePath = Bundle.main.url(forResource: "productos", withExtension: "json"){
            do {
                //let data = try Data(contentsOf: bundlePath)
                let text2 = try String(contentsOf: bundlePath, encoding: .utf8)
                
                
                
                //////
                
                let list: Array<Productos> = Mapper<Productos>().mapArray(JSONString: text2)!
                let curProducts: Array<Producto> = (list.first?.productos)!
                
                for curProduct: Producto in curProducts{
                    
                    if let cur_product_data = curProduct.producto{
                        
                        
                        let newProduct = Product_Class()
                        newProduct.setId(dato: cur_product_data.id!)
                        newProduct.setName(dato: cur_product_data.name!)
                        newProduct.setIdSubCategoria(dato: cur_product_data.idsubcategoria!)
                        newProduct.setDesc(dato: cur_product_data.desc!)
                        newProduct.setDesc_Completa(dato: cur_product_data.desc_completa!)
                        newProduct.setPresentaciones(datos: cur_product_data.presentaciones!)
                        newProduct.setImages(datos: cur_product_data.images!)
                        newProduct.setResName(dato: cur_product_data.resname!)
                        newProduct.setFichaTecnica(dato: cur_product_data.ficha_tecnica!)
                        newProduct.setRedes(dato: cur_product_data.redes!)
                        newProduct.setAplicaciones(datos: cur_product_data.aplicaciones!)
                        newProduct.setEspecificaciones(datos: cur_product_data.especificaciones!)
                        newProduct.setCaracteristicas(datos: cur_product_data.caracteristicas!)
                        newProduct.setColors(datos: cur_product_data.colors!)
                        newProduct.setAdhieres(datos: cur_product_data.adhieres!)
                        newProduct.setVentajas(datos: cur_product_data.ventajas!)
                        newProduct.setUsos(datos: cur_product_data.usos!)
                        newProduct.setNota(dato: cur_product_data.nota!)
                        
                        
                        if (newProduct.getId() == curId){
                            searchedProduct = newProduct
                            break
                        }
                        
                        
                        
                    }
                    
                }
                
                ////
                
            }
                
            catch {
                print(error)
                return searchedProduct
            }
            
            
            
        }
        
        return searchedProduct
    }
    
    
}
