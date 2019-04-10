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
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var button_calculadora: UIButton!
    @IBOutlet weak var button_dist: UIButton!
    @IBOutlet weak var button_contacto: UIButton!
    @IBOutlet weak var button_scaner: UIButton!
    @IBOutlet weak var button_info: UIButton!
    
    
    var items: [[mainIcon_Class]]?
    
    var main_icons: [mainIcon_Class]?
    
    
    lazy   var searchBar: UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 200, height: 22))
    
    private var IsSearchBarVisible: Bool = false
    var searchActive : Bool = false
   
    let notificationName2 = Notification.Name("logoutNT")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        searchBar.placeholder = "Busqueda"
        searchBar.delegate = self

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let categoriasViewController = storyboard.instantiateViewController(withIdentifier: "mainController") as! mainController
        categoriasViewController.delegate = self
        
        setCurrentView(viewController: categoriasViewController)
        
        items = [[mainIcon_Class]]()
        main_icons = [mainIcon_Class]()
        
        
        let item1 = mainIcon_Class()
        item1.setId(id: 1)
        item1.setName(name: "Categorias")
        item1.setResName(resname: "icon_products")
        
        let item2 = mainIcon_Class()
        item2.setId(id: 2)
        item2.setName(name: "Dist")
        item2.setResName(resname: "icon_distribuidores")
        
        let item3 = mainIcon_Class()
        item3.setId(id: 3)
        item3.setName(name: "Home Depot")
        item3.setResName(resname: "icon_homedepot")
        
        
        let item4 = mainIcon_Class()
        item4.setId(id: 4)
        item4.setName(name: "Contacto")
        item4.setResName(resname: "icon_contacto")
        
        let item5 = mainIcon_Class()
        item5.setId(id: 5)
        item5.setName(name: "Calculadora")
        item5.setResName(resname: "icon_calculadora")
        
        let item6 = mainIcon_Class()
        item6.setId(id: 6)
        item6.setName(name: "Tutorial")
        item6.setResName(resname: "icon_youtube")
        
        let item7 = mainIcon_Class()
        item7.setId(id: 7)
        item7.setName(name: "Redes")
        item7.setResName(resname: "icon_redes")
       
        
        let item8 = mainIcon_Class()
        item8.setId(id: 8)
        item8.setName(name: "Lector B.")
        item8.setResName(resname: "icon_bars")
        
        let item9 = mainIcon_Class()
        item9.setId(id: 9)
        item9.setName(name: "Usuario")
        item9.setResName(resname: "icon_user")
        
        
        
        main_icons?.append(item1)
        main_icons?.append(item2)
        main_icons?.append(item3)
        main_icons?.append(item4)
        main_icons?.append(item5)
        main_icons?.append(item6)
        main_icons?.append(item7)
        main_icons?.append(item8)
        main_icons?.append(item9)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()
        
        
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
    
    
    
    
   
    
    @IBAction func cerrar_click(_ sender: Any) {  // Home Button
       
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
            let categoriasViewController = storyboard.instantiateViewController(withIdentifier: "mainController") as! mainController
            categoriasViewController.delegate = self
            
            setCurrentView(viewController: categoriasViewController)
        
        
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
        
        
        let facebookURL = NSURL(string: "https://www.facebook.com/IndustriasMEXAR")!
        let twitterURL = NSURL(string: "https://twitter.com/IndustriasMEXAR")!
        let linkedinURL = NSURL(string: "https://mx.linkedin.com/company/industrias-mexar")!
        let instragramURL = NSURL(string: "https://www.instagram.com/industriasmexar/")!
        
        
        let application = UIApplication.shared
        
         
        if curDist == 1{
                ///facebook
            if #available(iOS 10.0, *) {
                application.open(facebookURL as URL)
            }
            
        }
        
        else if curDist == 2 {
                ///Twitter
            if #available(iOS 10.0, *) {
                application.open(twitterURL as URL)
            }
            
        }
    
        else if curDist == 3 {
            ///Linkein
            if #available(iOS 10.0, *) {
                application.open(linkedinURL as URL)
            }
            
        }


        else if curDist == 4 {
            ///Instagram
            if #available(iOS 10.0, *) {
                application.open(instragramURL as URL)
            }
            
        }

    }
    
}
    

