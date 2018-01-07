//
//  DistribuidoresCell.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 06/01/18.
//  Copyright © 2018 datalabor.com.mx. All rights reserved.
//

import UIKit

class DistribuidoresCell: UITableViewCell {
    @IBOutlet weak var label_nombre: UILabel!
    @IBOutlet weak var label_ciudad: UILabel!
    @IBOutlet weak var label_direccion: UILabel!
    @IBOutlet weak var label_telefonos: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
