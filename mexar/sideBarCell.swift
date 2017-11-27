//
//  sideBarCell.swift
//  fbook
//
//  Created by Usuario on 07/04/17.
//  Copyright © 2017 Piagui. All rights reserved.
//

import UIKit

class sideBarCell: UITableViewCell {

    @IBOutlet weak var MenuIcon: UIImageView!
    @IBOutlet weak var MenuLabel: UILabel!
    
           
    override func awakeFromNib() {
       
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
