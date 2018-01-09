//
//  loginController.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 22/11/17.
//  Copyright © 2017 datalabor.com.mx. All rights reserved.
//

import UIKit
import Alamofire
import Google
import GoogleSignIn

class loginController: UIViewController , GIDSignInUIDelegate, GIDSignInDelegate{

    let notificationName1 = Notification.Name("loginNT")
    let notificationName2 = Notification.Name("logoutNT")
    
    
    
    @IBOutlet weak var googleButton: GIDSignInButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        //error object
        var error : NSError?
        
        //setting the error
        GGLContext.sharedInstance().configureWithError(&error)
        
        //if any error stop execution and print error
        if error != nil{
            print(error ?? "google error")
            return
        }
        
            
        //adding the delegates
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        
        //getting the signin button and adding it to view
        let googleSignInButton = GIDSignInButton()
        self.googleButton = googleSignInButton
        
       // googleSignInButton.center = view.center
       // view.addSubview(googleSignInButton)
        
       
        
    }
    
    //when the signin complets
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        //if any error stop and print the error
        if error != nil{
            print(error ?? "google error")
            return
        }
        
        //if success display the email on label
       // labelUserEmail.text = user.profile.email
        let name :String = user.profile.givenName + " " + user.profile.familyName
        let email :String = user.profile.email
        
        debugPrint(user.profile.email)
        debugPrint(user.profile.name)
        
        Utils.setStringKey(namekey: common.VAR_USER_NAME, value: name)
        Utils.setStringKey(namekey: common.VAR_USER_EMAIL, value: email)
        Utils.setStringKey(namekey: common.VAR_LOGIN_TYPE, value: "google")
        self.setParameters(name: name, email: email, acceso: "google")
        NotificationCenter.default.post(name: self.notificationName1, object: nil)
 
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

    
    
    func showInputDialog() {
        //Creating UIAlertController and
        //Setting title and message for the alert dialog
        let alertController = UIAlertController(title: "Entra detalles?", message: "Entra tu nombre y dirección de correo:", preferredStyle: .alert)
        
        //the confirm action taking the inputs
        let confirmAction = UIAlertAction(title: "Enter", style: .default) { (_) in
            
            //getting the input values from user
            let name = alertController.textFields?[0].text
            let email = alertController.textFields?[1].text
            
            if ((name?.count)!<6) {
                self.showAlert(title: "! nombre inválido !", desc: "Por favor introduzca un nombre de al menos 6 caracteres.", btn: "Aceptar")
                return
            }
            if (!self.isValidEmail(testStr: email!)){
                self.showAlert(title: "! email inválido !", desc: "La cuenta de correo no es válida.", btn: "Aceptar")
                return
            }
            
           // self.labelMessage.text = "Name: " + name! + "Email: " + email!
           
            
            Utils.setStringKey(namekey: common.VAR_USER_NAME, value: name!)
            Utils.setStringKey(namekey: common.VAR_USER_EMAIL, value: email!)
            Utils.setStringKey(namekey: common.VAR_LOGIN_TYPE, value: "email")
            self.setParameters(name: name!, email: email!, acceso: "email")
            NotificationCenter.default.post(name: self.notificationName1, object: nil)
        }
        
        //the cancel action doing nothing
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel) { (_) in }
        
        //adding textfields to our dialog box
        alertController.addTextField { (textField) in
            textField.placeholder = "Entra tu Nombre"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Entra tu email"
        }
        
        //adding the action to dialogbox
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        //finally presenting the dialog box
        self.present(alertController, animated: true, completion: nil)
    }
    
   
    @IBAction func login_google_click(_ sender: Any) {
        
         GIDSignIn.sharedInstance().signIn()
    }
    
    @IBAction func login_facebook_click(_ sender: Any) {
    }
    
    @IBAction func login_email_click(_ sender: Any) {
        showInputDialog()
        
    }
    
    
    func isValidEmail(testStr:String) -> Bool {
        //let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailRegEx = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" +
            "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
            "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" +
            "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" +
            "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
            "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
        "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func showAlert(title: String, desc: String, btn:String)
    {
        
        let alertController = UIAlertController(title: title, message: desc, preferredStyle:UIAlertControllerStyle.alert)
        let ok = UIAlertAction(title: btn, style: UIAlertActionStyle.default, handler: nil)
        
        alertController.addAction(ok)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func setParameters(name: String, email: String, acceso: String){
        
        let body: NSMutableDictionary? = [
            "name": "\(name)",
            "username": "",
            "email":"\(email)",
            "acceso":"\(acceso)",
            "password":""]
        
        let url = NSURL(string: common.API_URL_BASE + "mexarusers" as String)
        var request = URLRequest(url: url! as URL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let data = try! JSONSerialization.data(withJSONObject: body!, options: JSONSerialization.WritingOptions.prettyPrinted)
        
        let json = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
        if let json = json {
            print(json)
        }
        request.httpBody = json!.data(using: String.Encoding.utf8.rawValue)
        let alamoRequest = Alamofire.request(request as URLRequestConvertible)
        alamoRequest.validate(statusCode: 200..<300)
        alamoRequest.responseString { response in
            
            switch response.result {
            case .success:
                print(response.result)
            case .failure(let error):
                print(error.localizedDescription)
                return
            }
        }
        
        
        
    }
    

    
    
    
}
