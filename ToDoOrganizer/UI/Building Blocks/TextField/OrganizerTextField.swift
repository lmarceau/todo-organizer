//
//  OrganizerTextField.swift
//  ToDoOrganizer
//
//  Created by Laurie Marceau on 2021-08-17.
//

import UIKit

class OrganizerTextField: UITextField {

    private var maxNumberOfCharacter: Int?

    func configure(viewModel: OrganizerTextFieldViewModel) {
        delegate = self
        keyboardType = viewModel.keyboardType
        placeholder = viewModel.textEntryPlaceholder
        accessibilityIdentifier = viewModel.textEntryA11yId
        maxNumberOfCharacter = viewModel.maxNumberOfCharacter
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

extension OrganizerTextField: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        endEditing(true)
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText),
            let max = maxNumberOfCharacter else {
                return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= max
    }
}
