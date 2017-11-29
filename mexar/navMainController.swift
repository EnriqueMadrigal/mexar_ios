//
//  navMainController.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 27/11/17.
//  Copyright © 2017 datalabor.com.mx. All rights reserved.
//

import UIKit

class navMainController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationBar.barTintColor = UIColor.mexar_blue1()
        self.navigationBar.tintColor = UIColor.mexar_white()
        self.navigationBar.isTranslucent = false;

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
