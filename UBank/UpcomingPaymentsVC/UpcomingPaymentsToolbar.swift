//
//  UpcmingPaymentsToolbar.swift
//  UBank
//
//  Created by Corry Timothy on 8/5/2023.
//

import Foundation
import UIKit

extension UpcomingPaymentsVC {
    func ToolBarSetup() {
        
        var DividerLine: UILabel = {
            var label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.layer.zPosition = 2
            label.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.heavy)
            label.textColor = UIColor.black
            label.backgroundColor = UIColor.CustomBlack
            label.clipsToBounds = true
            label.layer.cornerRadius = 8.5
            label.sizeToFit()
            return label
        }()
        
        var ToolBarBackground: UILabel = {
            var label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.layer.zPosition = 2
            label.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.heavy)
            label.textColor = UIColor.black
            label.backgroundColor = UIColor.CustomWhite
            label.clipsToBounds = true
            label.sizeToFit()
            return label
        }()
        let AccountsBottomImage: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.layer.masksToBounds = true
            imageView.image = UIImage(systemName: "books.vertical.fill")
            imageView.tintColor = UIColor.gray
            imageView.contentMode = .scaleAspectFill
            imageView.layer.zPosition = 3
            return imageView
        }()
        var AccountsBottomImageLabel: UILabel = {
            var label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.layer.zPosition = 2
            label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.regular)
            label.textColor = UIColor.Customgrey
            label.backgroundColor = UIColor.clear
            label.text = "Accounts"
            label.clipsToBounds = true
            label.sizeToFit()
            return label
        }()
        let PaymentImage: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.layer.masksToBounds = true
            imageView.image = UIImage(systemName: "dollarsign.circle.fill")
            imageView.tintColor = UIColor.gray
            imageView.contentMode = .scaleAspectFit
            imageView.layer.zPosition = 3
            return imageView
        }()
        var PaymentImageLabel: UILabel = {
            var label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.layer.zPosition = 2
            label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.regular)
            label.textColor = UIColor.CustomBlack
            label.backgroundColor = UIColor.clear
            label.text = "Payment"
            label.clipsToBounds = true
            label.sizeToFit()
            return label
        }()
        let RewardsImage: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.layer.masksToBounds = true
            imageView.image = UIImage(systemName: "gift.circle.fill")
            imageView.tintColor = UIColor.gray
            imageView.contentMode = .scaleAspectFit
            imageView.layer.zPosition = 3
            return imageView
        }()
        var RewardsImageLabel: UILabel = {
            var label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.layer.zPosition = 2
            label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.regular)
            label.textColor = UIColor.CustomBlack
            label.backgroundColor = UIColor.clear
            label.text = "Rewards"
            label.clipsToBounds = true
            label.sizeToFit()
            return label
        }()
        var AccountsButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = UIColor.clear
            button.setTitleColor(UIColor.white, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            button.addTarget(self, action: #selector(goingToAccounts), for: .touchUpInside)
            button.layer.zPosition = 5
            button.layer.cornerRadius = 0
            button.clipsToBounds = true
            button.layer.cornerRadius = 5
            return button
        }()
        var PaymentButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = UIColor.clear
            button.setTitleColor(UIColor.white, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            button.addTarget(self, action: #selector(goingToPayments), for: .touchUpInside)
            button.layer.zPosition = 5
            button.layer.cornerRadius = 0
            button.clipsToBounds = true
            button.layer.cornerRadius = 5
            return button
        }()
        var RewardsButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = UIColor.clear
            button.setTitleColor(UIColor.white, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            button.addTarget(self, action: #selector(goingToRewards), for: .touchUpInside)
            button.layer.zPosition = 5
            button.layer.cornerRadius = 0
            button.clipsToBounds = true
            button.layer.cornerRadius = 5
            return button
            
           
            
        }()
        
        let HomeImage: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.layer.masksToBounds = true
            imageView.image = UIImage(systemName: "house.fill")
            imageView.tintColor = UIColor.gray
            imageView.contentMode = .scaleAspectFit
            imageView.layer.zPosition = 3
            return imageView
        }()
        var HomeImageLabel: UILabel = {
            var label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.layer.zPosition = 2
            label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.regular)
            label.textColor = UIColor.CustomBlack
            label.backgroundColor = UIColor.clear
            label.text = "Home"
            label.clipsToBounds = true
            label.sizeToFit()
            return label
        }()
        var HomeButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = UIColor.clear
            button.setTitleColor(UIColor.white, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            button.addTarget(self, action: #selector(goingToHome), for: .touchUpInside)
            button.layer.zPosition = 5
            button.layer.cornerRadius = 0
            button.clipsToBounds = true
            button.layer.cornerRadius = 5
            return button
        }()
        
        
       
        
        view.addSubview(ToolBarBackground)
        ToolBarBackground.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
        ToolBarBackground.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        ToolBarBackground.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        ToolBarBackground.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        view.addSubview(DividerLine)
        DividerLine.topAnchor.constraint(equalTo: ToolBarBackground.topAnchor, constant: 0).isActive = true
        DividerLine.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        DividerLine.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        DividerLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        view.addSubview(AccountsBottomImage)
        AccountsBottomImage.topAnchor.constraint(equalTo: DividerLine.bottomAnchor, constant: 11).isActive = true
        AccountsBottomImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        AccountsBottomImage.heightAnchor.constraint(equalToConstant: 28).isActive = true
        AccountsBottomImage.widthAnchor.constraint(equalToConstant: 28).isActive = true
        
        view.addSubview(AccountsBottomImageLabel)
        AccountsBottomImageLabel.topAnchor.constraint(equalTo: AccountsBottomImage.bottomAnchor, constant: 0).isActive = true
        AccountsBottomImageLabel.centerXAnchor.constraint(equalTo: AccountsBottomImage.centerXAnchor, constant: 0).isActive = true
        
        view.addSubview(AccountsButton)
        AccountsButton.topAnchor.constraint(equalTo: DividerLine.bottomAnchor, constant: 11).isActive = true
        AccountsButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        AccountsButton.heightAnchor.constraint(equalToConstant: 28).isActive = true
        AccountsButton.widthAnchor.constraint(equalToConstant: 28).isActive = true
        
        
        view.addSubview(HomeImage)
        HomeImage.topAnchor.constraint(equalTo: AccountsBottomImage.topAnchor, constant: 0).isActive = true
        HomeImage.leftAnchor.constraint(equalTo: AccountsBottomImage.rightAnchor, constant: 70).isActive = true
        HomeImage.heightAnchor.constraint(equalToConstant: 28).isActive = true
        HomeImage.widthAnchor.constraint(equalToConstant: 28).isActive = true
        
        view.addSubview(HomeImageLabel)
        HomeImageLabel.topAnchor.constraint(equalTo: AccountsBottomImage.bottomAnchor, constant: 0).isActive = true
        HomeImageLabel.centerXAnchor.constraint(equalTo: HomeImage.centerXAnchor, constant: 0).isActive = true
        
        view.addSubview(HomeButton)
        HomeButton.topAnchor.constraint(equalTo: AccountsBottomImage.topAnchor, constant: 0).isActive = true
        HomeButton.leftAnchor.constraint(equalTo: AccountsBottomImage.rightAnchor, constant: 70).isActive = true
        HomeButton.heightAnchor.constraint(equalToConstant: 28).isActive = true
        HomeButton.widthAnchor.constraint(equalToConstant: 28).isActive = true
        
        view.addSubview(PaymentImage)
        PaymentImage.topAnchor.constraint(equalTo: AccountsBottomImage.topAnchor, constant: 0).isActive = true
        PaymentImage.leftAnchor.constraint(equalTo: HomeImage.rightAnchor, constant: 70).isActive = true
        PaymentImage.heightAnchor.constraint(equalToConstant: 28).isActive = true
        PaymentImage.widthAnchor.constraint(equalToConstant: 28).isActive = true

        view.addSubview(PaymentImageLabel)
        PaymentImageLabel.topAnchor.constraint(equalTo: AccountsBottomImage.bottomAnchor, constant: 0).isActive = true
        PaymentImageLabel.centerXAnchor.constraint(equalTo: PaymentImage.centerXAnchor, constant: 0).isActive = true

        view.addSubview(PaymentButton)
        PaymentButton.topAnchor.constraint(equalTo: AccountsBottomImage.topAnchor, constant: 0).isActive = true
        PaymentButton.leftAnchor.constraint(equalTo: HomeImage.rightAnchor, constant: 70).isActive = true
        PaymentButton.heightAnchor.constraint(equalToConstant: 28).isActive = true
        PaymentButton.widthAnchor.constraint(equalToConstant: 28).isActive = true

        
        view.addSubview(RewardsImage)
        RewardsImage.topAnchor.constraint(equalTo: AccountsBottomImage.topAnchor, constant: 0).isActive = true
        RewardsImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -55).isActive = true
        RewardsImage.heightAnchor.constraint(equalToConstant: 28).isActive = true
        RewardsImage.widthAnchor.constraint(equalToConstant: 28).isActive = true
        
        view.addSubview(RewardsImageLabel)
        RewardsImageLabel.topAnchor.constraint(equalTo: AccountsBottomImage.bottomAnchor, constant: 0).isActive = true
        RewardsImageLabel.centerXAnchor.constraint(equalTo: RewardsImage.centerXAnchor, constant: 0).isActive = true
        
        view.addSubview(RewardsButton)
        RewardsButton.topAnchor.constraint(equalTo: AccountsBottomImage.topAnchor, constant: 0).isActive = true
        RewardsButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -55).isActive = true
        RewardsButton.heightAnchor.constraint(equalToConstant: 28).isActive = true
        RewardsButton.widthAnchor.constraint(equalToConstant: 28).isActive = true
        
       
        
    }
}