//MARK: Table
extension mainTabviewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return items?.count ?? 0
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 98
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as! mainCellView
        
        //let books = items![indexPath.row]
       
        
        cell.configWith(icons: main_icons!)
        //cell.lblCat.text = ""
        cell.delegate = self
        
       
        
        return cell
    }
}

extension mainTabviewController: userDelegate
{
    
    func cerrarSession() {
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
            let notificationName2 = Notification.Name("logoutNT")
            
            NotificationCenter.default.post(name: notificationName2, object: nil)
            
        }
    }
    
    
}



extension mainTabviewController: mainCellDelegate
{
    func mainCellView(didSelect icon: mainIcon_Class) {
        let cur_id: Int = icon.getId()
        debugPrint(cur_id)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        
        
        if (cur_id == 1) {
            let categoriasViewController = storyboard.instantiateViewController(withIdentifier: "mainController") as! mainController
            categoriasViewController.delegate = self
            
            setCurrentView(viewController: categoriasViewController)
        }
        
        else if (cur_id == 2) {
            let mexarDistribuidores = storyboard.instantiateViewController(withIdentifier: "distribuidoresController") as! distribuidoresController
            setCurrentView(viewController: mexarDistribuidores)
        }
        else if (cur_id == 3) {
            let homeDepotDistribuidores = storyboard.instantiateViewController(withIdentifier: "homeDepotController") as! homeDepotController
            setCurrentView(viewController: homeDepotDistribuidores)
            
        }
        else if (cur_id == 4) {
            let contactoViewController :contactoController = storyboard.instantiateViewController(withIdentifier: "contactoController") as! contactoController
            setCurrentView(viewController: contactoViewController)
            
        }
        else if (cur_id == 5) {
            let calculadoraViewController :calcsController = storyboard.instantiateViewController(withIdentifier: "calcsController") as! calcsController
            calculadoraViewController.delegate = self
            setCurrentView(viewController: calculadoraViewController)
        }
        
        else if (cur_id == 6)
        {
            let appURL = NSURL(string: "youtube://www.youtube.com/channel/UClb61WrMZ9xT5mMne_-9pMw")!
            let webURL = NSURL(string: "https://www.youtube.com/channel/UClb61WrMZ9xT5mMne_-9pMw")!
            let application = UIApplication.shared
            
            if application.canOpenURL(appURL as URL) {
                if #available(iOS 10.0, *) {
                    application.open(appURL as URL)
                } else {
                    // Fallback on earlier versions
                }
            } else {
                // if Youtube app is not installed, open URL inside Safari
                if #available(iOS 10.0, *) {
                    application.open(webURL as URL)
                } else {
                    // Fallback on earlier versions
                }
            }
        }
        
        else if (cur_id == 7)
        {
            let distribuidoresViewController = storyboard.instantiateViewController(withIdentifier: "distController") as! distController
            distribuidoresViewController.delegate = self
            setCurrentView(viewController: distribuidoresViewController)
        }
        
        else if (cur_id == 8) {
            let barCodeEscaner = storyboard.instantiateViewController(withIdentifier: "barsController") as! barsController
            barCodeEscaner.delegate = self
            setCurrentView(viewController: barCodeEscaner)
        }
       
        
        else if (cur_id == 9) {
            let usersViewController = storyboard.instantiateViewController(withIdentifier: "userController") as! userController
            usersViewController.delegate = self
            setCurrentView(viewController: usersViewController)
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


protocol userDelegate: class {
    func cerrarSession()
}



