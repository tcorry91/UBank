//
//  WelcomeVC.swift
//  UBank
//
//  Created by Corry Timothy on 8/5/2023.
//

import UIKit
import Firebase

class WelcomeVC: UIViewController {
    
    var mainCor: MainCoordinator
    init(coordinator: MainCoordinator) {
        self.mainCor = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        Constraints()
    }
    
    func Constraints() {
        
        view.addSubview(logoImage)
        logoImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        logoImage.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        view.addSubview(UBankLabel)
        UBankLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 0).isActive = true
        UBankLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        UBankLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        UBankLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.mainCor.start()
        }
        
    }
    
    let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(systemName: "banknote.fill")
        imageView.tintColor = UIColor.MoneyGreen
        imageView.contentMode = .scaleAspectFit
        imageView.layer.zPosition = 3
        return imageView
    }()
    var WelcomeLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 4
        label.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.bold)
        label.textColor = UIColor.black
        label.text = "Welcome"
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
}
