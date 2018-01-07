//
//  Common.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 27/11/17.
//  Copyright © 2017 datalabor.com.mx. All rights reserved.
//

import Foundation
import UIKit

class common {
    
    //screen sizes
    public static var multiplier: CGFloat = 1.0
    public static var curScreen: ScreenBounds!
    public static var curOrientation: String!
    public static var curScale: CGFloat = 1.0
    public static var SCREEN_WIDTH: CGFloat = 0
    public static var SCREEN_HEIGHT: CGFloat = 0
       
    
}


extension UIColor
{
    
    class func mexar_blue1() -> UIColor
    {
        return UIColor(red: (20 / 255), green: (46/255.0), blue: (83/255.0), alpha: 1.0)
    }
    
    class func mexar_blue2() -> UIColor
    {
        return UIColor(red: (0.0), green: (174/255.0), blue: (239/255.0), alpha: 1.0)
    }
    
    class func mexar_white() -> UIColor
    {
        return UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    

    
    
    class func greenColor1() -> UIColor
    {
        return UIColor(red: 0.1725, green: 0.7450, blue: 0.6470, alpha: 1.0)
    }
    
    class func greenColor2() -> UIColor
    {
        return UIColor(red: 0.1725, green: 0.7450, blue: 0.6470, alpha: 0.5)
    }
    
    
    class func mexar_gray1() -> UIColor
    {
        return UIColor(red: 93/255, green: 93/255, blue: 93/255, alpha: 1.0)
    }
    
    
    
    

}

extension NSMutableAttributedString {
    @discardableResult func bold(_ text:String) -> NSMutableAttributedString {
        //let attrs:[String:AnyObject] = [NSFontAttributeName: UIFont(name: "AvenirNext-Medium", size: 14)!]
        let attrs = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 14), NSForegroundColorAttributeName : UIColor.mexar_gray1()]
        let boldString = NSMutableAttributedString(string: text, attributes:attrs)
        self.append(boldString)
        return self
    }
    
    @discardableResult func normal(_ text:String)->NSMutableAttributedString {
        let attrs = [NSFontAttributeName : UIFont.systemFont(ofSize: 14)]
        let normal =  NSMutableAttributedString(string: text, attributes:attrs)
        self.append(normal)
        return self
    }
}


