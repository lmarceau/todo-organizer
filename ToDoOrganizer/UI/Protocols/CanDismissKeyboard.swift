//
//  CanDismissKeyboard.swift
//  ToDoOrganizer
//
//  Created by Laurie Marceau on 2021-08-17.
//

import UIKit

/// Protocol that adds a gesture to dismiss the keyboard, as well as adding the possibility to listen to keyboard notification
protocol CanDismissKeyboard {
    /// Keeping a reference to the gesture to remove it from the view when keyboard is hidden
    var keyboardDismissTapGesture: UIGestureRecognizer? { get set }

    /// Setup keyboard notification
    func setupKeyboardNotification()

    /// Sends different notifications - will show, will change and will hide
    func keyboardNotification(_ notification: Notification)
}

extension CanDismissKeyboard where Self: UIViewController {

    func setupKeyboardNotification() {
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillShowNotification,
            object: nil,
            queue: nil,
            using: { [weak self] notification in
                self?.keyboardWillShow()
                self?.keyboardNotification(notification)
            }
        )

        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillHideNotification,
            object: nil,
            queue: nil,
            using: { [weak self] notification in
                self?.keyboardWillHide()
                self?.keyboardNotification(notification)
            }
        )

        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillChangeFrameNotification,
            object: nil,
            queue: nil,
            using: { [weak self] notification in
                self?.keyboardNotification(notification)
            }
        )
    }

    func keyboardNotification(_ notification: NSNotification) {}

    mutating func keyboardWillShow() {
        if keyboardDismissTapGesture == nil {
            let gesture = UITapGestureRecognizer(target: view,
                                                 action: #selector(view.endEditing(_:)))
            view.addGestureRecognizer(gesture)
            keyboardDismissTapGesture = gesture
        }
    }

    mutating func keyboardWillHide() {
        if let gesture = keyboardDismissTapGesture {
            view.removeGestureRecognizer(gesture)
            keyboardDismissTapGesture = nil
        }
    }
}
