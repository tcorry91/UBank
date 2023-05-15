//
//  MainCoordinator.swift
//  FlightCenterRebuiltForGit
//
//  Created by Corry Timothy on 20/4/2023.
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
        let vc = MainViewController(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
//    func goToSecondPage(data: [flightViewModelStruct]) {
//        let vc = FlightDetailsVC(coordinator: self)
//        vc.data4 = dataa
//        self.navigationController.pushViewController(vc, animated: true)
//    }
}
