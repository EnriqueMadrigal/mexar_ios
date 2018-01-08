//
//  AppDelegate.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 21/11/17.
//  Copyright © 2017 datalabor.com.mx. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    
    let notificationName1 = Notification.Name("loginNT")
    let notificationName2 = Notification.Name("logoutNT")
    let notificationName3 = Notification.Name("wakeApp")


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //AIzaSyB0Go84LSXVHm095ueyiH0Mr_SLkjHPCdo
        
        GMSServices.provideAPIKey("AIzaSyB0Go84LSXVHm095ueyiH0Mr_SLkjHPCdo")
        GMSPlacesClient.provideAPIKey("AIzaSyB0Go84LSXVHm095ueyiH0Mr_SLkjHPCdo")
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.loginNTF), name: notificationName1, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.loginNTF), name: notificationName2, object: nil)
        
        
        self.auth()
        return true
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
        
        let notificationName: String = notification.name._rawValue as String
        
        if ( notificationName == "loginNT")
        {
            
            debugPrint("loginNT")
            self.auth()
            
            
        }
            
        else if (notificationName == "logoutNT")
        {
            debugPrint("logoutNT")
         //  self.deauth()
            
        }
        
        
    }
    

    
    
    func auth() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        
      //  let curUID = Utils.getStringKey(namekey: "piagi_uid")
        
     //   if (!curUID.isEmpty) // Ya existe la información copiala a commonCopia la información a common.
     //   {
     //       common.curUserData = Utils.getUserInfo()
     //       self.app(sb: sb)
     //   }
            
            
            
      //  else  // De lo contrario hacer el login.
      //  {
            //self.login(sb: sb)
        self.mainWindow(sb: sb)
      //  }
        
        
        
        
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
        
        let mainController = sb.instantiateViewController(withIdentifier: "mainController")
        let NavMainController: navMainController = navMainController(rootViewController: mainController)
        NavMainController.setToolbarHidden(true, animated: false)
        
        self.window?.rootViewController = NavMainController
        self.window?.makeKeyAndVisible()
        
    }

}

