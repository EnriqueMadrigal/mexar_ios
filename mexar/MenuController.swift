//
//  MenuController.swift
//  fbook
//
//  Created by Usuario on 10/04/17.
//  Copyright © 2017 Piagui. All rights reserved.
//

import UIKit
import UserNotifications
import GoogleSignIn


class MenuController: UITableViewController {

    
    var menuItems = MenuItems()
    
    let notificationName1 = Notification.Name("loginNT")
    let notificationName2 = Notification.Name("logoutNT")
    let notificationName3 = Notification.Name("updateApp")

    
    var cur_page: (Int) = 0

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        //self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "sideBarCell")
       // self.tableView.register(sideBarCell.self, forCellReuseIdentifier: "sideBarCell")
        
        self.tableView.tableFooterView = UIView()
        
        let logoImage:UIImage = UIImage(named: "icon_mexar")!
        self.navigationItem.titleView = UIImageView(image: logoImage)
        
        self.tableView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menuItems.names.count
    }

    
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sideBarCell", for: indexPath) as! sideBarCell

        
        let row = indexPath.row
        let rowLabel = menuItems.names[row]
        let imageName = menuItems.icon_images[row]
        
        cell.MenuLabel?.text = rowLabel
        cell.MenuIcon?.image = UIImage(named: imageName)
        
        // Configure the cell...

        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       //
        

        let cur_item = indexPath.row
        
        
        switch cur_item {
        case 0:  // HOME
            //if (self.cur_page == 0) { return }
             
            //let vc = mainStoryboard.instantiateViewController(withIdentifier: "mainController") as! mainController
            //self.show(vc, sender: nil)
 
            self.cur_page = 0
            self.dismiss(animated: true, completion: nil)
            
          
            
            break
        
            
        case 1: // Tutoriales
            self.dismiss(animated: true, completion: nil)
            let url = NSURL(string: "https://www.youtube.com/channel/UClb61WrMZ9xT5mMne_-9pMw")!
            UIApplication.shared.openURL(url as URL)
                       break
            

        case 2: // Show Calc
            
        self.dismiss(animated: true, completion: nil)
        performSegue(withIdentifier: "showCalc", sender: nil)
        self.cur_page = 2
        
            break
   
            
            
        case 3:  // Show distruibuidores
            self.dismiss(animated: true, completion: nil)
            performSegue(withIdentifier: "showDistribuidor", sender: nil)
            self.cur_page = 2
     
            
            
            break
      
            
            
              case 4:  // Actualizar
            self.dismiss(animated: true, completion: nil)
         //       NotificationCenter.default.post(name: self.notificationName3, object: nil)
         
           
            
            break
            
            
            
            
        case 5:  // Contacto
            self.dismiss(animated: true, completion: nil)
            performSegue(withIdentifier: "showContacto", sender: nil)
           
            break
            
            
        case 6:  // Cerrar Sessión
           
            self.dismiss(animated: true, completion: nil)
           // NotificationCenter.default.post(name: self.notificationName2, object: nil)
            let loginType: String = Utils.getStringKey(namekey: common.VAR_LOGIN_TYPE)
            
            if (loginType == "google"){
                GIDSignIn.sharedInstance().signOut()
            }
         
             let when = DispatchTime.now() + 2 // change 2 to desired number of seconds
             DispatchQueue.main.asyncAfter(deadline: when) {  // Tiempo para permitir al menu que se cierre
                // Your code with delay
                NotificationCenter.default.post(name: self.notificationName2, object: nil)
                
            }
           
            
        break
             
            
            
        default:
            
        break
        }
        
        
        
   }
    
       

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        print(segue.identifier ?? "No seague")
        
    }
   
   
    
}
