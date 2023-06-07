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

class MainMenuVC: UIViewController {
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
        view.backgroundColor = UIColor.Background
        setUpTableView()
        ToolBarSetup()
    }
    
    func setUpTableView() {
        
        
        view.addSubview(GreeingsLabel)
        GreeingsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 110).isActive = true
        GreeingsLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        GreeingsLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(LogOff)
        LogOff.topAnchor.constraint(equalTo: GreeingsLabel.bottomAnchor, constant: 5).isActive = true
        LogOff.leftAnchor.constraint(equalTo: GreeingsLabel.leftAnchor, constant: 0).isActive = true
        LogOff.widthAnchor.constraint(equalToConstant: 110).isActive = true
        LogOff.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(WhiteLabel)
        WhiteLabel.topAnchor.constraint(equalTo: LogOff.bottomAnchor, constant: 125).isActive = true
        WhiteLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        WhiteLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        WhiteLabel.heightAnchor.constraint(equalToConstant: 439).isActive = true
        
        view.addSubview(WhiteLabel2)
        WhiteLabel2.topAnchor.constraint(equalTo: WhiteLabel.bottomAnchor, constant: 15).isActive = true
        WhiteLabel2.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        WhiteLabel2.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        WhiteLabel2.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        view.addSubview(DividerLine)
        DividerLine.topAnchor.constraint(equalTo: WhiteLabel.topAnchor, constant: 60).isActive = true
        DividerLine.leftAnchor.constraint(equalTo: WhiteLabel.leftAnchor, constant: 0).isActive = true
        DividerLine.rightAnchor.constraint(equalTo: WhiteLabel.rightAnchor, constant: 0).isActive = true
        DividerLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        view.addSubview(DividerLine1)
        DividerLine1.topAnchor.constraint(equalTo: DividerLine.bottomAnchor, constant: 125).isActive = true
        DividerLine1.leftAnchor.constraint(equalTo: WhiteLabel.leftAnchor, constant: 0).isActive = true
        DividerLine1.rightAnchor.constraint(equalTo: WhiteLabel.rightAnchor, constant: 0).isActive = true
        DividerLine1.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        view.addSubview(DividerLine2)
        DividerLine2.topAnchor.constraint(equalTo: DividerLine1.bottomAnchor, constant: 125).isActive = true
        DividerLine2.leftAnchor.constraint(equalTo: WhiteLabel.leftAnchor, constant: 0).isActive = true
        DividerLine2.rightAnchor.constraint(equalTo: WhiteLabel.rightAnchor, constant: 0).isActive = true
        DividerLine2.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        view.addSubview(NotificationLabel)
        NotificationLabel.topAnchor.constraint(equalTo: WhiteLabel.topAnchor, constant: 20).isActive = true
        NotificationLabel.leftAnchor.constraint(equalTo: WhiteLabel.leftAnchor, constant: 8).isActive = true
        NotificationLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        NotificationLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        view.addSubview(NotificationNumberLabel)
        NotificationNumberLabel.topAnchor.constraint(equalTo: WhiteLabel.topAnchor, constant: 20).isActive = true
        NotificationNumberLabel.leftAnchor.constraint(equalTo: NotificationLabel.rightAnchor, constant: 5).isActive = true
        NotificationNumberLabel.widthAnchor.constraint(equalToConstant: 20).isActive = true
        NotificationNumberLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        view.addSubview(InformationImage)
        InformationImage.topAnchor.constraint(equalTo: DividerLine.bottomAnchor, constant: 40).isActive = true
        InformationImage.leftAnchor.constraint(equalTo: WhiteLabel.leftAnchor, constant: 15).isActive = true
        InformationImage.widthAnchor.constraint(equalToConstant: 32).isActive = true
        InformationImage.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        
        view.addSubview(IPhoneDescriptionLabel)
        IPhoneDescriptionLabel.topAnchor.constraint(equalTo: DividerLine.bottomAnchor, constant: 20).isActive = true
        IPhoneDescriptionLabel.leftAnchor.constraint(equalTo: InformationImage.rightAnchor, constant: 9).isActive = true
        IPhoneDescriptionLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        IPhoneDescriptionLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        view.addSubview(IPhoneLabel)
        IPhoneLabel.topAnchor.constraint(equalTo: InformationImage.topAnchor, constant: -5).isActive = true
        IPhoneLabel.leftAnchor.constraint(equalTo: InformationImage.rightAnchor, constant: 9).isActive = true
        IPhoneLabel.rightAnchor.constraint(equalTo: WhiteLabel.rightAnchor, constant: 0).isActive = true
        IPhoneLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(BenefitsImage)
        BenefitsImage.topAnchor.constraint(equalTo: DividerLine1.bottomAnchor, constant: 40).isActive = true
        BenefitsImage.leftAnchor.constraint(equalTo: WhiteLabel.leftAnchor, constant: 15).isActive = true
        BenefitsImage.widthAnchor.constraint(equalToConstant: 32).isActive = true
        BenefitsImage.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        view.addSubview(BenefitsDescriptionLabel)
        BenefitsDescriptionLabel.topAnchor.constraint(equalTo: DividerLine1.bottomAnchor, constant: 20).isActive = true
        BenefitsDescriptionLabel.leftAnchor.constraint(equalTo: InformationImage.rightAnchor, constant: 9).isActive = true
        BenefitsDescriptionLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        BenefitsDescriptionLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        view.addSubview(BenefitsLabel)
        BenefitsLabel.topAnchor.constraint(equalTo: BenefitsDescriptionLabel.bottomAnchor, constant: -7).isActive = true
        BenefitsLabel.leftAnchor.constraint(equalTo: InformationImage.rightAnchor, constant: 9).isActive = true
        BenefitsLabel.rightAnchor.constraint(equalTo: WhiteLabel.rightAnchor, constant: 0).isActive = true
        BenefitsLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(RewardImage)
        RewardImage.topAnchor.constraint(equalTo: DividerLine2.bottomAnchor, constant: 40).isActive = true
        RewardImage.leftAnchor.constraint(equalTo: WhiteLabel.leftAnchor, constant: 15).isActive = true
        RewardImage.widthAnchor.constraint(equalToConstant: 32).isActive = true
        RewardImage.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        view.addSubview(RewardDescriptionLabel)
        RewardDescriptionLabel.topAnchor.constraint(equalTo: DividerLine2.bottomAnchor, constant: 20).isActive = true
        RewardDescriptionLabel.leftAnchor.constraint(equalTo: BenefitsImage.rightAnchor, constant: 9).isActive = true
        RewardDescriptionLabel.widthAnchor.constraint(equalToConstant: 180).isActive = true
        RewardDescriptionLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        view.addSubview(RewardLabel)
        RewardLabel.topAnchor.constraint(equalTo: RewardDescriptionLabel.bottomAnchor, constant: -20).isActive = true
        RewardLabel.leftAnchor.constraint(equalTo: BenefitsImage.rightAnchor, constant: 9).isActive = true
        RewardLabel.rightAnchor.constraint(equalTo: WhiteLabel.rightAnchor, constant: 0).isActive = true
        RewardLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(RebatesImage)
        RebatesImage.topAnchor.constraint(equalTo: WhiteLabel2.topAnchor, constant: 15).isActive = true
        RebatesImage.leftAnchor.constraint(equalTo: WhiteLabel.leftAnchor, constant: 15).isActive = true
        RebatesImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
        RebatesImage.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        view.addSubview(RebatesDescriptionLabel)
        RebatesDescriptionLabel.topAnchor.constraint(equalTo: WhiteLabel2.topAnchor, constant: 0).isActive = true
        RebatesDescriptionLabel.leftAnchor.constraint(equalTo: BenefitsImage.rightAnchor, constant: 9).isActive = true
        RebatesDescriptionLabel.rightAnchor.constraint(equalTo: WhiteLabel2.rightAnchor, constant: -10).isActive = true
        //        RebatesDescriptionLabel.widthAnchor.constraint(equalToConstant: 180).isActive = true
        RebatesDescriptionLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        view.addSubview(RebatesLabel)
        RebatesLabel.topAnchor.constraint(equalTo: RebatesDescriptionLabel.bottomAnchor, constant: -25).isActive = true
        RebatesLabel.leftAnchor.constraint(equalTo: BenefitsImage.rightAnchor, constant: 9).isActive = true
        RebatesLabel.rightAnchor.constraint(equalTo: WhiteLabel.rightAnchor, constant: 0).isActive = true
        RebatesLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
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
    
    
    let InformationImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(systemName: "info.circle.fill")
        imageView.tintColor = UIColor.CustomBlack
        imageView.contentMode = .scaleAspectFit
        imageView.layer.zPosition = 3
        return imageView
    }()
    
    let RebatesImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(systemName: "info.square")
        imageView.tintColor = UIColor.CustomBlack
        imageView.contentMode = .scaleAspectFit
        imageView.layer.zPosition = 3
        return imageView
    }()
    
    var RebatesDescriptionLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 10, weight: UIFont.Weight.bold)
        label.textColor = UIColor.CustomBlack
        label.backgroundColor = UIColor.clear
        label.text = "Use Benefits finder to claim rebates"
        label.clipsToBounds = true
        label.sizeToFit()
        return label
    }()
    
    var RebatesLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 10, weight: UIFont.Weight.regular)
        label.textColor = UIColor.CustomBlack
        label.backgroundColor = UIColor.clear
        label.text = "You may be eligible for the Queensland Unclaimed money register."
        label.clipsToBounds = true
        label.sizeToFit()
        label.numberOfLines = 0
        return label
    }()
    
    
    
    let RewardImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(systemName: "star.circle.fill")
        imageView.tintColor = UIColor.CustomBlack
        imageView.contentMode = .scaleAspectFit
        imageView.layer.zPosition = 3
        return imageView
    }()
    
    var RewardDescriptionLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.bold)
        label.textColor = UIColor.CustomBlack
        label.backgroundColor = UIColor.clear
        label.text = "Your new UBank reward"
        label.clipsToBounds = true
        label.sizeToFit()
        //        label.numberOfLines = 0
        return label
    }()
    
    var RewardLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.regular)
        label.textColor = UIColor.CustomBlack
        label.backgroundColor = UIColor.clear
        label.text = "See your new cashback reward from Star Car Wash."
        label.clipsToBounds = true
        label.sizeToFit()
        label.numberOfLines = 0
        return label
    }()
    
    
    let BenefitsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(systemName: "figure.2.and.child.holdinghands")
        imageView.tintColor = UIColor.CustomBlack
        imageView.contentMode = .scaleAspectFit
        imageView.layer.zPosition = 3
        return imageView
    }()
    
    var BenefitsDescriptionLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.bold)
        label.textColor = UIColor.CustomBlack
        label.backgroundColor = UIColor.clear
        label.text = "New benefits you can claim for your business"
        label.clipsToBounds = true
        label.sizeToFit()
        label.numberOfLines = 0
        return label
    }()
    
    var BenefitsLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.regular)
        label.textColor = UIColor.CustomBlack
        label.backgroundColor = UIColor.clear
        label.text = "These grants are updated regularly, find out if you are eligible."
        label.clipsToBounds = true
        label.sizeToFit()
        label.numberOfLines = 0
        return label
    }()
    
    
    
    
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
    
    var DividerLine1: UILabel = {
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
    
    var DividerLine2: UILabel = {
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
        label.layer.cornerRadius = 10.5
        return label
    }()
    
    var WhiteLabel2: UILabel = {
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
        label.layer.cornerRadius = 10.5
        return label
    }()
    
    let GraphImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(systemName: "chart.bar.xaxis")
        imageView.tintColor = UIColor.BankNote
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
    
    var GreeingsLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.heavy)
        label.textColor = UIColor.CustomBlack
        label.backgroundColor = UIColor.clear
        label.text = "Greetings Customer"
        label.clipsToBounds = true
        label.sizeToFit()
        return label
    }()
    
    var NotificationLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.bold)
        label.textColor = UIColor.CustomBlack
        label.backgroundColor = UIColor.clear
        label.text = "Notifications:"
        label.clipsToBounds = true
        label.sizeToFit()
        return label
    }()
    
    var IPhoneLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.regular)
        label.textColor = UIColor.CustomBlack
        label.backgroundColor = UIColor.clear
        label.text = "It's a safe and secure way to pay using the device you use everyday."
        label.clipsToBounds = true
        label.sizeToFit()
        label.numberOfLines = 0
        return label
    }()
    
    var IPhoneDescriptionLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.bold)
        label.textColor = UIColor.CustomBlack
        label.backgroundColor = UIColor.clear
        label.text = "Pay using your iPhone"
        label.clipsToBounds = true
        label.sizeToFit()
        return label
    }()
    
    
    var NotificationNumberLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.regular)
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.red
        label.text = "3"
        label.clipsToBounds = true
        label.sizeToFit()
        label.layer.cornerRadius = 7
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
    
    var LogOff: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(PlanAheadTouched), for: .touchUpInside)
        button.layer.masksToBounds = true
        button.contentMode = .scaleAspectFit
        button.setTitle("Log Off", for: .normal)
        button.layer.zPosition = 2
        button.layer.cornerRadius = 8.5
        return button
    }()
    
    @objc func PlanAheadTouched() {
        print("planning ahead")
        mainCor.start()
    }
    
    
    
}
