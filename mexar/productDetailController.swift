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
    
    @IBOutlet weak var label_detail: UITextView!
    
    @IBOutlet weak var pageController: UIPageControl!
    private var scrollViewWidth:CGFloat = 0
    private var scrollViewHeight:CGFloat = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        //Scroll Images
        
        self.scrollView.setNeedsLayout()
        self.scrollView.updateConstraints()
        
        self.scrollView.frame = CGRect(x:0, y:0, width:self.view.frame.width, height:self.scrollView.frame.height)
        
        self.scrollViewWidth = self.scrollView.frame.width
        self.scrollViewWidth = 200
        //self.scrollViewHeight = self.scrollView.frame.height
        self.scrollViewHeight = 200
        
        self.scrollView.delegate = self
        self.pageController.currentPage = 0
        self.pageController.pageIndicatorTintColor = UIColor.greenColor2()
        self.pageController.currentPageIndicatorTintColor = UIColor.greenColor1()

        
        
        
        if ((curProduct) != nil)
        {
            label_description.text = curProduct.getName()
            label_detail.text = curProduct.getDesc_Completa()
            loadImages()
            
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
    
}
