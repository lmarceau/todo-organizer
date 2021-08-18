//
//  MainCoordinatorTests.swift
//  ToDoOrganizerTests
//
//  Created by Laurie Marceau on 2021-08-17.
//

import XCTest

@testable import ToDoOrganizer

class MainCoordinatorTests: XCTestCase {

    private var navigationController: UINavigationControllerMock!
    private var mainCoordinator: MainCoordinator!

    override func setUp() {
        super.setUp()
        self.navigationController = UINavigationControllerMock()
        self.mainCoordinator = MainCoordinator(navigationController: navigationController)
    }

    override func tearDown() {
        super.tearDown()
        self.navigationController = nil
        self.mainCoordinator = nil
    }

    func test_coordinatorStart_showOrganizerView() {
        self.mainCoordinator.start()

        guard (navigationController.viewControllerPushed as? OrganizerViewController) != nil else {
            XCTFail("viewControllerPushed is not a OrganizerViewController"); return
        }
    }
}
