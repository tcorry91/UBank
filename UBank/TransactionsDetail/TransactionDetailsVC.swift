//
//  TransactionDetailsVC.swift
//  UBank
//
//  Created by Corry Timothy on 8/5/2023.
//

import UIKit
import Combine
import Foundation
import Firebase

class TransactionDetailsVC: UIViewController {
    let ref = Database.database().reference()
    var events = [Info]()
    var receivedId = ""
    var UserAccount = ""
    var tableView: UITableView  =   UITableView()
    let homeCellID = "homeCellID"
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
        view.backgroundColor = UIColor.white
        self.navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.isTranslucent = true
        view.backgroundColor = UIColor.Background
        setupTableViewDetails()
        setUpTableView()
        fetchData()
    }
    
    @objc func fetchData() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let userMessagesRef = Database.database().reference().child("users").child(uid).child("Transactions").child(UserAccount).child(receivedId)
        userMessagesRef.observeSingleEvent(of: .value, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String: AnyObject] {
                let event = Info(dictionary: dictionary)
                event.id = snapshot.key
                event.Amount = dictionary["Amount"] as? String
                self.events.append(event)
                DispatchQueue.main.async(execute: {
                    self.tableView.reloadData()
                })
            }
        }, withCancel: nil)
    }
}
