//
//  OrganizerTextField.swift
//  ToDoOrganizer
//
//  Created by Laurie Marceau on 2021-08-17.
//

import UIKit

class OrganizerTextField: UITextField {

    func configure(viewModel: OrganizerTextFieldViewModel,
                   delegate: UITextFieldDelegate) {
        self.delegate = delegate
        keyboardType = viewModel.keyboardType
        placeholder = viewModel.textEntryPlaceholder
        accessibilityIdentifier = viewModel.textEntryA11yId
    }

    /// Returns validated text if present
    func getValidatedText() -> String? {
        let savedText = self.text
        guard savedText?.isValid() ?? false else {
            return nil
        }
        text?.removeAll()

        return savedText
    }
}
