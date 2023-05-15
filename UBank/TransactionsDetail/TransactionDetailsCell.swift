//
//  TransactionDetailsCell.swift
//  UBank
//
//  Created by Corry Timothy on 8/5/2023.
//

import UIKit


class TransactionDetailsCell: UITableViewCell {
    override func layoutSubviews() {
        super.layoutSubviews()
        WhiteLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 130).isActive = true
        WhiteLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        WhiteLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        WhiteLabel.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        logoImage.topAnchor.constraint(equalTo: WhiteLabel.bottomAnchor, constant: 80).isActive = true
        logoImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        logoImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        logoImage.widthAnchor.constraint(equalToConstant: 110).isActive = true
        
        UBankLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 0).isActive = true
        UBankLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        UBankLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        UBankLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        TransactionsLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 60).isActive = true
        TransactionsLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        TransactionsLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        TransactionsLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        DollarImage.topAnchor.constraint(equalTo: WhiteLabel.topAnchor, constant: 20).isActive = true
        DollarImage.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        DollarImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        DollarImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        MoneyLabel.topAnchor.constraint(equalTo: DollarImage.bottomAnchor, constant: 15).isActive = true
        MoneyLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        
        TransactionActualLabel.topAnchor.constraint(equalTo: MoneyLabel.bottomAnchor, constant: 10).isActive = true
        TransactionActualLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        TransactionActualLabel.heightAnchor.constraint(equalToConstant: 90).isActive = true
        TransactionActualLabel.widthAnchor.constraint(equalToConstant: 210).isActive = true
        
        TransacitonTimeLabel.topAnchor.constraint(equalTo: TransactionActualLabel.bottomAnchor, constant: 5).isActive = true
        TransacitonTimeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        TransacitonTimeLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        TransacitonTimeLabel.widthAnchor.constraint(equalToConstant: 210).isActive = true
        
        TransacitonDateLabel.topAnchor.constraint(equalTo: TransacitonTimeLabel.bottomAnchor, constant: 5).isActive = true
        TransacitonDateLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        TransacitonDateLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        TransacitonDateLabel.widthAnchor.constraint(equalToConstant: 210).isActive = true
        
        ReceiptNumberLabel.topAnchor.constraint(equalTo: TransacitonDateLabel.bottomAnchor, constant: 5).isActive = true
        ReceiptNumberLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        ReceiptNumberLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        ReceiptNumberLabel.widthAnchor.constraint(equalToConstant: 210).isActive = true
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        self.contentView.isUserInteractionEnabled = true
        self.addSubview(WhiteLabel)
        self.addSubview(logoImage)
        self.addSubview(UBankLabel)
        self.addSubview(TransactionsLabel)
        self.addSubview(DollarImage)
        self.addSubview(MoneyLabel)
        self.addSubview(TransactionActualLabel)
        self.addSubview(TransacitonTimeLabel)
        self.addSubview(TransacitonDateLabel)
        self.addSubview(ReceiptNumberLabel)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var TransactionsLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.heavy)
        label.textColor = UIColor.CustomBlack
        label.backgroundColor = UIColor.clear
        label.text = "Transactions and payments"
        label.clipsToBounds = true
        label.sizeToFit()
        return label
    }()
    var WhiteLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.light)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.white
        label.numberOfLines = 0
        label.clipsToBounds = true
        label.layer.borderWidth = 1
        label.layer.borderColor = CGColor(gray: 0, alpha: 0)
        return label
    }()
    let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(systemName: "banknote.fill")
        imageView.tintColor = UIColor.BankNote
        imageView.contentMode = .scaleAspectFit
        imageView.layer.zPosition = 3
        return imageView
    }()
    let DollarImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(systemName: "dollarsign")
        imageView.tintColor = UIColor.BankNote
        imageView.contentMode = .scaleAspectFit
        imageView.layer.zPosition = 3
        return imageView
    }()
    var TransactionActualLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 4
        label.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.regular)
        label.textColor = UIColor.CustomBlack
        label.backgroundColor = UIColor.clear
        label.numberOfLines = 0
        label.clipsToBounds = true
        label.sizeToFit()
        return label
    }()
    var TransacitonDateLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 4
        label.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.regular)
        label.textColor = UIColor.CustomBlack
        label.backgroundColor = UIColor.clear
        label.numberOfLines = 0
        label.clipsToBounds = true
        label.sizeToFit()
        return label
    }()
    var TransacitonTimeLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 4
        label.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.regular)
        label.textColor = UIColor.CustomBlack
        label.backgroundColor = UIColor.clear
        label.numberOfLines = 0
        label.clipsToBounds = true
        label.sizeToFit()
        return label
    }()
    var ReceiptNumberLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 4
        label.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.regular)
        label.textColor = UIColor.Customgrey
        label.backgroundColor = UIColor.clear
        label.numberOfLines = 0
        label.clipsToBounds = true
        label.sizeToFit()
        return label
    }()
    var MoneyLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 4
        label.font = UIFont.systemFont(ofSize: 32, weight: UIFont.Weight.bold)
        label.textColor = UIColor.CustomBlack
        label.backgroundColor = UIColor.clear
        label.numberOfLines = 0
        label.clipsToBounds = true
        label.sizeToFit()
        return label
    }()
    var UBankLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 4
        label.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.bold)
        label.textColor = UIColor.black
        label.text = "UBank"
        label.backgroundColor = UIColor.clear
        label.numberOfLines = 0
        label.clipsToBounds = true
        label.sizeToFit()
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
