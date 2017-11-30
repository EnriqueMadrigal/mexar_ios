//
//  productsCells.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 29/11/17.
//  Copyright © 2017 datalabor.com.mx. All rights reserved.
//

import UIKit

class productsCells: UITableViewCell {

    @IBOutlet weak var product_image: UIImageView!
    
    @IBOutlet weak var label_name: UILabel!
    
    @IBOutlet weak var label_desc: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
