//
//  RewardsVC.swift
//  UBank
//
//  Created by Corry Timothy on 8/5/2023.
//
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var table: UITableView  =   UITableView()
    var models = [Model]()
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
        setupTableViewDetails()
        setUpTableView()
        models.append(Model(text: "Get $10 cash back when you spend $60 or more at your local coffee shop", imageName: "image_1", date: "Ends May 31"))
        models.append(Model(text: "Harrisons Hardware 20% discount on electrical", imageName: "image_2", date: "Expires December 2023"))
        models.append(Model(text: "Robina carwarsh free on Tuesdays", imageName: "image_3", date: "Valid for six months"))
        models.append(Model(text: "Flight Center free travel consulation", imageName: "image_4", date: "Ends June 15"))
        navigationItem.hidesBackButton = true
        table.register(CollectionTableViewCell.nib(), forCellReuseIdentifier: CollectionTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        ToolBarSetup()
        
    }
    
    func setupTableViewDetails() {
        table.delegate      =   self
        table.dataSource    =   self
        table.layer.zPosition = 100
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        table.alwaysBounceVertical = false
        table.backgroundColor = UIColor.CustomWhite
    }
    
    func setUpTableView() {
        self.view.addSubview(self.table)
        table.topAnchor.constraint(equalTo: view.topAnchor, constant: 240).isActive = true
        table.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        table.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        table.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -260).isActive = true
        
        
        view.addSubview(GreeingsLabel)
        GreeingsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 110).isActive = true
        GreeingsLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        GreeingsLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(LogOff)
        LogOff.topAnchor.constraint(equalTo: GreeingsLabel.bottomAnchor, constant: 7).isActive = true
        LogOff.leftAnchor.constraint(equalTo: GreeingsLabel.leftAnchor, constant: 0).isActive = true
        LogOff.widthAnchor.constraint(equalToConstant: 90).isActive = true
        LogOff.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        view.addSubview(CustomBackground)
        CustomBackground.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        CustomBackground.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        CustomBackground.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        CustomBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        view.addSubview(RecommendedLabel)
        RecommendedLabel.topAnchor.constraint(equalTo: self.table.bottomAnchor, constant: 0).isActive = true
        RecommendedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        view.addSubview(RecommendedBackgroundLabel)
        RecommendedBackgroundLabel.topAnchor.constraint(equalTo: RecommendedLabel.bottomAnchor, constant: 15).isActive = true
        RecommendedBackgroundLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        RecommendedBackgroundLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        RecommendedBackgroundLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120).isActive = true
        
        view.addSubview(WoolworthsLabel)
        WoolworthsLabel.topAnchor.constraint(equalTo: RecommendedBackgroundLabel.topAnchor, constant: 5).isActive = true
        WoolworthsLabel.leftAnchor.constraint(equalTo: RecommendedBackgroundLabel.leftAnchor, constant: 30).isActive = true
        WoolworthsLabel.rightAnchor.constraint(equalTo: RecommendedBackgroundLabel.rightAnchor, constant: -30).isActive = true
        
        view.addSubview(WoolworthsLabelEnd)
        WoolworthsLabelEnd.topAnchor.constraint(equalTo: WoolworthsLabel.bottomAnchor, constant: 5).isActive = true
        WoolworthsLabelEnd.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        view.addSubview(WoolworthsImage)
        WoolworthsImage.topAnchor.constraint(equalTo: RecommendedBackgroundLabel.topAnchor, constant: 20).isActive = true
        WoolworthsImage.leftAnchor.constraint(equalTo: RecommendedBackgroundLabel.leftAnchor, constant: 10).isActive = true
        WoolworthsImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        WoolworthsImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
    }
    
    var GreeingsLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.bold)
        label.backgroundColor = .clear
        label.text = "Rewards"
        label.clipsToBounds = true
        label.sizeToFit()
        return label
    }()
    
    var RecommendedLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)
        label.backgroundColor = .clear
        label.text = "Recommended for you"
        label.clipsToBounds = true
        label.sizeToFit()
        return label
    }()
    
    var WoolworthsLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold)
        label.textColor = UIColor.Customgrey
        label.backgroundColor = .clear
        label.text = "Woolworths two for one shoper docket deal"
        label.clipsToBounds = true
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    var WoolworthsLabelEnd: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.regular)
        label.textColor = UIColor.Customgrey
        label.backgroundColor = .clear
        label.text = "Expires Dec 31"
        label.clipsToBounds = true
        label.sizeToFit()
        return label
    }()
    
    
    var RecommendedBackgroundLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 1
        label.font = UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.heavy)
        label.backgroundColor = UIColor.LabelBackground
        label.layer.cornerRadius = 8.5
        label.clipsToBounds = true
        label.sizeToFit()
        return label
    }()
    
    
    var CustomBackground: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 1
        label.font = UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.heavy)
        label.backgroundColor = UIColor.CustomWhite
        label.clipsToBounds = true
        label.sizeToFit()
        return label
    }()
    
    var LogOff: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        button.contentMode = .scaleAspectFit
        button.setTitle("Activated", for: .normal)
        button.setTitleColor(UIColor.Customgrey, for: .normal)
        button.layer.zPosition = 2
        button.layer.cornerRadius = 8.5
        button.layer.borderWidth = 1
        return button
    }()
    
    let WoolworthsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "Woolies")
        imageView.tintColor = UIColor.gray
        imageView.contentMode = .scaleAspectFill
        imageView.layer.zPosition = 3
        return imageView
    }()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
        cell.configure(with: models)
        cell.layer.cornerRadius = 8
        cell.layer.masksToBounds = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 407
    }
    
    @objc func goingToAccounts() {
        self.mainCor.Login()
    }
    
    @objc func goingToHome() {
        self.mainCor.MainMenu()
    }
    
    @objc func goingToPayments() {
        self.mainCor.PayInitial()
    }
    
    @objc func goingToRewards() {
        self.mainCor.CollectionTest()
    }
    
}


struct Model {
    let text: String
    let imageName: String
    let date: String
    
    init(text: String, imageName: String, date: String) {
        self.text = text
        self.imageName = imageName
        self.date = date
    }
}
