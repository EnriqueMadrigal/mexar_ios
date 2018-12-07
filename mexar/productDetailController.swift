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
    //@IBOutlet weak var label_detail: UILabel!

    @IBOutlet weak var textView1: UITextView!
    
    @IBOutlet weak var stackView: UIStackView!
    
    
    //@IBOutlet weak var label_detail: UITextView!
    // @IBOutlet weak var label_detail: UITextView!
    //@IBOutlet weak var label_detail: UILabel!
    //@IBOutlet weak var label_detail: UILabel!
   
    @IBOutlet weak var pdf_button: UIButton!
    
    
    
    @IBOutlet weak var pageController: UIPageControl!
    private var scrollViewWidth:CGFloat = 0
    private var scrollViewHeight:CGFloat = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //let logoImage:UIImage = UIImage(named: "icon_mexar")!
        //self.navigationItem.titleView = UIImageView(image: logoImage)
        //self.navigationController!.navigationBar.topItem!.title = "Regresar"
        
        //Scroll Images
        
        self.scrollView.setNeedsLayout()
        self.scrollView.updateConstraints()
        
        self.scrollView.frame = CGRect(x:0, y:0, width:self.view.frame.width, height:self.scrollView.frame.height)
        
        let curImageSize: CGFloat = common.SCREEN_WIDTH * 0.50
        
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
            
            if (curProduct.getFicha_Tecnica().count<1){
                self.pdf_button.isHidden = true
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
        
        
        
        // let attrs1 = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 16), NSAttributedStringKey.foregroundColor : UIColor.gris1()]
        //let attrs2 = [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14), NSAttributedStringKey.foregroundColor : UIColor.gris2()]
        
        let style1 = NSMutableParagraphStyle()
        //style1.firstLineHeadIndent = 10.0
        //style1.paragraphSpacingBefore = 10.0
        style1.alignment = NSTextAlignment.justified
        style1.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        let style2 = NSMutableParagraphStyle()
        style2.alignment = NSTextAlignment.left
        
        
        
        
        
        let attrs1 = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 16), NSForegroundColorAttributeName : UIColor.mexar_gray1() ,NSParagraphStyleAttributeName: style2]
        let attrs2 = [NSFontAttributeName : UIFont.systemFont(ofSize: 14), NSForegroundColorAttributeName : UIColor.mexar_gray1(), NSParagraphStyleAttributeName: style1]
        
        
        let linebreak =  NSMutableAttributedString(string: "\n", attributes: nil)
        
        
         if (curProduct.getDesc_Completa().count > 0) {
            
        let Title1 =  NSMutableAttributedString(string: "Descripción", attributes: attrs1)
        let Content1 = NSMutableAttributedString(string: curProduct.getDesc_Completa(), attributes: attrs2)
        
        formatedString.append(Title1)
        formatedString.append(linebreak)
        formatedString.append(Content1)
        formatedString.append(linebreak)
        formatedString.append(linebreak)
        }
        
    
        
        // Caracteristicas
        var curValues = curProduct.getCaracteristicas()
        if (curValues.count > 0) {
           
            let Title =  NSMutableAttributedString(string: "Características y beneficios:", attributes: attrs1)
           formatedString.append(Title)
            formatedString.append(linebreak)
            for curValue in curProduct.getCaracteristicas()
            {
                let curText = NSMutableAttributedString(string: "" + curValue + "\n", attributes: attrs2)
                formatedString.append(curText)
            }
        
        formatedString.append(linebreak)
            
        }
       
    
        // Aplicaciones
         curValues = curProduct.getAplicaciones()
        if (curValues.count > 0) {
            
            let Title =  NSMutableAttributedString(string: "Aplicaciones:", attributes: attrs1)
            formatedString.append(Title)
            formatedString.append(linebreak)
            for curValue in curValues
            {
                let curText = NSMutableAttributedString(string: "" + curValue + "\n", attributes: attrs2)
                formatedString.append(curText)
            }
            
            formatedString.append(linebreak)
            
        }
        
        
      
        
        
        // Especifícaciones
        curValues = curProduct.getEspecificaciones()
        if (curValues.count > 0) {
            
            let Title =  NSMutableAttributedString(string: "Especifícaciones:", attributes: attrs1)
            formatedString.append(Title)
            formatedString.append(linebreak)
            for curValue in curValues
            {
                let curText = NSMutableAttributedString(string: "" + curValue + "\n", attributes: attrs2)
                formatedString.append(curText)
            }
            
            formatedString.append(linebreak)
            
        }
        
        
        // Adhiere a
        curValues = curProduct.getAdhieres()
        if (curValues.count > 0) {
            
            let Title =  NSMutableAttributedString(string: "Adhiere a:", attributes: attrs1)
            formatedString.append(Title)
            formatedString.append(linebreak)
            for curValue in curValues
            {
                let curText = NSMutableAttributedString(string: "" + curValue + "\n", attributes: attrs2)
                formatedString.append(curText)
            }
            
            formatedString.append(linebreak)
            
        }
        
      
        // Colores disponibles:
        curValues = curProduct.getColors()
        if (curValues.count > 0) {
            
            let Title =  NSMutableAttributedString(string: "Colores disponibles:", attributes: attrs1)
            formatedString.append(Title)
            formatedString.append(linebreak)
            for curValue in curValues
            {
                let curText = NSMutableAttributedString(string: "" + curValue + "\n", attributes: attrs2)
                formatedString.append(curText)
            }
            
            formatedString.append(linebreak)
            
        }
        
        
        // Usos
        
        curValues = curProduct.getUsos()
        if (curValues.count > 0) {
            
            let Title =  NSMutableAttributedString(string: "Usos:", attributes: attrs1)
            formatedString.append(Title)
            formatedString.append(linebreak)
            for curValue in curValues
            {
                let curText = NSMutableAttributedString(string: "" + curValue + "\n", attributes: attrs2)
                formatedString.append(curText)
            }
            
            formatedString.append(linebreak)
            
        }
        
        // Ventajas
        curValues = curProduct.getVentajas()
        if (curValues.count > 0) {
            
            let Title =  NSMutableAttributedString(string: "Ventajas:", attributes: attrs1)
            formatedString.append(Title)
            formatedString.append(linebreak)
            for curValue in curValues
            {
                let curText = NSMutableAttributedString(string: "" + curValue + "\n", attributes: attrs2)
                formatedString.append(curText)
            }
            
            formatedString.append(linebreak)
            
        }
        
        curValues = curProduct.getPresentaciones()
        if (curValues.count > 0) {
            
            let Title =  NSMutableAttributedString(string: "Presentaciones:", attributes: attrs1)
            formatedString.append(Title)
            formatedString.append(linebreak)
            for curValue in curValues
            {
                let curText = NSMutableAttributedString(string: "" + curValue + "\n", attributes: attrs2)
                formatedString.append(curText)
            }
            
            formatedString.append(linebreak)
            
        }
        
       //Seguridad
        curValues = curProduct.getSeguridades()
        if (curValues.count > 0) {
            
            let Title =  NSMutableAttributedString(string: "Seguridad:", attributes: attrs1)
            formatedString.append(Title)
            formatedString.append(linebreak)
            for curValue in curValues
            {
                let curText = NSMutableAttributedString(string: "" + curValue + "\n", attributes: attrs2)
                formatedString.append(curText)
            }
            
            formatedString.append(linebreak)
            
        }
        
        
        //Precauciones
        if (curProduct.getPrecauciones().count > 0) {
            let Title =  NSMutableAttributedString(string: "Precauciones:", attributes: attrs1)
            formatedString.append(Title)
            formatedString.append(linebreak)
            
            let contentNota = NSMutableAttributedString(string: curProduct.getPrecauciones(), attributes: attrs2)
            formatedString.append(contentNota)
            formatedString.append(linebreak)
            formatedString.append(linebreak)
            
        }
        
        //Almacenaje
        if (curProduct.getAlmacenaje().count > 0) {
            let Title =  NSMutableAttributedString(string: "Almacenaje:", attributes: attrs1)
            formatedString.append(Title)
            formatedString.append(linebreak)
            
            let contentNota = NSMutableAttributedString(string: curProduct.getAlmacenaje(), attributes: attrs2)
            formatedString.append(contentNota)
            formatedString.append(linebreak)
            
        }
        
        
        //Nota
        if (curProduct.getNota().count > 0) {
              let Title =  NSMutableAttributedString(string: "Nota:", attributes: attrs1)
             formatedString.append(Title)
            formatedString.append(linebreak)
            
            let contentNota = NSMutableAttributedString(string: curProduct.getNota(), attributes: attrs2)
            formatedString.append(contentNota)
            
        }
        
        self.textView1.attributedText = formatedString
        
        /*
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
        */
        
        
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
            
            var curImage: UIImage!
            
            let newImage = UIImageView(frame: CGRect(x:self.scrollViewWidth * CGFloat(currentImage), y:0, width:self.scrollViewWidth, height:self.scrollViewHeight))
            /////
            
            curImage = UIImage(named: image)
            
            if ((curImage) == nil){
            curImage = UIImage(named: "placeholder")
                
            }
                
            newImage.image = curImage
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
        let url = NSURL(string: "http://twitter.com/home?status=" + curProduct.getRedes())!
        UIApplication.shared.openURL(url as URL)
        
    }
    @IBAction func google_click(_ sender: Any) {
        let url = NSURL(string: "https://plus.google.com/share?url=" + curProduct.getRedes())!
        UIApplication.shared.openURL(url as URL)
    }
    
    @IBAction func pdf_click(_ sender: Any) {
        let url = NSURL(string: curProduct.getFicha_Tecnica())!
        UIApplication.shared.openURL(url as URL)
        
    }
    
    
    
    
}



