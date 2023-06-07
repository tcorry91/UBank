//
//  AccountsVC.swift
//  UBank
//
//  Created by Corry Timothy on 8/5/2023.
//

import UIKit
import Firebase
import Combine

class AccountsVC: UIViewController {
    var data = [UBankModel]()
    var data0 = [UbankAccountViewModel]()
    var data1 = [UbankAccountViewModel]()
    let ref = Database.database().reference()
    var tableView: UITableView  =   UITableView()
    let homeCellID = "homeCellID"
    var currentBalancePass = ""
    var avaliableBalancePass = ""
    var SAccount = ""
    var store = Set<AnyCancellable>()
    let clean = Transform()
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
        self.navigationItem.setHidesBackButton(true, animated: false)
        navigationItem.hidesBackButton = true
        view.backgroundColor = UIColor.Background
        setUpTableView()
        setUpTableViewDetails()
        ToolBarSetup()
        fetchData()
    
    }
    @objc func goingToProfile() {
    }
 
    
    let CalendarImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(systemName: "calendar.badge.clock")
        imageView.tintColor = UIColor.gray
        imageView.contentMode = .scaleAspectFit
        imageView.layer.zPosition = 3
        return imageView
    }()
    var AccountsLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.heavy)
        label.textColor = UIColor.CustomBlack
        label.backgroundColor = UIColor.clear
        label.text = "Accounts"
        label.clipsToBounds = true
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
    var WhiteLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.heavy)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.white
        label.clipsToBounds = true
        label.sizeToFit()
        return label
    }()
    
    var UpcomingPaymentsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.clear
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(goingToUpcoming), for: .touchUpInside)
        button.layer.zPosition = 5
        button.layer.cornerRadius = 0
        button.clipsToBounds = true
        button.layer.cornerRadius = 5
        return button
    }()
    
 
    
    @objc func goingToUpcoming() {
        print("going to upcoming payments")
        self.mainCor.UpcomingPayments()
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
    
    @objc func fetchData() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let userMessagesRef = Database.database().reference().child("users").child(uid).child("Accounts")
        userMessagesRef.observe(.childAdded, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String: AnyObject] {
                let event = UBankModel(dictionary: dictionary)
                self.data.append(event)
                self.refactorData(data: self.data)
                DispatchQueue.main.async(execute: {
                    self.tableView.reloadData()
                })
            }
        }, withCancel: nil)
    }
    

    func refactorData(data: [UBankModel]) {
        clean.refactorAndInsertIntoViewModel(data: data).sink { [weak self] completion in
            switch completion {
            case .failure(.message(let error)): self?.callFailureAlert()
            case .finished:  print("case.finished")
            }
        } receiveValue: { (data) in
            self.data0 = data;
            self.data1 = self.data0
            DispatchQueue.main.async {
                self.tableView.reloadData();
                self.tableView.tableFooterView = UIView()
            }
        }.store(in: &store)
    }
    
    func callFailureAlert() {
        print("Failure alert called")
    }
    
    

    
    
}
