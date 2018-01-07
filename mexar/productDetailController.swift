//
//  productDetailController.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 05/12/17.
//  Copyright © 2017 datalabor.com.mx. All rights reserved.
//

import UIKit

class productDetailController: UIViewController , UIScrollViewDelegate{

    public var curProduct: Product_Class!
    
    @IBOutlet weak var label_description: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var label_detail: UILabel!
    
    @IBOutlet weak var stackView: UIStackView!
    
    
    //@IBOutlet weak var label_detail: UITextView!
    // @IBOutlet weak var label_detail: UITextView!
    //@IBOutlet weak var label_detail: UILabel!
    //@IBOutlet weak var label_detail: UILabel!
   
   
    
    
    @IBOutlet weak var pageController: UIPageControl!
    private var scrollViewWidth:CGFloat = 0
    private var scrollViewHeight:CGFloat = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let logoImage:UIImage = UIImage(named: "icon_mexar")!
        self.navigationItem.titleView = UIImageView(image: logoImage)
        
        //Scroll Images
        
        self.scrollView.setNeedsLayout()
        self.scrollView.updateConstraints()
        
        self.scrollView.frame = CGRect(x:0, y:0, width:self.view.frame.width, height:self.scrollView.frame.height)
        
        let curImageSize: CGFloat = common.SCREEN_WIDTH * 0.60
        
        //self.scrollViewWidth = self.scrollView.frame.width
        self.scrollViewWidth = curImageSize
        //self.scrollViewHeight = self.scrollView.frame.height
        self.scrollViewHeight = curImageSize
        
        self.scrollView.delegate = self
        self.pageController.currentPage = 0
        self.pageController.pageIndicatorTintColor = UIColor.greenColor2()
        self.pageController.currentPageIndicatorTintColor = UIColor.greenColor1()

        
        
        
        if ((curProduct) != nil)
        {
            label_description.text = curProduct.getName()
            loadImages()
            loadText()
            
            if (curProduct.getRedes().count<1) {
            self.stackView.isHidden = true
            }
            
            
        }
        
        
        
       // var frame = self.label_detail.frame
       // frame.size.height = self.label_detail.contentSize.height
       // self.label_detail.frame = frame
        
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

    func loadText(){
        
    
        
        
        let formatedString = NSMutableAttributedString()
        
        formatedString.append(muestraTextString(title: "Descripción", curValue: curProduct.getDesc_Completa()))
        
        formatedString.append(muestraArrayString(title: "Características y beneficios:", curValues: curProduct.getCaracteristicas()))
        formatedString.append(muestraArrayString(title: "Aplicaciones:", curValues: curProduct.getAplicaciones()))
        formatedString.append(muestraArrayString(title: "Especifícaciones:", curValues: curProduct.getEspecificaciones()))
        formatedString.append(muestraArrayString(title: "Adhiere a:", curValues: curProduct.getAdhieres()))
        formatedString.append(muestraArrayString(title: "Colores disponibles:", curValues: curProduct.getColors()))
        formatedString.append(muestraArrayString(title: "Usos:", curValues: curProduct.getUsos()))
        formatedString.append(muestraArrayString(title: "Ventajas:", curValues: curProduct.getVentajas()))
        formatedString.append(muestraArrayString(title: "Presentaciones", curValues: curProduct.getPresentaciones()))
        formatedString.append(muestraTextString(title: "Nota", curValue: curProduct.getNota()))
        self.label_detail.attributedText = formatedString
        
        
        
    }
    
    
    func muestraTextString(title: String , curValue: String)->NSMutableAttributedString
    {
        
        if (curValue.count < 1)
        {
          return NSMutableAttributedString(string: "")
        }
        
        let formatedStr = NSMutableAttributedString()
        formatedStr
            .bold(title)
            .normal("\n")
            .normal(curValue)
            .normal("\n\n")
        return formatedStr
        
        
    }
    
    func muestraArrayString(title: String , curValues: [String])->NSMutableAttributedString
    {
    var str_array : String = ""
        
   if (curValues.count<1)
   {
    return NSMutableAttributedString(string: "")
   }
        
    for curValue in curValues
    {
    str_array = str_array + curValue + "\n"
    }
    
    
    let formatedStr = NSMutableAttributedString()
    formatedStr
    .bold(title)
    .normal("\n")
    .normal(str_array)
    .normal("\n")
    
   return formatedStr
        
    }
    
    func loadImages(){
        
        //////// Borrar contenido si existe
        
        let subViews = self.scrollView.subviews
        for subview in subViews{
            subview.removeFromSuperview()
        }
        
        
        
        //////
        
        
        var currentImage: Int = 0
        let totImages: CGFloat = CGFloat(curProduct.getImages().count)
        
        self.scrollView.contentSize = CGSize(width:self.scrollViewWidth * totImages, height:self.scrollViewHeight)
         
        self.pageController.numberOfPages = curProduct.getImages().count
        self.pageController.currentPage = 0
        
        
        for image in curProduct.getImages(){
            
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
        //let pageWidth:CGFloat = scrollView.frame.width
        let pageWidth:CGFloat = self.scrollViewWidth
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        // Change the indicator
        self.pageController.currentPage = Int(currentPage);
        // Change the text accordingly
        
    }
 
    
    @IBAction func facebook_click(_ sender: Any) {
        let url = NSURL(string: "https://www.facebook.com/sharer/sharer.php?u=" + curProduct.getRedes())!
        UIApplication.shared.openURL(url as URL)
        
    }
    @IBAction func twitter_click(_ sender: Any) {
        let url = NSURL(string: "http://twitter.com/home?status=Texto%20para%20compartir%20" + curProduct.getRedes())!
        UIApplication.shared.openURL(url as URL)
        
    }
    @IBAction func google_click(_ sender: Any) {
        let url = NSURL(string: "https://plus.google.com/share?url=Texto%20para%20compartir%20" + curProduct.getRedes())!
        UIApplication.shared.openURL(url as URL)
    }
    
    
}



