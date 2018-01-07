//
//  mainController.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 27/11/17.
//  Copyright © 2017 datalabor.com.mx. All rights reserved.
//

import UIKit
import SideMenu
import ObjectMapper


class mainController: UIViewController , UIScrollViewDelegate, UITableViewDelegate,  UITableViewDataSource{

//    class mainController: UIViewController , UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource{

    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageController: UIPageControl!
    
    @IBOutlet weak var tableViewCategorias: UITableView!
    private var scrollViewWidth:CGFloat = 0
    private var scrollViewHeight:CGFloat = 0

    
    var Images = [
       "productos",
       "banner1",
       "banner2",
       "banner3"
    ]
    
    private var categories: [Category_Class] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.calculateVars()
        
        // Do any additional setup after loading the view.
        
        let logoImage:UIImage = UIImage(named: "icon_mexar")!
        self.navigationItem.titleView = UIImageView(image: logoImage)
        
        // Define the menus
        //let menuLeftNavigationController = UISideMenuNavigationController(rootViewController: (MenuController.self as? UISideMenuNavigationController)!)
        ///menuLeftNavigationController.leftSide = true
        // UISideMenuNavigationController is a subclass of UINavigationController, so do any additional configuration
        // of it here like setting its viewControllers. If you're using storyboards, you'll want to do something like:
        let menuLeftNavigationController = storyboard!.instantiateViewController(withIdentifier: "MenuNavController") as! UISideMenuNavigationController
        //let menuRightNavigationController = storyboard!.instantiateViewController(withIdentifier: "MenuNavController") as! UISideMenuNavigationController
        
        menuLeftNavigationController.leftSide = true
        
        
        SideMenuManager.menuLeftNavigationController = menuLeftNavigationController
        
        //let menuRightNavigationController = UISideMenuNavigationController(rootViewController: menuController)
        // UISideMenuNavigationController is a subclass of UINavigationController, so do any additional configuration
        // of it here like setting its viewControllers. If you're using storyboards, you'll want to do something like:
        // let menuRightNavigationController = storyboard!.instantiateViewController(withIdentifier: "RightMenuNavigationController") as! UISideMenuNavigationController
        //SideMenuManager.menuRightNavigationController = menuRightNavigationController
        //SideMenuManager.menuLeftNavigationController = menuLeftNavigationController
        
        // Enable gestures. The left and/or right menus must be set up above for these to work.
        // Note that these continue to work on the Navigation Controller independent of the view controller it displays!
        SideMenuManager.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
        SideMenuManager.menuPresentMode = .menuSlideIn
        
            //Scroll View

        self.scrollView.setNeedsLayout()
        self.scrollView.updateConstraints()
        
        self.scrollView.frame = CGRect(x:0, y:0, width:self.view.frame.width, height:self.scrollView.frame.height)
        
        self.scrollViewWidth = self.scrollView.frame.width
        self.scrollViewHeight = self.scrollView.frame.height * common.curScale
        self.scrollViewWidth = common.SCREEN_WIDTH
        self.scrollViewHeight = common.SCREEN_WIDTH * 0.48
        
        self.scrollView.delegate = self
        self.pageController.currentPage = 0
        self.pageController.pageIndicatorTintColor = UIColor.greenColor2()
        self.pageController.currentPageIndicatorTintColor = UIColor.greenColor1()


        
        self.tableViewCategorias.delegate = self
        self.tableViewCategorias.dataSource  = self
        
        self.tableViewCategorias.rowHeight = UITableViewAutomaticDimension
        self.tableViewCategorias.estimatedRowHeight = 160
        self.tableViewCategorias.separatorColor = UIColor.clear
        
        
        self.categories = [Category_Class]()
        
        loadImages()
        getCategories()
        
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
        
       
        
