//
//  PayInitialVC.swift
//  UBank
//
//  Created by Corry Timothy on 24/5/2023.
//

import UIKit
import Combine
import Foundation
import Firebase

class PayInitialVC: UIViewController {
    var mainCor: MainCoordinator
    init(coordinator: MainCoordinator) {
        self.mainCor = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var emailString = "Jame@gmail.com"
    override func viewDidLoad() {
        
        super.viewDidLoad()
        PasswordTextField.becomeFirstResponder()
        view.backgroundColor = UIColor.white
        self.navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.isTranslucent = true
        navigationItem.hidesBackButton = true
        setUpTableView()
        gradient.frame = view.bounds
        view.layer.addSublayer(gradient)
    }
    
    func setUpTableView() {
        view.addSubview(CardlessLabel)
        CardlessLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100).isActive = true
        CardlessLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        view.addSubview(DividerLine)
        DividerLine.topAnchor.constraint(equalTo: CardlessLabel.bottomAnchor, constant: 20).isActive = true
        DividerLine.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        DividerLine.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        DividerLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        view.addSubview(TransferLabel)
        TransferLabel.topAnchor.constraint(equalTo: DividerLine.bottomAnchor, constant: 20).isActive = true
        TransferLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        view.addSubview(DividerLine1)
        DividerLine1.topAnchor.constraint(equalTo: TransferLabel.bottomAnchor, constant: 20).isActive = true
        DividerLine1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        DividerLine1.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        DividerLine1.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        view.addSubview(PaySomeoneLabel)
        PaySomeoneLabel.topAnchor.constraint(equalTo: DividerLine1.bottomAnchor, constant: 20).isActive = true
        PaySomeoneLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        
        view.addSubview(DividerLine2)
        DividerLine2.topAnchor.constraint(equalTo: PaySomeoneLabel.bottomAnchor, constant: 20).isActive = true
        DividerLine2.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        DividerLine2.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        DividerLine2.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        view.addSubview(BPayLabel)
        BPayLabel.topAnchor.constraint(equalTo: DividerLine2.bottomAnchor, constant: 20).isActive = true
        BPayLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        view.addSubview(CloseButton)
        CloseButton.topAnchor.constraint(equalTo: BPayLabel.bottomAnchor, constant: 70).isActive = true
        CloseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        CloseButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        CloseButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    
    lazy var gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.colors = [
            UIColor.Background.cgColor,
            UIColor.CustomWhite.cgColor,
        ]
        gradient.locations = [0, 1]
        return gradient
    }()
    
    var PaySomeoneLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.heavy)
        label.textColor = UIColor.CustomBlack
        label.backgroundColor = UIColor.clear
        label.text = "Pay Someone"
        label.clipsToBounds = true
        label.sizeToFit()
        return label
    }()
    
    
    var BPayLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.heavy)
        label.textColor = UIColor.CustomBlack
        label.backgroundColor = UIColor.clear
        label.text = "BPAY"
        label.clipsToBounds = true
        label.sizeToFit()
        return label
    }()
    
    var TransferLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.heavy)
        label.textColor = UIColor.CustomBlack
        label.backgroundColor = UIColor.clear
        label.text = "Transfer between Accounts"
        label.clipsToBounds = true
        label.sizeToFit()
        return label
    }()
    
    var CardlessLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.heavy)
        label.textColor = UIColor.CustomBlack
        label.backgroundColor = UIColor.clear
        label.text = "Cardless Cash and Deposits"
        label.clipsToBounds = true
        label.sizeToFit()
        return label
    }()
    
    var DividerLine: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.heavy)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.lightGray
        label.clipsToBounds = true
        label.layer.cornerRadius = 8.5
        label.sizeToFit()
        return label
    }()
    
    var DividerLine1: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.heavy)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.lightGray
        label.clipsToBounds = true
        label.layer.cornerRadius = 8.5
        label.sizeToFit()
        return label
    }()
    
    var DividerLine2: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.heavy)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.lightGray
        label.clipsToBounds = true
        label.layer.cornerRadius = 8.5
        label.sizeToFit()
        return label
    }()
    
    var EnterLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        label.textColor = UIColor.Customgrey
        label.backgroundColor = UIColor.clear
        label.text = "Please enter your six digit access pin"
        label.clipsToBounds = true
        label.sizeToFit()
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
    
    let PasswordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Pin"
        tf.font =  UIFont(name: "Arial", size: 15)
        tf.backgroundColor = .white
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.zPosition = 2
        tf.layer.cornerRadius = 5
        tf.layer.borderWidth = 0.5
        tf.layer.borderColor = UIColor.lightGray.withAlphaComponent(1.0).cgColor
        tf.textAlignment = .center
        tf.isSecureTextEntry = true
        tf.keyboardType = .asciiCapableNumberPad
        
        
        return tf
    }()
    
    var CloseButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(Close), for: .touchUpInside)
        button.layer.masksToBounds = true
        button.contentMode = .scaleAspectFit
        
        button.setTitle("Close", for: .normal)
        button.setTitleColor(UIColor.CustomBlack, for: .normal)
        
        button.layer.zPosition = 2
        button.layer.cornerRadius = 7.5
        return button
    }()
    
    @objc func Close() {
        print("closing VC, returning to MainMenu")
        self.mainCor.MainMenu()
    }
    
    lazy var LogOnButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleLoginRegister), for: .touchUpInside)
        button.layer.masksToBounds = true
        button.contentMode = .scaleAspectFit
        
        button.setTitle("Log In", for: .normal)
        
        
        button.layer.zPosition = 2
        button.layer.cornerRadius = 7.5
        return button
    }()
    
    @objc func login() {
        self.mainCor.MainMenu()
    }
    
    @objc func handleLoginRegister() {
        handleLogin()
    }
    
    func handleLogin() {
        let email = emailString
        guard let password = PasswordTextField.text
        else {
            return
        }
        var emptyString3 = PasswordTextField.text
        var emptyString4 = ""
        if emptyString3 == emptyString4 {
            Alert.show(title: "Please enter your pin", message: "", vc: self)
            return
        } else {  print("userFirstName") }
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                Alert.show(title: "Incorrect Pin", message: "Please try again", vc: self)
                return
            } else {
                guard let uid = Auth.auth().currentUser?.uid else { return }
                self.viewLink()
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @objc func viewLink() {
        self.mainCor.MainMenu()
    }
}
