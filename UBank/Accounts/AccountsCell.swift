//
//  AccountsCell.swift
//  UBank
//
//  Created by Corry Timothy on 8/5/2023.
//

import UIKit

class AccountsCell: UITableViewCell {
    var searchDelegate: AccountsVC?
    override func layoutSubviews() {
        super.layoutSubviews()
        AccountImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        AccountImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        AccountImage.heightAnchor.constraint(equalToConstant: 35).isActive = true
        AccountImage.widthAnchor.constraint(equalToConstant: 35).isActive = true
        
        AccountTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        AccountTitle.leftAnchor.constraint(equalTo: AccountImage.rightAnchor, constant: 5).isActive = true
        
        AccountNumber.topAnchor.constraint(equalTo: AccountTitle.bottomAnchor, constant: 5).isActive = true
        AccountNumber.leftAnchor.constraint(equalTo: AccountTitle.leftAnchor, constant: 0).isActive = true

        AvailableLabel.topAnchor.constraint(equalTo: AccountNumber.bottomAnchor, constant: 20).isActive = true
        AvailableLabel.leftAnchor.constraint(equalTo: AccountNumber.leftAnchor, constant: 0).isActive = true
                
        BalanceLabel.topAnchor.constraint(equalTo: AvailableLabel.bottomAnchor, constant: 10).isActive = true
        BalanceLabel.leftAnchor.constraint(equalTo: AvailableLabel.leftAnchor, constant: 0).isActive = true
        
        AvailableAcutal.topAnchor.constraint(equalTo: AvailableLabel.topAnchor, constant: 0).isActive = true
        AvailableAcutal.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true
        
        BalanceActual.topAnchor.constraint(equalTo: BalanceLabel.topAnchor, constant: 0).isActive = true
        BalanceActual.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true
        
        OptionsImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
        OptionsImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true
        OptionsImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        OptionsImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        LogOnButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
        LogOnButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true
        LogOnButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        LogOnButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        self.contentView.isUserInteractionEnabled = true
        addSubview(AccountImage)
        addSubview(AccountTitle)
        addSubview(AccountNumber)
        addSubview(AvailableLabel)
        addSubview(BalanceLabel)
        addSubview(AvailableAcutal)
        addSubview(BalanceActual)
        addSubview(LogOnButton)
        addSubview(OptionsImage)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let AccountImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(systemName: "dollarsign.square.fill")
        imageView.tintColor = UIColor.BankNote
        imageView.contentMode = .scaleAspectFit
        imageView.layer.zPosition = 3
        return imageView
    }()
    let AccountTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.MainTitle
        label.layer.zPosition = 5
        label.textAlignment = .left
        return label
    }()
    let AccountNumber: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.MainTitle
        label.layer.zPosition = 5
        label.textAlignment = .left
        return label
    }()
    let AvailableLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Available"
        label.textColor = UIColor.MainTitle
        label.layer.zPosition = 5
        label.textAlignment = .left
        return label
    }()
    let AvailableAcutal: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.CustomBlack
        label.layer.zPosition = 5
        label.textAlignment = .left
        return label
    }()
    let BalanceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Balance"
        label.textColor = UIColor.MainTitle
        label.layer.zPosition = 5
        label.textAlignment = .left
        return label
    }()
    let BalanceActual: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.CustomBlack
        label.layer.zPosition = 5
        label.textAlignment = .left
        return label
    }()
    lazy var OfferTitle: UITextView = {
        let label = UITextView()
        label.isEditable = false
        label.textColor = .gray
        label.text = ""
        label.isHidden = false
        label.backgroundColor = UIColor.clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.zPosition = 5
        label.textAlignment = .left
        label.font = UIFont(name: "Arial", size: 12)
        label.layer.zPosition = 19
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.sizeToFit()
        label.isScrollEnabled = false
        return label
    }()
    let OptionsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(systemName: "ellipsis")
        imageView.tintColor = UIColor.black
        imageView.contentMode = .scaleAspectFit
        imageView.layer.zPosition = 3
        return imageView
    }()
    lazy var LogOnButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(Options), for: .touchUpInside)
        button.layer.masksToBounds = true
        button.contentMode = .scaleAspectFill
        button.layer.zPosition = 2
        button.layer.cornerRadius = 7.5
        return button
    }()

    @objc func Options() {
        print("options selected")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
