//
//  CoordinatorProtocol.swift
//  ToDoOrganizer
//
//  Created by Laurie Marceau on 2021-08-17.
//

import UIKit

// Copied-in

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
