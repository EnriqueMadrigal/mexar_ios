//
//  productsController.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 29/11/17.
//  Copyright © 2017 datalabor.com.mx. All rights reserved.
//

import UIKit
import ObjectMapper

class productsController: UIViewController, UITableViewDelegate,  UITableViewDataSource {

      public weak var delegate: ProductDelegate?
    @IBOutlet weak var tableViewProducts: UITableView!
    
     public var curSubCategoria: Int!
    public var curBusqueda: String!
    
    var products: [Product_Class] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.tableViewProducts.delegate = self
        self.tableViewProducts.dataSource  = self
        
        self.tableViewProducts.rowHeight = UITableViewAutomaticDimension
        self.tableViewProducts.estimatedRowHeight = 230
        self.tableViewProducts.separatorColor = UIColor.clear
        
        
        //let logoImage:UIImage = UIImage(named: "icon_mexar")!
        //self.navigationItem.titleView = UIImageView(image: logoImage)
        //self.navigationController!.navigationBar.topItem!.title = "Regresar"
        
        self.products = [Product_Class]()
        if (curBusqueda != nil)
        {
         getProductsSearch(searchString: curBusqueda)
        }
        else{
        getProducts()
        }
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 //showProductDetail
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    
        if segue.identifier == "showProductDetail"{
            
            if let curProduct = sender as! Product_Class?{
                
                let productsDetailViewController = segue.destination as! productDetailController
                
                productsDetailViewController.curProduct = curProduct
                
            }
        }
    
    
    }
    

    
    
    func getProducts()
    {
        
        self.products.removeAll()
        
        if let bundlePath = Bundle.main.url(forResource: "productos", withExtension: "json"){
            do {
                //let data = try Data(contentsOf: bundlePath)
                let text2 = try String(contentsOf: bundlePath, encoding: .utf8)
                
                
                
                //////
                
                let list: Array<Productos> = Mapper<Productos>().mapArray(JSONString: text2)!
                let curProducts: Array<Producto> = (list.first?.productos)!
                
                for curProduct: Producto in curProducts{
                    
                    if let cur_product_data = curProduct.producto{
                        
                        let SubCategoria = cur_product_data.idsubcategoria
                        
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
                        newProduct.setSeguridades(datos: cur_product_data.seguridades!)
                        newProduct.setPrecauciones(dato: cur_product_data.precauciones!)
                        newProduct.setAlmacenaje(dato: cur_product_data.almacen!)
                        
                        
                        if (SubCategoria == self.curSubCategoria)
                        {
                        self.products.append(newProduct)
                        }
                        
                        
                    }
                    
                }
                
                ////
                
            }
                
            catch {
                print(error)
                return
            }
            
            
            
        }
    }

    
    func getProductsSearch(searchString :String)
    {
        
        self.products.removeAll()
        
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
                        
                        
                        let busqueda1 = cur_product_data.name!
                        let busqueda2 = cur_product_data.desc_completa!
                        
                        let busqueda1l = busqueda1.lowercased()
                        let busqueda2l = busqueda2.lowercased()
                        let busquedaActual = searchString.lowercased()
                    
                        
                        if ((busqueda1l.range(of: busquedaActual) != nil) || (busqueda2l.range(of: busquedaActual) != nil)) {
                            self.products.append(newProduct)
                            
                        }
                        
                        
                        
                    }
                    
                }
                
                ////
                
            }
                
            catch {
                print(error)
                return
            }
            
            
            
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        
        return products.count
        
    }
    
    
    //productsCells
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        
        
        // let cell =  productsCell(style: UITableViewCellStyle.default, reuseIdentifier: "myIdentifier")
        let cell = tableView.dequeueReusableCell(withIdentifier: "productsCells", for: indexPath) as! productsCells
        
        let cur_product = products[indexPath.row]
        
        cell.label_name.text = cur_product.getName()
        cell.label_desc.text = cur_product.getDesc()
        
        let filename = cur_product.getResName()
        
       // let bundlePath = Bundle.main.path(forResource: filename, ofType: "png")
        
        let imageNoDisp = UIImage(named: filename)
        
        if ((imageNoDisp) != nil){
            cell.product_image.image = imageNoDisp
            
        }
            
        else
        {
            
            cell.product_image.image = UIImage(named: "placeholder")
            
        }
        
        
        
        return cell
    }
    /*
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
 
            return 130.0
      
    }
     */
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        debugPrint(indexPath.row)
        
        let curProduct = products[indexPath.row]
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        //    debugPrint("Se seleecion \(curProduct.getId())")
        
        
        debugPrint("Se seleecion \(curProduct.getId())")
        
        //performSegue(withIdentifier: "showProductDetail", sender: curProduct)
        
        delegate?.showProduct(curProduct: curProduct)
       
        
        
        
    }
    

    
    
}
