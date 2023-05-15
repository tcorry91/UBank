//
//  TransactionCell.swift
//  UBank
//
//  Created by Corry Timothy on 8/5/2023.
//

import UIKit

class TransactionCell: UITableViewCell {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        TransactionImage.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        TransactionImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        TransactionImage.heightAnchor.constraint(equalToConstant: 35).isActive = true
        TransactionImage.widthAnchor.constraint(equalToConstant: 35).isActive = true
        
        Transaction.topAnchor.constraint(equalTo: TransactionImage.topAnchor, constant: 0).isActive = true
        Transaction.leftAnchor.constraint(equalTo: TransactionImage.rightAnchor, constant: 3).isActive = true
        Transaction.widthAnchor.constraint(equalToConstant: 180).isActive = true
        Transaction.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        TransactionCurrency.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        TransactionCurrency.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        self.contentView.isUserInteractionEnabled = true
        addSubview(TransactionImage)
        addSubview(Transaction)
        addSubview(TransactionCurrency)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let TransactionImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(systemName: "dollarsign.square.fill")
        imageView.tintColor = UIColor.gray
        imageView.contentMode = .scaleAspectFit
        imageView.layer.zPosition = 3
        return imageView
    }()
    var Transaction: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.light)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.clear
        label.numberOfLines = 0
        label.clipsToBounds = true
        label.layer.borderWidth = 1
        label.layer.borderColor = CGColor(gray: 0, alpha: 0)
        return label
    }()
    var TransactionCurrency: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.bold)
        label.textColor = UIColor.CustomBlack
        label.backgroundColor = UIColor.clear
        label.numberOfLines = 0
        label.clipsToBounds = true
        label.layer.borderWidth = 1
        label.layer.borderColor = CGColor(gray: 0, alpha: 0)
        return label
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
