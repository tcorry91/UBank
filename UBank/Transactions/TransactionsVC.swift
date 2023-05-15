//
//  TableViewController.swift
//  EatClubTest
//
//  Created by Corry Timothy on 28/5/2022.
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
    var eventArraySearch = [""]
    var Available = ""
    var Balance = ""
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
        setUpTextFieldPublisher()
    }
    
    func changeData() {
        if Balance == Balance {
            BalanceActual.text = Balance
        }
        if Available == Available {
            AvailableAcutal.text = Available
        }
    }
    
    lazy var searchBarBackground: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.zPosition = 1
        label.clipsToBounds = true
        label.layer.borderWidth = 1
        let color = UIColor.gray
        label.layer.borderColor = color.cgColor
        label.layer.cornerRadius = 5
        return label
    }()
    lazy var searchWhiteBackground: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.zPosition = 1
        label.clipsToBounds = true
        label.layer.borderWidth = 1
        let color = UIColor.gray
        label.layer.borderColor = color.cgColor
        label.layer.cornerRadius = 5
        return label
    }()
    lazy var searchTextField: UITextView = {
        let label = UITextView()
        label.textColor = UIColor.black
        label.isHidden = false
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.zPosition = 2
        label.font = UIFont(name: "Arial", size: 16.5)
        label.textAlignment = NSTextAlignment.left
        label.returnKeyType = .done
        label.textContainer.maximumNumberOfLines = 1
        return label
    }()
    lazy var xForSearchImage: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .white
        button.setImage(UIImage(systemName: "clear"), for: .normal)
        button.tintColor = UIColor.black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(clearText), for: .touchUpInside)
        button.layer.masksToBounds = true
        button.contentMode = .scaleAspectFit
        button.layer.zPosition = 2
        return button
    }()
    @objc func clearText() {
        self.generalTextField.text = ""
        DispatchQueue.main.async {
            //            self.data0 = []
            self.tableView.reloadData()
        }
    }
    let searchImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.image = UIImage(systemName: "magnifyingglass")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.layer.zPosition = 2
        return imageView
    }()
    let EmptySearch: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.image = UIImage(systemName: "magnifyingglass.circle")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.layer.zPosition = 2
        return imageView
    }()
    
    var cancellables = Set<AnyCancellable>()
    
    lazy var generalTextField: UITextField = {
        let field = UITextField()
        field.placeholder = ""
        field.backgroundColor = .clear
        field.autocapitalizationType = UITextAutocapitalizationType.none
        field.translatesAutoresizingMaskIntoConstraints = false
        field.layer.zPosition = 2
        field.textColor = UIColor.black
        field.attributedPlaceholder = NSAttributedString(string: "Search Transactions..", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        field.font = UIFont(name: "Arial", size: 15)
        field.textAlignment = NSTextAlignment.left
        field.returnKeyType = .done
        field.keyboardType = .numberPad
        field.keyboardAppearance = .light
        return field
    }()
    
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
                
                DispatchQueue.main.async(execute: {
                    self.tableView.reloadData()
                })
            }
        }, withCancel: nil)
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
    
    func changeState(type: FlightSearch) {
        searchType = type
        changedState()
    }
    func changedState() {
        self.generalTextField.text = ""
        DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
            self.textInput(text: "", type: self.searchType)
            self.tableView.reloadData()
        }
    }
    var searchType: FlightSearch = .departure
    func setUpTextFieldPublisher() {
        generalTextField.textPublisher.sink { value in
            self.textInput(text: value)
        }.store(in: &cancellables)
        
    }
    func textInput(text: String) {
        if text == "" { clearText(); return }
        var t = text.replacingOccurrences(of: " ", with: "+")
        DispatchQueue.main.async {
            
            
            self.searchFIREBASE(text: t)
        }
    }
    
    func searchFIREBASE(text: String) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        //                    let databaseRef = Database.database().reference().child("Drinks")
        let databaseRef = Database.database().reference().child("users").child(uid).child("Transactions").child(self.SelectedAccount)
        let query = databaseRef.queryOrdered(byChild: "Desc").queryStarting(atValue: text).queryEnding(atValue: "\(text)\\uf8ff")
        query.observeSingleEvent(of: .value) { (snapshot) in
            guard snapshot.exists() != false else { return }
            print("WILL THIS WORK", snapshot.value)
            DispatchQueue.main.async {
                // Update TextFields here
                guard let dicta = snapshot.value as? [String:Any] else {
                    print("checking the snapshot", snapshot)
                    return
                    
                }
                print("DICT", dicta)
                
                
                
            }
        }
    }
    
    
    func textInput(text: String, type: FlightSearch) {
        switch type {
        case .departure:
            let searchResults = data1.filter { $0.description.contains(text) }
            text.count < 1 ? update(type: .original, data: []) : update(type: .search, data: searchResults)
        case .arrival:
            let searchResults = data1.filter { $0.description.contains(text) }
            text.count < 1 ? update(type: .original, data: []) : update(type: .search, data: searchResults)
        }
    }
    
    func update(type: DataType, data: [Info]) {
        switch type {
        case .search:
            DispatchQueue.main.async { self.data0 = data; self.tableView.reloadData() }
        case .original:
            DispatchQueue.main.async { self.data0 = self.data1; self.tableView.reloadData() }
        }
    }
    enum FlightSearch  {
        case arrival
        case departure
    }
    enum DataType  {
        case search
        case original
    }
}


