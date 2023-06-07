//
//  LoginVC.swift
//  UBank
//
//  Created by Corry Timothy on 8/5/2023.
//

import UIKit
import Combine
import Foundation
import Firebase

class LoginVC: UIViewController {
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
        view.backgroundColor = UIColor.Background
        setUpTableView()
    }
    
    func setUpTableView() {
        view.addSubview(GreetingsLabel)
        GreetingsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 90).isActive = true
        GreetingsLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        GreetingsLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(LogOnButton)
        LogOnButton.topAnchor.constraint(equalTo: GreetingsLabel.bottomAnchor, constant: 5).isActive = true
        LogOnButton.leftAnchor.constraint(equalTo: GreetingsLabel.leftAnchor, constant: 0).isActive = true
        LogOnButton.widthAnchor.constraint(equalToConstant: 110).isActive = true
        LogOnButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(PasswordTextField)
        PasswordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        PasswordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        PasswordTextField.widthAnchor.constraint(equalToConstant: 150).isActive = true
        PasswordTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(EnterLabel)
        EnterLabel.topAnchor.constraint(equalTo: PasswordTextField.topAnchor, constant: -25).isActive = true
        EnterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        
        view.addSubview(ForgotLabel)
        ForgotLabel.topAnchor.constraint(equalTo: PasswordTextField.bottomAnchor, constant: 15).isActive = true
        ForgotLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        
        view.addSubview(ResetButton)
        ResetButton.topAnchor.constraint(equalTo: PasswordTextField.bottomAnchor, constant: 15).isActive = true
        ResetButton.leftAnchor.constraint(equalTo: ForgotLabel.leftAnchor, constant: 0).isActive = true
        ResetButton.rightAnchor.constraint(equalTo: ForgotLabel.rightAnchor, constant: 0).isActive = true
        ResetButton.topAnchor.constraint(equalTo: ForgotLabel.topAnchor, constant: 0).isActive = true
    }
    
    var GreetingsLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.heavy)
        label.textColor = UIColor.CustomBlack
        label.backgroundColor = UIColor.clear
        label.text = "Welcome Back"
        label.clipsToBounds = true
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
    var ForgotLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 11, weight: UIFont.Weight.bold)
        label.textColor = UIColor.blue
        label.backgroundColor = UIColor.clear
        label.text = "Access pin reset"
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
    
    lazy var ResetButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(ResetButtonFunc), for: .touchUpInside)
        button.layer.masksToBounds = true
        button.layer.zPosition = 2
        button.layer.cornerRadius = 7.5
        return button
    }()
    
    @objc func ResetButtonFunc() {
        print("forgt your pin?")
        Alert.show(title: "Pin reset instructions have been emailed to you", message: "", vc: self)
    }
    
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
