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
    var events = [Info]()
    let ref = Database.database().reference()
    var tableView: UITableView  =   UITableView()
    let homeCellID = "homeCellID"
var currentBalancePass = ""
    var avaliableBalancePass = ""
    var SAccount = ""
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
        guard let uid = Auth.auth().currentUser?.uid else { return }
        self.navigationItem.setHidesBackButton(true, animated: false)
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
    
    @objc func fetchData() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let userMessagesRef = Database.database().reference().child("users").child(uid).child("Accounts")
        userMessagesRef.observe(.childAdded, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String: AnyObject] {
                let event = Info(dictionary: dictionary)
                event.id = snapshot.key
                event.CurrentBalance = dictionary["CurrentBalance"] as? String
                event.AvailableBalance = dictionary["AvailableBalance"] as? String
                event.ProductName = dictionary["ProductName"] as? String
                event.AccountId = dictionary["AccountId"] as? String
                self.events.append(event)
                DispatchQueue.main.async(execute: {
                    self.tableView.reloadData()
                })
            }
        }, withCancel: nil)
    }
}
