//
//  Storyboarded.swift
//  ToDoOrganizer
//
//  Created by Laurie Marceau on 2021-08-17.
//

import UIKit

// Copied-in

/// Make your UIViewController subclasses conform to this protocol when:
///  * they are Storyboard-based, and
///  * this ViewController is the inside of your Storyboard
///
/// to be able to instantiate multiple viewControllers from the same Storyboard in a type-safe manner
protocol Storyboarded where Self: UIViewController {
    static var sceneStoryboard: UIStoryboard { get }
    static var storyboardName: String { get }
}

extension Storyboarded {

    /// By default, use the storyboard with the same name as the class
    static var sceneStoryboard: UIStoryboard {
        return UIStoryboard(name: Self.storyboardName, bundle: Bundle(for: self))
    }

    /// By default, the same name as the class
    static var storyboardName: String {
        return String(describing: self)
    }

    static func instantiate() -> Self {
        guard let viewController = sceneStoryboard.instantiateViewController(withIdentifier: String(describing: self)) as? Self else {
            fatalError("The controller of '\(sceneStoryboard)' is not of class '\(self)'")
        }
        return viewController
    }
}
