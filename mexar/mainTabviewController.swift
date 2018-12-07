//
//  mainTabviewController.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 18/07/18.
//  Copyright © 2018 datalabor.com.mx. All rights reserved.
//

import UIKit
import UserNotifications
import GoogleSignIn
import FacebookCore
import FacebookLogin


class mainTabviewController: UIViewController ,UISearchBarDelegate{

    @IBOutlet weak var curView: UIView!
    
    @IBOutlet weak var button_calculadora: UIButton!
    @IBOutlet weak var button_dist: UIButton!
    @IBOutlet weak var button_contacto: UIButton!
    @IBOutlet weak var button_scaner: UIButton!
    @IBOutlet weak var button_info: UIButton!
    
    lazy   var searchBar: UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 200, height: 22))
    
    private var IsSearchBarVisible: Bool = false
    var searchActive : Bool = false
    
    var categoriasViewController :mainController!
    var distribuidoresViewController: distController!
    var mexarDistribuidores: distribuidoresController!
    var homeDepotDistribuidores: homeDepotController!
    var barCodeEscaner: barsController!
    
    var contactoViewController: UIViewController!
    var calculadoraViewController: UIViewController!
    
     let notificationName2 = Notification.Name("logoutNT")
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        searchBar.placeholder = "Busqueda"
        searchBar.delegate = self

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        categoriasViewController = storyboard.instantiateViewController(withIdentifier: "mainController") as! mainController
        categoriasViewController.delegate = self
        
        distribuidoresViewController = storyboard.instantiateViewController(withIdentifier: "distController") as! distController
        distribuidoresViewController.delegate = self
        mexarDistribuidores = storyboard.instantiateViewController(withIdentifier: "distribuidoresController") as! distribuidoresController
        homeDepotDistribuidores = storyboard.instantiateViewController(withIdentifier: "homeDepotController") as! homeDepotController
        
        barCodeEscaner = storyboard.instantiateViewController(withIdentifier: "barsController") as! barsController
        barCodeEscaner.delegate = self
        
        setCurrentView(viewController: categoriasViewController)
        
        
        
        
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

    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true;
    }
    
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
        
        
        // HIde search Bar
        
       // let logoImage:UIImage = UIImage(named: "icon_mexar")!
       // self.navigationItem.titleView = UIImageView(image: logoImage)
        searchActive = false;
        
        IsSearchBarVisible = false
        
        
        /////
        
        let SearchString: String = (searchBar.text ?? "")
        //let filter_options: Filter_Options = Filter_Options()
        
        //filter_options.setSearchString(newSearch: SearchString)
        
        
        searchBar.text = ""
        searchProduct(searchString: SearchString)
     //   performSegue(withIdentifier: "searchProducts", sender: SearchString)
        
        debugPrint(SearchString)
        
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //debugPrint("Searching")
        
        
    }
    
    @IBAction func search_task(_ sender: Any) {
        
        if (!IsSearchBarVisible)
        {
            self.navigationItem.titleView = searchBar
            
        }
            
        else
        {
            
           // let logoImage:UIImage = UIImage(named: "icon_mexar")!
           // self.navigationItem.titleView = UIImageView(image: logoImage)
            self.navigationItem.titleView = nil
            searchActive = false;
        }
        
        IsSearchBarVisible = !IsSearchBarVisible
        
        
    }
  
    
   
    
    func setCurrentView(viewController: UIViewController){
        
        
        addChildViewController(viewController)
        
        viewController.view.frame = self.curView.bounds
        self.curView.addSubview(viewController.view)
        viewController.didMove(toParentViewController: self)
        
    }
    
    
    
    func searchProduct(searchString: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let productsViewController :productsController = storyboard.instantiateViewController(withIdentifier: "productsController") as! productsController
        productsViewController.curBusqueda = searchString
        productsViewController.delegate = self
        
        setCurrentView(viewController: productsViewController)
        
    }
    
    
    
    @IBAction func categorias_click(_ sender: Any) {
        setCurrentView(viewController: categoriasViewController)
        
    }
    
    
    @IBAction func distribuidores_click(_ sender: Any) {
        setCurrentView(viewController: distribuidoresViewController)
        
    }
    
    @IBAction func contacto_click(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let contactoViewController :contactoController = storyboard.instantiateViewController(withIdentifier: "contactoController") as! contactoController
        
        
        setCurrentView(viewController: contactoViewController)
        
    }
    
    @IBAction func calculadora_click(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let calculadoraViewController :calcsController = storyboard.instantiateViewController(withIdentifier: "calcsController") as! calcsController
        calculadoraViewController.delegate = self
        
        setCurrentView(viewController: calculadoraViewController)
        
    }
    
    @IBAction func escaner_click(_ sender: Any) {
        setCurrentView(viewController: barCodeEscaner)
    }
    
    
    @IBAction func cerrar_click(_ sender: Any) {
        
        let loginType: String = Utils.getStringKey(namekey: common.VAR_LOGIN_TYPE)
        
        if (loginType == "google"){
            GIDSignIn.sharedInstance().signOut()
        }
        
        if (loginType == "facebook"){
            let loginManager = LoginManager()
            loginManager.logOut()
            
        }
        
        
        let when = DispatchTime.now() + 2 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when) {  // Tiempo para permitir al menu que se cierre
            // Your code with delay
            NotificationCenter.default.post(name: self.notificationName2, object: nil)
            
        }
        
    }
    
    
}

