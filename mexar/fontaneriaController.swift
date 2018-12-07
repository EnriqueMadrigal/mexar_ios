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

    public weak var delegate: ProductDelegate?
    
    @IBOutlet weak var btn_presentacion: UIButton!
    @IBOutlet weak var btn_pieza: UIButton!
    @IBOutlet weak var image_union: UIImageView!
   
  
 
    @IBOutlet var curView: UIView!
    
  
    
    private var presentacionTable: UITableView!
    private var piezaTable: UITableView!
    
    @IBOutlet weak var label_cantidad: UILabel!
    @IBOutlet weak var label_uniones: UILabel!
    @IBOutlet weak var tableView1: UITableView!
    
    private var presentaciones: [Presentation_Class] = []
    private var piezas: [Pieza_Class] = []
    private var productos: [Calc_Product_Class] = []
    private var productos_display: [Calc_Product_Class] = []
    
    private var cur_pre: Int = 0
    private var cur_pza: Int = 0
    
    public var curType: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
       
       // let logoImage:UIImage = UIImage(named: "icon_mexar")!
       // self.navigationItem.titleView = UIImageView(image: logoImage)
       // self.navigationController!.navigationBar.topItem!.title = "Regresar"
        
        
        
        let originBtnPresentacion = self.btn_presentacion.frame.origin
        let heightBtnPresentation = self.btn_presentacion.frame.height
        let widthBtnPresentation = self.btn_presentacion.frame.width
        
        let rect1 = CGRect(x: originBtnPresentacion.x, y: originBtnPresentacion.y + heightBtnPresentation - 64, width: widthBtnPresentation, height: 120)
        
        presentacionTable = UITableView(frame: rect1, style: .plain)
        presentacionTable.register(UITableViewCell.self, forCellReuseIdentifier: "presentationCell")

        
        
        let originBtnPieza = self.btn_pieza.frame.origin
        let heightBtnPieza = self.btn_pieza.frame.height
        let widthBtnPieza = self.btn_pieza.frame.width
        
        let rect2 = CGRect(x: originBtnPieza.x, y: originBtnPieza.y + heightBtnPieza - 64, width: widthBtnPieza, height: 120)
        
        piezaTable = UITableView(frame: rect2, style: .plain)
        piezaTable.register(UITableViewCell.self, forCellReuseIdentifier: "piezaCell")
        
        self.curView.addSubview(piezaTable)
        self.curView.addSubview(presentacionTable)
        
        
        
        self.tableView1.delegate = self
        self.tableView1.dataSource = self
        
        self.presentacionTable.delegate = self
        self.presentacionTable.dataSource = self
        self.presentacionTable.bounces = false
        //self.presentacionTable.rowHeight = UITableViewAutomaticDimension
        //self.presentacionTable.estimatedRowHeight = 20
        self.presentacionTable.isHidden = true
        
        self.piezaTable.delegate = self
        self.piezaTable.dataSource = self
        self.piezaTable.isHidden = true
        self.piezaTable.bounces = false
        
        
        getPresentations()
        getPiezas()
        getProducts()
        Calcular()
        
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
        
        if segue.identifier == "showCurProduct"{
            
            if let curProduct = sender as! Product_Class?{
                
                let productsDetailViewController = segue.destination as! productDetailController
                
                productsDetailViewController.curProduct = curProduct
                
            }
        }
        
    }
    
    
  

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
        
        if (tableView) == self.tableView1{
            curItems = productos_display.count
        }
        
        return curItems
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        
        
        // let cell =  productsCell(style: UITableViewCellStyle.default, reuseIdentifier: "myIdentifier")
       //let cell = tableView.dequeueReusableCell(withIdentifier: "dropDownTableViewCell", for: indexPath) as! dropDownTableView
        
        if (tableView == self.presentacionTable)
        {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "presentationCell", for: indexPath as IndexPath)
            let curPresentation = presentaciones[indexPath.row]
            cell.textLabel?.text = curPresentation.getName()
            cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
            return cell

        }
        
        if (tableView == self.piezaTable)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "piezaCell", for: indexPath as IndexPath)
            let curPieza = piezas[indexPath.row]
          cell.textLabel?.text = curPieza.getName()
            cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
            return cell
        }
            
        
        if (tableView == self.tableView1)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "calcProductCell", for: indexPath as IndexPath) as! calcProductCell
            
            let curProduct = productos_display[indexPath.row]
            cell.product_label?.text = curProduct.getName()
            //////
            let filename = curProduct.getPress3()
            //let bundlePath = Bundle.main.path(forResource: filename, ofType: "png")
            
            
            let imageNoDisp = UIImage(named: filename)
            
            if ((imageNoDisp) != nil){
                cell.image1.image = imageNoDisp
                
            }
                
            else
            {
                
                cell.image1.image = UIImage(named: "placeholder")
                
            }
            
            
            
            
            //////
            return cell
        }
        
        
        
        return UITableViewCell()
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
            Calcular()
        }
        
        if (tableView == self.piezaTable)
        {
         
            let curPieza = piezas[indexPath.row]
            self.cur_pza = indexPath.row + 1
            var curImage: UIImage!
            
            /////
            let filename: String = curPieza.getResName()
            
            curImage = UIImage(named: filename)
            
            if ((curImage) == nil){
                curImage = UIImage(named: "placeholder")
                
            }
            
            ////
            
            
            UIView.performWithoutAnimation {
                self.btn_pieza.setTitle(curPieza.getName(), for: .normal)
                self.image_union.image = curImage
                self.image_union.layoutIfNeeded()
                self.btn_pieza.layoutIfNeeded()
            }
            self.piezaTable.isHidden = true
            Calcular()
            
        }
        
        
        if (tableView == self.tableView1){
            
            tableView.deselectRow(at: indexPath, animated: true)
            let curIdProduct = productos_display[indexPath.row]
            let curProduct = getProduct(productId: curIdProduct.getId())
             //performSegue(withIdentifier: "showCurProduct", sender: curProduct)
            self.delegate?.showProduct(curProduct: curProduct)
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (tableView == tableView1){
            return 98
        }
        
        return 22.0
        
        
    }
    
    
    @IBAction func btn_presentacion_click(_ sender: Any) {
        self.piezaTable.isHidden = true
        self.presentacionTable.isHidden = !self.presentacionTable.isHidden
        //debugPrint("Presentacion")
        
    }
    
    @IBAction func btn_pieza_click(_ sender: Any) {
        self.presentacionTable.isHidden = true
         self.piezaTable.isHidden = !self.piezaTable.isHidden
        //debugPrint("Pieza")
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
                
                let curPresentation = self.presentaciones[0]
                self.btn_presentacion.setTitle(curPresentation.getName(), for: .normal)
                self.cur_pre = 1
                
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
        var filename: String = "piezas"
        
        if (self.curType == 6){
            filename = "piezas_cpvc"
        }
        
        if let bundlePath = Bundle.main.url(forResource: filename, withExtension: "json"){
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
                        let productos: [Int] = cur_pre_data.productos!
                        
                        let new_pre = Pieza_Class()
                        new_pre.setId(id: id)
                        new_pre.setName(name: name)
                        new_pre.setResName(resname: resname)
                        new_pre.setProductos(datos: productos)
                        self.piezas.append(new_pre)
                    }
                    
                }
                let curPieza = self.piezas[0]
                 self.btn_pieza.setTitle(curPieza.getName(), for: .normal)
                
                var curImage: UIImage!
                
                /////
                let filename: String = curPieza.getResName()
                
                curImage = UIImage(named: filename)
                
                if ((curImage) == nil){
                    curImage = UIImage(named: "placeholder")
                }
                self.image_union.image = curImage
                self.cur_pza = 1
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
    
    private func Calcular(){
        let curCalculo: String = self.getCalculo(presentacion: cur_pre, pieza: cur_pza)
        let curPieza = piezas[cur_pza - 1]
         var curProducts: [Int] = []
        
        
        self.label_uniones.text = "Uniones"
        
        if (curCalculo == "1"){
            self.label_uniones.text = "Unión"
        }
        
        if (curCalculo.range(of: "/") != nil){
            self.label_uniones.text = "de Unión"
        }
        
        self.label_cantidad.text = curCalculo
        
        
        
        let jsonpiezas: [Pieza_Class] = getPiezasJson()
        
        for cur_pieza: Pieza_Class in jsonpiezas{
            
            if (cur_pieza.getId() == cur_pza){
                curProducts = cur_pieza.getProductos()
            }
        }
        
        
        
      //  let curProducts: [Int] = curPieza.getProductos()
        
        
        productos_display.removeAll()
        
        for curProduct: Int in curProducts{
        
            for product: Calc_Product_Class in self.productos{
                if (product.getId() == curProduct){
                    productos_display.append(product)
                }
                
                
            }
        
        }
        self.tableView1.reloadData()
        
        
    }
    
    /*
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
        
        
        
        let formatedString = NSMutableAttributedString()
        let attrs1 = [NSFontAttributeName : UIFont.systemFont(ofSize: 14), NSForegroundColorAttributeName : UIColor.black]
        let attrs2 = [NSFontAttributeName : UIFont.systemFont(ofSize: 14), NSForegroundColorAttributeName : UIColor.mexar_gray1()]
        
        let Content1 = NSMutableAttributedString(string: "El cemento Contact 202 en presentanción de: ", attributes: attrs1)
        let Content2 = NSMutableAttributedString(string: curPresentation.getName(), attributes: attrs2)
        let Content3 = NSMutableAttributedString(string: " Rinde para: ", attributes: attrs1)
        let Content4 = NSMutableAttributedString(string: curCalculo + " ", attributes: attrs2)
        
        var newText = curPieza.getName()
        
        
        if (curCalculo != "1"){
        newText = newText.replacingOccurrences(of: "Union", with: "Uniones")
        }
        
        let Content5 = NSMutableAttributedString(string: newText, attributes: attrs1)
        
        formatedString.append(Content1)
        formatedString.append(Content2)
        formatedString.append(Content3)
        formatedString.append(Content4)
        formatedString.append(Content5)
        
        self.textView1.attributedText = formatedString
       
        
        self.label_equal.text = "="
        self.label_uniones.text = curCalculo
        self.label_cantidad.text = "1"
        
        var curfileName: String = "contact202_1"
        if (cur_pre == 1){ curfileName = "contact202_1"}
        if (cur_pre == 2){ curfileName = "contact202_2"}
        if (cur_pre == 3){ curfileName = "contact202_3"}
        if (cur_pre == 4){ curfileName = "contact202_4"}
        if (cur_pre == 5){ curfileName = "contact202_5"}
        
        
        let bundlePath = Bundle.main.path(forResource: curfileName, ofType: "png")
        if (bundlePath != nil){
            self.image_presentation.image = UIImage(contentsOfFile: bundlePath!)
        }
        
        self.image_union.image = UIImage(named: "union")
    }
 
   */
    func showAlert(title: String, desc: String, btn:String)
    {
        
        let alertController = UIAlertController(title: title, message: desc, preferredStyle:UIAlertControllerStyle.alert)
        let ok = UIAlertAction(title: btn, style: UIAlertActionStyle.default, handler: nil)
        
        alertController.addAction(ok)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func presentation_drop(_ sender: Any) {
        self.piezaTable.isHidden = true
        self.presentacionTable.isHidden = !self.presentacionTable.isHidden
    }
    
    @IBAction func pieza_drop(_ sender: Any) {
        self.presentacionTable.isHidden = true
        self.piezaTable.isHidden = !self.piezaTable.isHidden
    }
    
    
    func getProducts()
    {
        
        self.productos.removeAll()
        
        if let bundlePath = Bundle.main.url(forResource: "calc_products", withExtension: "json"){
            do {
                //let data = try Data(contentsOf: bundlePath)
                let text2 = try String(contentsOf: bundlePath, encoding: .utf8)
                
                
                
                //////
                
                let list: Array<Calc_Productos> = Mapper<Calc_Productos>().mapArray(JSONString: text2)!
                let curProducts: Array<Calc_Producto> = (list.first?.productos)!
                
                for curProduct: Calc_Producto in curProducts{
                    
                    if let cur_product_data = curProduct.producto{
                        
                       
                        let newProduct = Calc_Product_Class()
                        newProduct.setId(dato: cur_product_data.id!)
                        newProduct.setName(dato: cur_product_data.name!)
                        newProduct.setPress1(dato: cur_product_data.pres1!)
                        newProduct.setPress2(dato: cur_product_data.pres2!)
                        newProduct.setPress3(dato: cur_product_data.pres3!)
                        newProduct.setPress4(dato: cur_product_data.pres4!)
                        newProduct.setPress5(dato: cur_product_data.pres5!)
                        
                        self.productos.append(newProduct)
                        
                        
                        
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
    
    func getProduct(productId: Int)->Product_Class{
        
        if let bundlePath = Bundle.main.url(forResource: "productos", withExtension: "json"){
            do {
                //let data = try Data(contentsOf: bundlePath)
                let text2 = try String(contentsOf: bundlePath, encoding: .utf8)
                
                
                
                //////
                
                let list: Array<Productos> = Mapper<Productos>().mapArray(JSONString: text2)!
                let curProducts: Array<Producto> = (list.first?.productos)!
                
                for curProduct: Producto in curProducts{
                    
                    if let cur_product_data = curProduct.producto{
                        
                        let curId = cur_product_data.id
                        
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
                        
                        
                        if (productId == curId)
                        {
                           return newProduct
                        }
                        
                        
                    }
                    
                }
                
                ////
                
            }
                
            catch {
                print(error)
                return Product_Class()
            }
            
            
            
        }
        
       
        return  Product_Class()
        
    }
    //////
    func getPiezasJson()->[Pieza_Class]
    {
        ////
        
        var curPiezas: [Pieza_Class] = []
        
        
        var filename: String = "piezas"
        if (self.curType == 1){ filename =  "cedula40"}
        else if (self.curType == 2){ filename =  "cedula80"}
        else if (self.curType == 3){ filename =  "conduit"}
        else if (self.curType == 4){ filename =  "sinpresion"}
        else if (self.curType == 5){ filename =  "sanitario"}
        else if (self.curType == 6){ filename =  "cpvc"}
        
        
        
        if let bundlePath = Bundle.main.url(forResource: filename, withExtension: "json"){
            do {
                let text2 = try String(contentsOf: bundlePath, encoding: .utf8)
                
                
                
                //////
                
                let list: Array<Piezas> = Mapper<Piezas>().mapArray(JSONString: text2)!
                let curPres: Array<Pieza> = (list.first?.piezas)!
                
                for curPre: Pieza in curPres{
                    
                    if let cur_pre_data = curPre.pieza{
                        let name: String = cur_pre_data.name!
                        let id: Int = cur_pre_data.id!
                        let resname: String = cur_pre_data.resname!
                        let productos: [Int] = cur_pre_data.productos!
                        
                        let new_pre = Pieza_Class()
                        new_pre.setId(id: id)
                        new_pre.setName(name: name)
                        new_pre.setResName(resname: resname)
                        new_pre.setProductos(datos: productos)
                        curPiezas.append(new_pre)
                    }
                    
                }
                
            }
                
            catch {
                print(error)
                return curPiezas
            }
            
           
            
        }
        
         return curPiezas
        
        ////
    }
    
    
    /////
    
}
