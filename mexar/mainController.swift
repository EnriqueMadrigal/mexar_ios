//
//  mainController.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 27/11/17.
//  Copyright © 2017 datalabor.com.mx. All rights reserved.
//

import UIKit

class mainController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let logoImage:UIImage = UIImage(named: "icon_mexar")!
        self.navigationItem.titleView = UIImageView(image: logoImage)

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

}
