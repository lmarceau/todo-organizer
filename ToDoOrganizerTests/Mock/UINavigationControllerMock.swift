//
//  UINavigationControllerMock.swift
//  ToDoOrganizerTests
//
//  Created by Laurie Marceau on 2021-08-17.
//

import UIKit

class UINavigationControllerMock: UINavigationController {

    var viewControllerPushed: UIViewController?
    var viewControllerPresented: UIViewController?

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        viewControllerPushed = viewController
        super.pushViewController(viewController, animated: true)
    }

    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        viewControllerPresented = viewControllerToPresent
        super.present(viewControllerToPresent, animated: flag, completion: completion)
        completion?()
    }
}
