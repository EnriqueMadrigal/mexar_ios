//
//  mainCellView.swift
//  mexar
//
//  Created by Enrique Madrigal Gutierrez on 12/29/18.
//  Copyright © 2018 datalabor.com.mx. All rights reserved.
//

import UIKit


protocol mainCellDelegate {
    func mainCellView(didSelect icon: mainIcon_Class)
}


class mainCellView: UITableViewCell {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var delegate: mainCellDelegate?
    var main_icons: [mainIcon_Class]?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func configWith(icons: [mainIcon_Class]) {
        self.main_icons = icons
        collectionView.reloadData()
    }
    
}



//MARK: Collection
extension mainCellView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return main_icons?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCollectionCell", for: indexPath) as! mainCollection
        
        let cur_icon = main_icons![indexPath.row]
        let res_name = cur_icon.getResName()
        
        let imageNoDisp = UIImage(named: res_name)
        
        
        cell.imageViewCollection.image = imageNoDisp
        cell.imageViewCollection.clipsToBounds = true
        cell.imageViewCollection.contentMode = .scaleToFill
        cell.labelCollection.text = cur_icon.getName()
        
        
        //cell.imgView.image = book.image
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cur_icon = main_icons![indexPath.row]
        
        delegate?.mainCellView(didSelect: cur_icon)
    }
}

