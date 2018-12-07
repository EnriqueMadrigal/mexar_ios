//
//  webview.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 17/02/18.
//  Copyright © 2018 datalabor.com.mx. All rights reserved.
//

import Foundation

class webview {
    
    
    var isParagraph = false
    
    var curHtml = ""
    
    let headerHtml = ""
    let pagerHtml = "</body></html>"
    
    init(backcolor: String) {
        
        let headerHtml = "<!DOCTYPE html><html><head></head><body style=\"background-color: " + backcolor + "\">"
        
        
        curHtml = headerHtml
        
        
        
    }
    
    func addParagraphJustified(){
    let newHtml = "<div  align = \"justify\">"
    curHtml += newHtml
    isParagraph = true
    }
    
    func endParagraphJustified(){
        let newHtml = "</div>"
        curHtml += newHtml
      
    }
    
   
    
    func addParagraphCentered(){
        let newHtml = "<div align = \"center\">"
        curHtml += newHtml
        isParagraph = true
    }
    
    func endParagraphCentered(){
        let newHtml = "</div>"
        curHtml += newHtml
        
    }
   
    
    func addParagraphLeft(){
        let newHtml = "<div align = \"left\">"
        curHtml += newHtml
        isParagraph = true
    }
    
    func endParagraphLeft(){
        let newHtml = "</div>"
        curHtml += newHtml
        
    }
    
    
    
    func addLineBreak(){
        let newHtml = "<br>"
        curHtml += newHtml
        
    }
    
    
    func addSomeText(newText: String, fontsize: String, fontcolor: String, fontweight: String ){
        let newHtml = "<span style = \""  + "font-size: " + fontsize + "; color: " + fontcolor + "; font-weight: " + fontweight + ";\">" + newText + "</span>"
        curHtml += newHtml
        
    }
    
    
    func render()-> String {
      
        
        
        curHtml += pagerHtml
        return curHtml
    }
    
    
}
