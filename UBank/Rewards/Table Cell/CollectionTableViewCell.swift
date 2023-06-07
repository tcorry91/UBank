//
//  CollectionTableViewCell.swift
//  CollectionView
//
//  Created by Corry Timothy on 26/5/2023.
//

import UIKit

class CollectionTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    static let identifier = "CollectionTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CollectionTableViewCell", bundle: nil)
    }
    
    func configure(with models: [Model]) {
        self.models = models
        collectionView.reloadData()
    }
    
    
    
    @IBOutlet var collectionView: UICollectionView!
    
    var models = [Model]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        cell.configure(with: models[indexPath.row])
        cell.backgroundColor = UIColor.RewardsBackground
        cell.ActivateLabel.layer.cornerRadius = 8
        cell.ActivateLabel.layer.masksToBounds = true
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 320, height: 408)
    }
    
}
