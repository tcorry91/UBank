//
//  MyCollectionViewCell.swift
//  CollectionView
//
//  Created by Corry Timothy on 26/5/2023.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var myImageVIew: UIImageView!
    
    @IBOutlet var ActivateLabel: UILabel!
    @IBOutlet var myLabel2: UILabel!
    
    
    @IBOutlet var dateLabel: UILabel!
    
    static let identifier = "MyCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    
    
    public func configure(with model: Model) {
        self.myLabel2.text = model.text
        self.myImageVIew.image = UIImage(named: model.imageName)
        self.myImageVIew.contentMode = .scaleAspectFill
        self.dateLabel.text = model.date
    }
    
    
}
