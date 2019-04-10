//
//  categoriasCells.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 28/11/17.
//  Copyright © 2017 datalabor.com.mx. All rights reserved.
//

import UIKit

class categoriasCells: UITableViewCell {

    @IBOutlet weak var categoria_icon: UIImageView!
    
    
    //@IBOutlet weak var categoria_desc: UILabel!
    
    //@IBOutlet weak var categoria_desc: UITextView!
    
    @IBOutlet weak var categoria_desc: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
