//
//  AppDelegate.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 21/11/17.
//  Copyright © 2017 datalabor.com.mx. All rights reserved.
//

import UIKit
import Google
import GoogleMaps
import GooglePlaces
import GoogleSignIn
import FacebookCore
import FacebookLogin


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    
    let notificationName1 = Notification.Name("loginNT")
    let notificationName2 = Notification.Name("logoutNT")
    let notificationName3 = Notification.Name("showMain")


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //AIzaSyB0Go84LSXVHm095ueyiH0Mr_SLkjHPCdo
        var configureError: NSError?
        
        GMSServices.provideAPIKey("AIzaSyB0Go84LSXVHm095ueyiH0Mr_SLkjHPCdo")
        GMSPlacesClient.provideAPIKey("AIzaSyB0Go84LSXVHm095ueyiH0Mr_SLkjHPCdo")
        
        
        GGLContext.sharedInstance().configureWithError(&configureError)
      
        

       //assert(configureError == nil, "Error configuring Google services: \(configureError)")
        assert(configureError == nil, "Error configuring Google services: \(String(describing: configureError))")
        
        FacebookCore.SDKApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.loginNTF), name: notificationName1, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.loginNTF), name: notificationName2, object: nil)
         NotificationCenter.default.addObserver(self, selector: #selector(self.loginNTF), name: notificationName3, object: nil)
        
        
        self.auth()
        return true
    }

    //this function is added only
    /*
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance().handle(url as URL!,
                                                 sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplicationOpenURLOptionsKey.annotation])
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        if (url.absoluteString.range(of:"FACEBOOK_ID") != nil)  {
            return FacebookCore.SDKApplicationDelegate.shared.application(_:open:options:)
            
            return FacebookCore.SDKApplicationDelegate.shared.application(app, open: url as URL, sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplicationOpenURLOptionsKey.annotation] ?? [])
           
        }
        else {
            return GIDSignIn.sharedInstance().handle(url as URL!,
                                                     sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplicationOpenURLOptionsKey.annotation]) }
    }
    */
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        debugPrint("applation")
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
    
        if (url.absoluteString.hasPrefix("fb"))  {
        return SDKApplicationDelegate.shared.application(app, open: url, options: options)
        }
        
        else {
            return GIDSignIn.sharedInstance().handle(url as URL?,
                                                     sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplicationOpenURLOptionsKey.annotation])
        }
    
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    
    @objc func loginNTF(notification: NSNotification)
    {
        debugPrint(notification.name)
        
       // let notificationName: String = notification.name._rawValue as String
        let notificationName: String = notification.name.rawValue as String
        
        if ( notificationName == "loginNT")
        {
            
            debugPrint("loginNT")
            self.auth()
            
            
        }
            
        else if (notificationName == "logoutNT")
        {
            debugPrint("logoutNT")
           self.deauth()
            
        }
        
     
        else if (notificationName == "showMain")
        {
            //debugPrint("logoutNT")
            //self.mainWindow(sb: sb)
            self.showMainWindow()
            
        }
        
        
    }
    

    
    
    func auth() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let curUserName = Utils.getStringKey(namekey: common.VAR_USER_NAME)
      
        
        if (!curUserName.isEmpty) // Ya existe la información copiala a commonCopia la información a common.
        {
           // common.curUserData = Utils.getUserInfo()
            //self.mainWindow(sb: sb)
            self.showPre(sb: sb)
            return
        }
            
        if (common.getUserName() == "anonymous") // Ya existe la información copiala a commonCopia la información a common.
        {
            // common.curUserData = Utils.getUserInfo()
            //self.mainWindow(sb: sb)
            self.showPre(sb: sb)
            return
        }
            
          self.login(sb: sb)
        
        
        
        
        
    }

    
    
    func login(sb: UIStoryboard)  {
        
        //self.window?.rootViewController?.dismiss(animated: true, completion: nil)
        
        let loginController = sb.instantiateViewController(withIdentifier: "loginController")
        let NavLoginController: navloginController = navloginController(rootViewController: loginController)
        NavLoginController.setToolbarHidden(true, animated: false)
        
        self.window?.rootViewController = NavLoginController
        self.window?.makeKeyAndVisible()
        
        
    }

    func mainWindow(sb: UIStoryboard){
        
        //let mainController = sb.instantiateViewController(withIdentifier: "mainController")
        let mainController = sb.instantiateViewController(withIdentifier: "mainTabviewController")
        
        let NavMainController: navMainController = navMainController(rootViewController: mainController)
        NavMainController.setToolbarHidden(true, animated: false)
        
        self.window?.rootViewController = NavMainController
        self.window?.makeKeyAndVisible()
        
    }
    
    func showPre(sb: UIStoryboard){
        
        let mainController = sb.instantiateViewController(withIdentifier: "presentationController")
        let NavMainController: navPresentationController = navPresentationController(rootViewController: mainController)
        NavMainController.setToolbarHidden(true, animated: false)
        
        self.window?.rootViewController = NavMainController
        self.window?.makeKeyAndVisible()
        
    }
    
    
    func showMainWindow(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        self.mainWindow(sb: sb)
        
        
    }
    

    
    func deauth(){
        
       Utils.removeUserInfo()
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        self.login(sb: sb)
        
    }
    // Extra
    

    
    
}

