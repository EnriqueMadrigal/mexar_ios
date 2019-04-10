//
//  distController.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 19/07/18.
//  Copyright © 2018 datalabor.com.mx. All rights reserved.
//

import UIKit

class distController: UIViewController {

    public weak var delegate: distribuidoresDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

    @IBAction func mexar_click(_ sender: Any) {
        self.delegate?.showDistribuidor(curDist: 1)
    }
 
    @IBAction func homedepot_click(_ sender: Any) {
        self.delegate?.showDistribuidor(curDist: 2)
    }
    
    
    @IBAction func facebook_click(_ sender: Any) {
        self.delegate?.showDistribuidor(curDist: 1)
    }
    
    @IBAction func twitter_click(_ sender: Any) {
        self.delegate?.showDistribuidor(curDist: 2)
    }
    
    @IBAction func linkedin_click(_ sender: Any) {
        self.delegate?.showDistribuidor(curDist: 3)
    }
    
    @IBAction func instagram_click(_ sender: Any) {
        self.delegate?.showDistribuidor(curDist: 4)
    }
}
