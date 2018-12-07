//
//  subCategorias.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 29/11/17.
//  Copyright © 2017 datalabor.com.mx. All rights reserved.
//

import UIKit
import ObjectMapper

class subCategorias: UIViewController,  UITableViewDelegate,  UITableViewDataSource {

     public weak var delegate: SubCategoriesDelegate?
    @IBOutlet weak var tableViewSubCategorias: UITableView!
    
    public var curCategoria: Int!
    private var subcategorias: [SubCategory_Class] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.tableViewSubCategorias.delegate = self
        self.tableViewSubCategorias.dataSource  = self
        
        //self.tableViewSubCategorias.rowHeight = UITableViewAutomaticDimension
        self.tableViewSubCategorias.estimatedRowHeight = 100
        self.tableViewSubCategorias.separatorColor = UIColor.clear

        
       // let logoImage:UIImage = UIImage(named: "icon_mexar")!
        //self.navigationItem.titleView = UIImageView(image: logoImage)
        //self.navigationController!.navigationBar.topItem!.title = "Regresar"
        
        self.subcategorias = [SubCategory_Class]()
        getSubCategories()
        
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
        
        
        
        
        if segue.identifier == "showProducts"{
            
            if let curCategoriaId = sender as! Int?{
                
                let productsViewController = segue.destination as! productsController
                
                productsViewController.curSubCategoria = curCategoriaId
                
            }
        }
        
    }
   

    
    func getSubCategories()
    {
        
        self.subcategorias.removeAll()
        
        if let bundlePath = Bundle.main.url(forResource: "subcategorias", withExtension: "json"){
            do {
                //let data = try Data(contentsOf: bundlePath)
                let text2 = try String(contentsOf: bundlePath, encoding: .utf8)
                
                
                
                //////
                
                let list: Array<SubCategorias> = Mapper<SubCategorias>().mapArray(JSONString: text2)!
                let curCats: Array<SubCategoria> = (list.first?.subcategorias)!
                
                for curCat: SubCategoria in curCats{
                    
                    if let cur_cat_data = curCat.subcategoria{
                        let name: String = cur_cat_data.name!
                        let id: Int = cur_cat_data.id!
                        let subcategoria: Int = cur_cat_data.idcategoria!
                        let desc: String = cur_cat_data.desc!
                        let resname: String = cur_cat_data.resname!
                        
                        let new_Subcategory = SubCategory_Class()
                        new_Subcategory.setId(id: id)
                        new_Subcategory.setDesc(desc: desc)
                        new_Subcategory.setName(name: name)
                        new_Subcategory.setResName(resname: resname)
                        new_Subcategory.setIdCategoria(idcategoria: subcategoria)
                        
                        if (subcategoria == curCategoria)
                        {
                        self.subcategorias.append(new_Subcategory)
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
        
        return subcategorias.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
   
        
        // let cell =  productsCell(style: UITableViewCellStyle.default, reuseIdentifier: "myIdentifier")
        let cell = tableView.dequeueReusableCell(withIdentifier: "subcategoriasCells", for: indexPath) as! subcategoriasCells
        
        let cur_category = subcategorias[indexPath.row]
        
        cell.label_subcategoria.text = cur_category.getName()
        
        let filename: String = cur_category.getResName()
        
        //let bundlePath = Bundle.main.path(forResource: filename, ofType: "png")
        let imageNoDisp = UIImage(named: filename)
        
        if ((imageNoDisp) != nil){
            cell.icon_subcategoria.image = imageNoDisp
            
        }
        
        else
        {
            
            cell.icon_subcategoria.image = UIImage(named: "placeholder")
            
        }
        
        
        
        return cell
    }
   
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         //   let curImageWidth: CGFloat = common.SCREEN_WIDTH * 0.45
       //     let curImageHeight: CGFloat = (curImageWidth * 0.55) + 18
            
     //  return curImageHeight
     return 100.0
     }
  
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        debugPrint(indexPath.row)
        
        let curCategoria = subcategorias[indexPath.row]
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        //    debugPrint("Se seleecion \(curProduct.getId())")
        
        let curId: Int = curCategoria.getId()
       // let curSubCategoria: Int = curCategoria.getIdCategoria()
        
        debugPrint("Se seleecion \(curCategoria.getId())")
        
        //performSegue(withIdentifier: "showProducts", sender: curId)
        delegate?.showSubCategoria(subCat: curId)
        
      
        
        
        
    }

    
    
    
    
}
