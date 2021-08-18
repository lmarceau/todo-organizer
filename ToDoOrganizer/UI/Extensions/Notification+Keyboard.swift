//
//  Notification+Keyboard.swift
//  ToDoOrganizer
//
//  Created by Laurie Marceau on 2021-08-17.
//

import UIKit

extension Notification {
    var shouldMoveButtonForKeyboard: Bool {
        name == UIResponder.keyboardWillChangeFrameNotification || name == UIResponder.keyboardWillShowNotification
    }

    var keyboardSize: CGRect? {
        (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
    }
}
