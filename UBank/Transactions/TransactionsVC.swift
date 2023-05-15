//
//  TransactionsVC.swift
//  UBank
//
//  Created by Corry Timothy on 8/5/2023.
//

import UIKit
import Firebase
import Combine

class TransactionsVC: UIViewController {
    var events = [Info]()
    private var usersSubscriper: AnyCancellable?
    var tableView: UITableView  =   UITableView()
    let homeCellID = "homeCellID"
    var SelectedAccount = ""
    var EventId = ""
    var Available = ""
    var Balance = ""
    var eventArraySearch = [Info]()
    var searchBar: UISearchBar = UISearchBar()
    var searching = false
    var searchedTitle = [String]()
    var store = Set<AnyCancellable>()
    var data0 = [Info]()
    var data1 = [Info]()
    let ref = Database.database().reference()
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
        view.backgroundColor = UIColor.CustomWhite
        guard let uid = Auth.auth().currentUser?.uid else { return }
        setUpTableViewDetails()
        setUpTableView()
        ToolBarSetup()
        fetchData()
        changeData()
    }
    
    func changeData() {
        if Balance == Balance {
            BalanceActual.text = Balance
        }
        if Available == Available {
            AvailableAcutal.text = Available
        }
    }
    
 
    
    @objc func fetchData() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let userMessagesRef = Database.database().reference().child("users").child(uid).child("Transactions").child(SelectedAccount)
        userMessagesRef.observe(.childAdded, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String: AnyObject] {
                let event = Info(dictionary: dictionary)
                event.id = snapshot.key
                event.Amount = dictionary["Amount"] as? String
                event.Date = dictionary["Date"] as? String
                event.Desc = dictionary["Desc"] as? String
                event.Time = dictionary["Time"] as? String
                event.CurrentBalance = dictionary["CurrentBalance"] as? String
                event.AvailableBalance = dictionary["AvailableBalance"] as? String
                self.events.append(event)
//                print("eventID here", snapshot.key)
//                self.EventId = snapshot.key
//                print("eventIdFINAL", self.EventId)
                DispatchQueue.main.async(execute: {
                    self.tableView.reloadData()
                })
            }
        }, withCancel: nil)
    }
   
    
    @objc func filterStuff(Text: String) {
        eventArraySearch = []
        for i in 0...events.count - 1 {
            var title = events[i].Desc
            var eventRow = events[i]
            if let title = title {
                if title.contains(Text) {
                    eventArraySearch.append(eventRow)
                }
            }
            if i == events.count - 1 {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    @objc func goingToProfile() {
        
    }
    
    let AccountName: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.layer.zPosition = 5
        label.textAlignment = .center
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
    let AvailableLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Available"
        label.textColor = UIColor.MainTitle
        label.layer.zPosition = 5
        label.textAlignment = .left
        return label
    }()
    let AvailableAcutal: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.CustomBlack
        label.layer.zPosition = 5
        label.textAlignment = .left
        return label
    }()
    let BalanceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Balance"
        label.textColor = UIColor.MainTitle
        label.layer.zPosition = 5
        label.textAlignment = .left
        return label
    }()
    let BalanceActual: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.CustomBlack
        label.layer.zPosition = 5
        label.textAlignment = .left
        return label
    }()
   
}



