//
//  UpcmingPaymentsVC.swift
//  UBank
//
//  Created by Corry Timothy on 8/5/2023.
//

import UIKit
import Combine
import Foundation
import Firebase

class UpcomingPaymentsVC: UIViewController {
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
        navigationItem.hidesBackButton = true
        setUpTableView()
        ToolBarSetup()
        gradient.frame = view.bounds
        view.layer.addSublayer(gradient)
    }
    
    func setUpTableView() {
        view.addSubview(GraphImage)
        GraphImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 260).isActive = true
        GraphImage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        GraphImage.heightAnchor.constraint(equalToConstant: 110).isActive = true
        GraphImage.widthAnchor.constraint(equalToConstant: 130).isActive = true
        
        view.addSubview(GraphBackground)
        GraphBackground.topAnchor.constraint(equalTo: view.topAnchor, constant: 260).isActive = true
        GraphBackground.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        GraphBackground.heightAnchor.constraint(equalToConstant: 110).isActive = true
        GraphBackground.widthAnchor.constraint(equalToConstant: 130).isActive = true
        
        view.addSubview(SeeUpcomingBillsLabel)
        SeeUpcomingBillsLabel.topAnchor.constraint(equalTo: GraphImage.bottomAnchor, constant: 15).isActive = true
        SeeUpcomingBillsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        SeeUpcomingBillsLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        SeeUpcomingBillsLabel.widthAnchor.constraint(equalToConstant: 280).isActive = true
        
        
        view.addSubview(PlanAhead)
        PlanAhead.topAnchor.constraint(equalTo: SeeUpcomingBillsLabel.bottomAnchor, constant: 20).isActive = true
        PlanAhead.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        PlanAhead.widthAnchor.constraint(equalToConstant: 110).isActive = true
        PlanAhead.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
    }
    
    @objc func goingToAccounts() {
        self.mainCor.Login()
    }
    
    @objc func goingToHome() {
        print("going home")
        self.mainCor.MainMenu()
    }
    
    @objc func goingToPayments() {
        self.mainCor.PayInitial()
    }
    
    @objc func goingToRewards() {
        self.mainCor.CollectionTest()
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
    
    
    let GraphImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(systemName: "calendar.badge.clock")
        imageView.tintColor = UIColor.Background
        imageView.contentMode = .scaleAspectFit
        imageView.layer.zPosition = 3
        return imageView
    }()
    
    var GraphBackground: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.heavy)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.CustomWhite
        label.clipsToBounds = true
        label.layer.cornerRadius = 8.5
        label.sizeToFit()
        return label
    }()
    
    
    var SeeUpcomingBillsLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold)
        label.textColor = UIColor.CustomBlack
        label.backgroundColor = UIColor.clear
        label.text = "Our payments Calendar will help plan for future transactions"
        label.clipsToBounds = true
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    
    var UpcomingLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.regular)
        label.textColor = UIColor.Customgrey
        label.backgroundColor = UIColor.clear
        label.text = "See your upcoming scheduled payments"
        label.clipsToBounds = true
        label.sizeToFit()
        return label
    }()
    
    
    
    var PlanAhead: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(PlanAheadTouched), for: .touchUpInside)
        button.layer.masksToBounds = true
        button.contentMode = .scaleAspectFit
        button.setTitle("Get started", for: .normal)
        button.layer.zPosition = 2
        button.layer.cornerRadius = 17
        return button
    }()
    
    
    @objc func PlanAheadTouched() {
        Alert.show(title: "To continue", message: "Please contact support", vc: self)
        return
    }
    
    
    
}