extension mainTabviewController: CategoriesDelegate {
    func showSelected(newCat: Int) {
        debugPrint(newCat)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let subCategoriasViewController :subCategorias = storyboard.instantiateViewController(withIdentifier: "subCategorias") as! subCategorias
        subCategoriasViewController.curCategoria = newCat
        subCategoriasViewController.delegate = self
        
        setCurrentView(viewController: subCategoriasViewController)
    }
    
    
    
}


extension mainTabviewController: SubCategoriesDelegate {
    func showSubCategoria(subCat: Int) {
       
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let productsViewController :productsController = storyboard.instantiateViewController(withIdentifier: "productsController") as! productsController
        productsViewController.curSubCategoria = subCat
        productsViewController.delegate = self
        
        setCurrentView(viewController: productsViewController)
        
    }
    
   
    
}


extension mainTabviewController: ProductDelegate {
    func showProduct(curProduct: Product_Class) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let productsDetailViewController :productDetailController = storyboard.instantiateViewController(withIdentifier: "productDetailController") as! productDetailController
        
        productsDetailViewController.curProduct = curProduct
        
        setCurrentView(viewController: productsDetailViewController)
        
    }
    

}


extension mainTabviewController: calculadoraDelegate {
    func showCalculador(curType: Int) {
      
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let fontaneriaViewController :fontaneriaController = storyboard.instantiateViewController(withIdentifier: "fontaneriaController") as! fontaneriaController
        fontaneriaViewController.curType = curType
        fontaneriaViewController.delegate = self
        
        setCurrentView(viewController: fontaneriaViewController)
        
    }
    
    
    
    
}

extension mainTabviewController: distribuidoresDelegate {
    func showDistribuidor(curDist: Int) {
        if curDist == 1{
            setCurrentView(viewController: mexarDistribuidores)
        }
        
        else if curDist == 2 {
            setCurrentView(viewController: homeDepotDistribuidores)
        }
    }
    
    
}
    
    



protocol CategoriesDelegate: class {
    func showSelected(newCat :Int)
}

protocol SubCategoriesDelegate: class {
    func showSubCategoria(subCat :Int)
}

protocol ProductDelegate: class {
    func showProduct(curProduct: Product_Class)
}


protocol calculadoraDelegate: class {
    func showCalculador(curType: Int)
}

protocol distribuidoresDelegate: class {
    func showDistribuidor(curDist: Int)
}



