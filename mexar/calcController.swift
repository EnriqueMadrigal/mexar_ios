//
//  calcController.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 03/01/18.
//  Copyright © 2018 datalabor.com.mx. All rights reserved.
//

import UIKit

class calcController: UIViewController {

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

    @IBAction func calcFontaneria(_ sender: Any) {
          performSegue(withIdentifier: "showFontaneria", sender: nil)
    }
}
