//
//  MainCoordinator.swift
//  UBank
//
//  Created by Corry Timothy on 8/5/2023.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var navigationController = UINavigationController()
    func Welcome() {
        let vc = WelcomeVC(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    func start() {
        let vc = LoginVC(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    func Login() {
        let vc = AccountsVC(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    func Accounts(data: String, data1: String, data2: String) {
        let vc = TransactionsVC(coordinator: self)
        vc.SelectedAccount = data
        vc.Available = data1
        vc.Balance = data2
        navigationController.pushViewController(vc, animated: true)
    }
    func TransactionDetails(data: String, data1: String) {
        let vc = TransactionDetailsVC(coordinator: self)
        vc.receivedId = data
        vc.UserAccount = data1
        navigationController.pushViewController(vc, animated: true)
    }
    
    
    func UpcomingPayments() {
        let vc = UpcomingPaymentsVC(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    
    
    
    func MainMenu() {
        let vc = MainMenuVC(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    
    
    func PayInitial() {
        let vc = PayInitialVC(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    
    
    
    func CollectionTest() {
        let vc = ViewController(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    
    
}
