//
//  MainCoordinator.swift
//  ToDoOrganizer
//
//  Created by Laurie Marceau on 2021-08-17.
//

import UIKit

class MainCoordinator: Coordinator {

    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        self.showOrganizerView()
    }
}

private extension MainCoordinator {
    func showOrganizerView() {
        let organizerViewModel = OrganizerViewModel()
        let organizerViewController = OrganizerViewController.instantiate(withModel: organizerViewModel)
        navigationController.pushViewController(organizerViewController, animated: false)
    }
}
