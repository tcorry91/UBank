//
//  ViewController.swift
//  FlightCenterRebuiltForGit
//
//  Created by Corry Timothy on 20/4/2023.
//

import UIKit
import Combine
import Foundation

class LoginVC: UIViewController {

  
   
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
        self.navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.isTranslucent = true
//        self.navigationItem.title = value.localise()
        view.backgroundColor = UIColor.Background
     setUpTableView()
    }
    
    func setUpTableView() {
        view.addSubview(GreetingsLabel)
        GreetingsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        GreetingsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        GreetingsLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

        view.addSubview(LogOnButton)
        LogOnButton.topAnchor.constraint(equalTo: GreetingsLabel.bottomAnchor, constant: 25).isActive = true
        LogOnButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        LogOnButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
        LogOnButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
    }
    
    
    var GreetingsLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.heavy)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.clear
        label.text = "Good evening"
        label.clipsToBounds = true
        label.sizeToFit()
        return label
    }()
    
//    var GreetingsbackgroundLabel: UILabel = {
//        var label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textAlignment = .center
//        label.layer.zPosition = 2
//        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
//        label.textColor = UIColor.black
//        label.backgroundColor = UIColor.white
////        label.text = "Good Afternoon"
//        label.clipsToBounds = true
//        label.sizeToFit()
//        return label
//    }()
  
    
    
    
    
    lazy var LogOnButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .white
//        button.setImage(UIImage(systemName: "clear"), for: .normal)
        button.tintColor = UIColor.black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
        button.layer.masksToBounds = true
        button.contentMode = .scaleAspectFit
        button.titleLabel?.text = "Log in"
        button.layer.zPosition = 2
        return button
    }()
    
    @objc func login() {
        print("logging in")
    }
    
    
}






