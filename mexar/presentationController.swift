//
//  presentationController.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 12/01/18.
//  Copyright © 2018 datalabor.com.mx. All rights reserved.
//

import UIKit

class presentationController: UIViewController , UIGestureRecognizerDelegate{

    @IBOutlet var curView: UIView!
    @IBOutlet weak var textView1: UITextView!
    
    let notificationName1 = Notification.Name("loginNT")
    let notificationName2 = Notification.Name("logoutNT")
    let notificationName3 = Notification.Name("showMain")
    
    let label1 = "Somos una empresa Jalisciense con oficinas centrales en Zapopan, Jal. Contamos con sucursal en la Ciudad de Mexico y Monterrey.\n Nuestra reputación se ha construido basada en integridad, calidad y servicio, tenemos 25 años de trayectoria los cuales nos respaldan."
    
    let label2 = "En Industrias Mexar S.A. de C.V. nos comprometemos a desarrollar, fabricar y comercializar productos para los procesos de plomería, centrifugado y soldadura, para satisfacer los requerimientos de los clientes, mediante la constante mejora de nuestros procesos."
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //let tap = UITapGestureRecognizer(target: self, action: #selector(tapHandler(gesture:)))
        //tap.numberOfTapsRequired = 2
        
        
        let yourTapEvent = UITapGestureRecognizer(target: self, action: #selector(self.yourFunction(_:)))
        yourTapEvent.delegate = self
        
        curView.addGestureRecognizer(yourTapEvent)
        textView1.addGestureRecognizer(yourTapEvent)
        
        ////////
        
        let formatedString = NSMutableAttributedString()
        
        
        
       // let attrs1 = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 16), NSAttributedStringKey.foregroundColor : UIColor.gris1()]
        //let attrs2 = [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14), NSAttributedStringKey.foregroundColor : UIColor.gris2()]
        
        let style1 = NSMutableParagraphStyle()
        style1.firstLineHeadIndent = 10.0
        style1.paragraphSpacingBefore = 10.0
        style1.alignment = NSTextAlignment.justified
        style1.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        let style2 = NSMutableParagraphStyle()
        //style2.firstLineHeadIndent = 10.0
        //style2.paragraphSpacingBefore = 10.0
        style2.alignment = NSTextAlignment.center
        //style2.lineBreakMode = NSLineBreakMode.byWordWrapping

        
        
        
        
        let attrs1 = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 16), NSForegroundColorAttributeName : UIColor.white ,NSParagraphStyleAttributeName: style2]
        let attrs2 = [NSFontAttributeName : UIFont.systemFont(ofSize: 14), NSForegroundColorAttributeName : UIColor.white, NSParagraphStyleAttributeName: style1]
        
        
        let linebreak =  NSMutableAttributedString(string: "\n", attributes: nil)
        
        let Title1 =  NSMutableAttributedString(string: "INDUSTRIAS MEXAR", attributes: attrs1)
        let Content1 = NSMutableAttributedString(string: label1, attributes: attrs2)
        
        let Title2 =  NSMutableAttributedString(string: "Política de Calidad", attributes: attrs1)
        let Content2 = NSMutableAttributedString(string: label2, attributes: attrs2)
        
        
        
          formatedString.append(Title1)
          formatedString.append(linebreak)
        
          formatedString.append(Content1)
          formatedString.append(linebreak)
        formatedString.append(linebreak)
        formatedString.append(Title2)
        
        formatedString.append(linebreak)
        formatedString.append(Content2)
        
        
        self.textView1.attributedText = formatedString
        // attibutes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 16), NSAttributedStringKey.foregroundColor : UIColor.gris1()]
        
        
        
        //////////
        
        
        
    
       
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func yourFunction(_ sender: AnyObject) {
        //let yourTag = sender.view!.tag // this is the tag of your gesture's object
        // do whatever you want from here :) e.g. if you have an array of buttons instead of just 1:
        debugPrint("Tap")
     NotificationCenter.default.post(name: self.notificationName3, object: nil)
    
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    }
