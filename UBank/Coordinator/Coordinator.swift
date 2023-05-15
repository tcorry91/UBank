//
//  Coordinator.swift
//  FlightCenterRebuiltForGit
//
//  Created by Corry Timothy on 20/4/2023.
//

import Foundation
import UIKit

enum Event {
    case buttonTapped
}

protocol Coordinator {
    var navigationController: UINavigationController { get }
    func start()
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}