        if segue.identifier == "showSubCategorias"{
        
        if let curCategoriaId = sender as! Int?{
            
            let subCategoriasViewController = segue.destination as! subCategorias
            
            subCategoriasViewController.curCategoria = curCategoriaId
            
        }
        }
        
        
        
        
    }


    
    func loadImages(){
        
        //////// Borrar contenido si existe
        
        let subViews = self.scrollView.subviews
        for subview in subViews{
            subview.removeFromSuperview()
        }
        
        
        
        //////
        
         var currentImage: Int = 0
        let totImages: CGFloat = CGFloat(Images.count)
        
         self.scrollView.contentSize = CGSize(width:self.scrollView.frame.width * totImages, height:self.scrollViewHeight)
        
        self.pageController.numberOfPages = Images.count
        self.pageController.currentPage = 0
        
        
        
        for image in Images{
            
            let bundlePath = Bundle.main.path(forResource: image, ofType: "png")
            let imageNoDisp = UIImage(contentsOfFile: bundlePath!)
            
            let newImage = UIImageView(frame: CGRect(x:self.scrollViewWidth * CGFloat(currentImage), y:0, width:self.scrollViewWidth, height:self.scrollViewHeight))
            newImage.image = imageNoDisp
            
            newImage.clipsToBounds = true
            newImage.contentMode = .scaleToFill
             self.scrollView.addSubview(newImage)
            
            currentImage = currentImage + 1
            
        }
        
        
        
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
        // Test the offset and calculate the current page after scrolling ends
        let pageWidth:CGFloat = scrollView.frame.width
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        // Change the indicator
        self.pageController.currentPage = Int(currentPage);
        // Change the text accordingly
        
    }
    
    func getCategories()
    {
        
        self.categories.removeAll()
        
        if let bundlePath = Bundle.main.url(forResource: "categorias", withExtension: "json"){
            do {
            //let data = try Data(contentsOf: bundlePath)
        let text2 = try String(contentsOf: bundlePath, encoding: .utf8)
               
        
                
                //////
           
                let list: Array<Categorias> = Mapper<Categorias>().mapArray(JSONString: text2)!
                let curCats: Array<Categoria> = (list.first?.categorias)!
                
                for curCat: Categoria in curCats{
                    
                    if let cur_cat_data = curCat.categoria{
                        let name: String = cur_cat_data.name!
                        let id: Int = cur_cat_data.id!
                        let desc: String = cur_cat_data.desc!
                        let resname: String = cur_cat_data.resname!
                        
                        let new_category = Category_Class()
                        new_category.setId(id: id)
                        new_category.setDesc(desc: desc)
                        new_category.setName(name: name)
                        new_category.setResName(resname: resname)
                        self.categories.append(new_category)
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
        
        return categories.count
        
    }
    
    
 
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        
        
        // let cell =  productsCell(style: UITableViewCellStyle.default, reuseIdentifier: "myIdentifier")
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoriasCells", for: indexPath) as! categoriasCells
        
        let cur_category = categories[indexPath.row]
        cell.categoria_name.text = cur_category.getName()
        cell.categoria_desc.text = cur_category.getDesc()
        
        let filename: String = cur_category.getResName()
        
        let bundlePath = Bundle.main.path(forResource: filename, ofType: "png")
        let imageNoDisp = UIImage(contentsOfFile: bundlePath!)
        
        cell.categoria_icon.image = imageNoDisp
        
        
     
        return cell
    }

  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let curCellHeight:CGFloat = common.SCREEN_WIDTH * 0.25
        return curCellHeight
        //return 80.0
    }
   
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        debugPrint(indexPath.row)
        
        let curCategoria = categories[indexPath.row]
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        //    debugPrint("Se seleecion \(curProduct.getId())")
        
        let curId: Int = curCategoria.getId()
        
         debugPrint("Se seleecion \(curCategoria.getId())")
        
        performSegue(withIdentifier: "showSubCategorias", sender: curId)
        
        
        //        performSegue(withIdentifier: "showWebContent", sender: curPath)
        
       
        
    }

    
    //// Screen Size
    
    func calculateVars()
    {
        
        var deviceType: String = ""
        var physicalx: Int = 0
        var physicaly: Int = 0
        
        struct ScreenSize
        {
            static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
            static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
            static let scale                = UIScreen.main.scale
            static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
            static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
        }
        
        
        let SCREEN_WIDTH = UIScreen.main.bounds.size.width
        let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
        let scale = UIScreen.main.scale
        
        //let SCREEN_MAX_LENGTH    = max(SCREEN_WIDTH, SCREEN_HEIGHT)
        //let SCREEN_MIN_LENGTH    = min(SCREEN_WIDTH, SCREEN_HEIGHT)
        
        
        
        
        if (UIDevice.current.userInterfaceIdiom == .pad) {deviceType = "Ipad"}
        if (UIDevice.current.userInterfaceIdiom == .phone){deviceType = "Iphone"}
        
        
        if (deviceType == "Iphone")
        {
            if (SCREEN_HEIGHT == 480 && SCREEN_WIDTH == 320)
            {
                // Iphone 4
                physicalx = 640
                physicaly = 960
            }
            
            
            
            if (SCREEN_HEIGHT == 568 && SCREEN_WIDTH == 320)
            {
                // Iphone 5
                physicalx = 960
                physicaly = 1136
            }
            
            
            
            /*
             if (ScreenSize.SCREEN_HEIGHT == 320 && ScreenSize.SCREEN_WIDTH == 568)
             {
             // Iphone 5
             self.physicalx = 1136
             self.physicaly = 640
             }
             */
            
            
            if (SCREEN_HEIGHT == 667 && SCREEN_WIDTH == 375)
            {
                // Iphone 6
                physicalx = 750
                physicaly = 1134
            }
            
            
            if (SCREEN_HEIGHT == 736 && SCREEN_WIDTH == 414)
            {
                // Iphone 6
                physicalx = 1080
                physicaly = 1920
            }
            
            
        }
        
        
        if (deviceType == "Ipad")
        {
            
            if (scale == 1.0)
            {
                // Ipad, Ipad2 , Ipad mini
                
                physicalx = 760
                physicaly = 1024
            }
            
            if (scale == 2.0)
            {
                // Ipad Air, Ipad Mini Retina
                
                physicalx = 1536
                physicaly = 2048
            }
            
            
            
            
        }
        
        common.curScreen = ScreenBounds(newWidth: physicalx, newHeight: physicaly, typeDevice: deviceType)
        ////
        
        //// Multiplier
        
        if (deviceType == "Ipad"){ common.multiplier = 2.0}
        
        
        
        //common.curOrientation = getDeviceOrientation()
        common.curScale = ScreenSize.scale
        common.SCREEN_WIDTH = SCREEN_WIDTH
        common.SCREEN_HEIGHT = SCREEN_HEIGHT
        
        
    }
    
    
    
    
}
