//
//  userController.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 1/7/19.
//  Copyright © 2019 datalabor.com.mx. All rights reserved.
//

import UIKit

class userController: UIViewController {

    public weak var delegate: userDelegate?
    
    @IBAction func cerrar_click(_ sender: Any) {
        self.delegate?.cerrarSession()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
